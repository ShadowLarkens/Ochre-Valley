import * as z from 'zod';
import { validatorRegistry } from '../validator_registry';

export const ByondBoolean = z.int().min(0).max(1);

export const ByondBooleanOrTrue = ByondBoolean.clone().register(
  validatorRegistry,
  {
    validator_call: 'sanitize_bool(%v, TRUE)',
  },
);

export const ByondBooleanOrFalse = ByondBoolean.clone().register(
  validatorRegistry,
  {
    validator_call: 'sanitize_bool(%v, FALSE)',
  },
);

export const ByondBooleanOrInitial = ByondBoolean.clone().register(
  validatorRegistry,
  {
    validator_call: 'sanitize_bool(%v, initial(%k))',
  },
);

export const ByondHexColor = z
  .stringFormat('color-hex', /^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$/)
  .register(validatorRegistry, {
    validator_call: 'sanitize_hexcolor(%v, 6, TRUE, initial(%k))',
  });

export const ByondTypePath = z.string(); // TODO

export const ByondClampedInt = (min: number, max: number, def: number) => {
  return z.int().register(validatorRegistry, {
    validator_call: `sanitize_integer(%v, ${min}, ${max}, ${def})`,
  });
};

export const ByondClampedFloat = (min: number, max: number, def: number) => {
  return z.float32().register(validatorRegistry, {
    validator_call: `sanitize_float(%v, ${min}, ${max}, 1, ${def})`,
  });
};
