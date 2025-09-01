CREATE TABLE dim_battle_types (
    battle_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(50) UNIQUE NOT NULL,
    base_objective VARCHAR(255),
    team_size SMALLINT,
    tier_limit_min SMALLINT,
    tier_limit_max SMALLINT,
    is_event_mode BOOLEAN DEFAULT false
);

COMMENT ON TABLE dim_battle_types IS 'Dimension table for different game modes and their rules.';

COMMENT ON COLUMN dim_battle_types.battle_type_id IS 'Unique identifier for the battle type (Primary Key).';
COMMENT ON COLUMN dim_battle_types.type_name IS 'The name of the game mode (e.g., "Standard", "Assault"), must be unique.';
COMMENT ON COLUMN dim_battle_types.base_objective IS 'Description of the primary win condition.';
COMMENT ON COLUMN dim_battle_types.team_size IS 'The number of players per team (e.g., 15, 30).';
COMMENT ON COLUMN dim_battle_types.tier_limit_min IS 'Minimum vehicle tier allowed (NULL if no limit).';
COMMENT ON COLUMN dim_battle_types.tier_limit_max IS 'Maximum vehicle tier allowed (NULL if no limit).';
COMMENT ON COLUMN dim_battle_types.is_event_mode IS 'Flag to identify temporary or special event modes.';