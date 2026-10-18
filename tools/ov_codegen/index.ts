import Bun from 'bun';
import type * as z from 'zod';

import { VoreSavefile } from './schemas';
import { validatorRegistry } from './validator_registry';

// Codegen
const resolve_validator = (
  validator_call: string,
  target: string,
  value: string,
) => {
  return validator_call.replaceAll('%v', value).replaceAll('%k', target);
};

type ZodReducer<T extends z.ZodType> = (
  obj: T,
  target: string,
  value: string,
) => Promise<string[]>;

const zod_reducer_literal: ZodReducer<z.ZodLiteral> = async (
  obj,
  target,
  value,
) => {
  if (!obj.value) {
    return [`#error Unable to parse literal at ${value}`];
  }
  return [`if(${value} != ${obj.value.toString()})\treturn`];
};

const zod_reducer_number: ZodReducer<z.ZodNumber> = async (
  obj,
  target,
  value,
) => {
  const meta = validatorRegistry.get(obj);
  if (meta) {
    return [
      `${target} = ${resolve_validator(meta.validator_call, target, value)}`,
    ];
  }
  return [`${target} = text2num(${value})`];
};

const zod_reducer_object: ZodReducer<z.ZodObject> = async (
  obj,
  target,
  value,
) => {
  let array: string[] = [];
  for (const [k, v] of Object.entries(obj.shape)) {
    array = array.concat(
      await zod_reducer(v, `${target}.${k}`, `${value}["${k}"]`),
    );
  }
  return array;
};

const zod_reducer_record: ZodReducer<z.ZodRecord> = async (
  obj,
  target,
  value,
) => {
  return [
    `do {
${target} = ${value};
if(!islist(${target})) {${target} = list(); break;}
for(var/x in ${target}); { ${await zod_reducer(obj.valueType as any, `${target}[x]`, `${target}[x]`)} };
} while(FALSE);`.replaceAll('\n', ' '),
  ];
};

const zod_reducer_string: ZodReducer<z.ZodString> = async (
  obj,
  target,
  value,
) => {
  const meta = validatorRegistry.get(obj);
  if (meta) {
    return [
      `${target} = ${resolve_validator(meta.validator_call, target, value)}`,
    ];
  }
  return [`${target} = ${value}`];
};

const zod_reducer: ZodReducer<z.ZodType> = async (obj, target, value) => {
  switch (obj.type) {
    case 'literal':
      return zod_reducer_literal(obj as any, target, value);
    case 'number':
      return zod_reducer_number(obj as any, target, value);
    case 'object':
      return zod_reducer_object(obj as any, target, value);
    case 'record':
      return zod_reducer_record(obj as any, target, value);
    case 'string':
      return zod_reducer_string(obj as any, target, value);
    default:
      console.error('Unknown property type', obj.type, target, value);
      return [];
  }
};

const generate_vore_json_parser = async () => {
  const statements = await zod_reducer(VoreSavefile, 'src', 'value');
  console.log('---statements---');
  console.log(statements.join('\n'));
};

const test_against_savefile = async () => {
  const savefile = Bun.file('./character1.json');
  const text = await savefile.json();

  const valid = VoreSavefile.safeParse(text);
  if (!valid.success) {
    console.log('Invalid', valid.error);
  } else {
    console.log('Valid');
  }
};

generate_vore_json_parser();
// test_against_savefile();
