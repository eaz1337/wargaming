CREATE TABLE dim_battles (
    battle_id BIGINT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    duration_seconds SMALLINT,
    battle_type_id INT,
    map_id INT,
    winning_team_id SMALLINT,

    PRIMARY KEY (battle_id, start_time),

    FOREIGN KEY (battle_type_id) REFERENCES dim_battle_types(battle_type_id),
    FOREIGN KEY (map_id) REFERENCES dim_maps(map_id)
)
PARTITION BY RANGE (start_time);

CREATE INDEX idx_battles_map_id ON dim_battles(map_id);
CREATE INDEX idx_battles_battle_type_id ON dim_battles(battle_type_id);

COMMENT ON TABLE dim_battles IS 'Table storing metadata for each battle instance. Partitioned by start_time.';

COMMENT ON COLUMN dim_battles.battle_id IS 'Unique identifier for the battle. Part of the composite primary key.';
COMMENT ON COLUMN dim_battles.start_time IS 'The exact date and time the battle started. This is the PARTITION KEY.';
COMMENT ON COLUMN dim_battles.duration_seconds IS 'The total duration of the battle in seconds.';
COMMENT ON COLUMN dim_battles.battle_type_id IS 'Foreign key to the dim_battle_types table.';
COMMENT ON COLUMN dim_battles.map_id IS 'Foreign key to the dim_maps table.';
COMMENT ON COLUMN dim_battles.winning_team_id IS 'The ID of the winning team (e.g., 1 or 2; 0 for a draw).';