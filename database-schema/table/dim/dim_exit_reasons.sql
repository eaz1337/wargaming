CREATE TABLE dim_exit_reasons (
    exit_reason_id SERIAL PRIMARY KEY,
    reason VARCHAR(50) UNIQUE NOT NULL
);

COMMENT ON TABLE dim_exit_reasons IS 'Lookup table for reasons a player leaves a battle.';

COMMENT ON COLUMN dim_exit_reasons.exit_reason_id IS 'Unique identifier for the exit reason (Primary Key).';
COMMENT ON COLUMN dim_exit_reasons.reason IS 'Description of the reason (e.g., "Vehicle destroyed", "Player left"), must be unique.';