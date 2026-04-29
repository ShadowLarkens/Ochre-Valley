#define RURAL_TAX 50 // Free money. A small safety pool for lowpop mostly. The floor at/above RURAL_TAX_POP_HIGH players.
#define RURAL_TAX_LOWPOP 150 // Lowpop bonus: at/below RURAL_TAX_POP_LOW players, this amount is minted instead.
#define RURAL_TAX_POP_LOW 12 // At or below this active player count, RURAL_TAX_LOWPOP applies.
#define RURAL_TAX_POP_HIGH 50 // At or above this active player count, RURAL_TAX applies. Linearly interpolated between.
#define TREASURY_TICK_AMOUNT 6 MINUTES
