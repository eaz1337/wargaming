CREATE TABLE dim_currency (
    currency_id SERIAL PRIMARY KEY,
    currency_name VARCHAR(50) UNIQUE NOT NULL
);

COMMENT ON TABLE dim_currency IS 'Lookup table for in-game currencies.';
COMMENT ON COLUMN dim_currency.currency_id IS 'Unique identifier for the currency type (Primary Key).';
COMMENT ON COLUMN dim_currency.currency_name IS 'The name of the currency (e.g., "Credits", "Gold", "Bonds").';