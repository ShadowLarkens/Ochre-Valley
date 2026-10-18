import * as z from 'zod';

export type ValidatorMeta = {
  /**
   * String in the format of `func_to_call(%v, arg1, %k)`
   * %k is the target variable to set
   * %v is the value from the savefile
   */
  validator_call: string;
};

export const validatorRegistry = z.registry<ValidatorMeta>();
