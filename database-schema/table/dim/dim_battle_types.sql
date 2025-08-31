-- Dimension table for different game modes and their rules
CREATE TABLE dim_battle_types (
    battle_type_id SERIAL PRIMARY KEY,       -- Unique identifier for the battle type (Primary Key)
    type_name VARCHAR(50) NOT NULL,          -- The name of the game mode (e.g., "Standard", "Assault")
    base_objective VARCHAR(255),             -- Description of the primary win condition
    team_size SMALLINT,                      -- The number of players per team (e.g., 15, 30)
    tier_limit_min SMALLINT,                 -- Minimum vehicle tier allowed (NULL if no limit)
    tier_limit_max SMALLINT,                 -- Maximum vehicle tier allowed (NULL if no limit)
    is_event_mode BOOLEAN DEFAULT false      -- Flag to identify temporary or special event modes
);