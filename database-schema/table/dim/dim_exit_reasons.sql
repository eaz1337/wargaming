-- Lookup table for reasons a player leaves a battle
CREATE TABLE dim_exit_reasons (
    exit_reason_id SERIAL PRIMARY KEY,  -- Unique identifier for the exit reason (Primary Key)
    reason VARCHAR(50) UNIQUE NOT NULL  -- Description of the reason (e.g., "Vehicle destroyed", "Player left")
);