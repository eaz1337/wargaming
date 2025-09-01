CREATE TABLE fact_battle_results (
    battle_id BIGINT NOT NULL,
    battle_start_time TIMESTAMP NOT NULL,
    player_id BIGINT NOT NULL,
    vehicle_id INT NOT NULL,
    settings_id INT,
    team_id SMALLINT NOT NULL,
    damage_dealt INT,
    damage_assisted INT,
    damage_received INT,
    credits_earned INT,
    credits_spent INT,
    is_survivor BOOLEAN,
    exit_reason_id INT,
    destroyer_player_id BIGINT,

    PRIMARY KEY (battle_id, player_id, battle_start_time),

    FOREIGN KEY (battle_id, battle_start_time) REFERENCES dim_battles(battle_id, start_time),
    FOREIGN KEY (player_id) REFERENCES dim_players(player_id),
    FOREIGN KEY (vehicle_id) REFERENCES dim_vehicles(vehicle_id),
    FOREIGN KEY (exit_reason_id) REFERENCES dim_exit_reasons(exit_reason_id),
    FOREIGN KEY (settings_id) REFERENCES dim_player_settings(settings_id),
    FOREIGN KEY (destroyer_player_id) REFERENCES dim_players(player_id)
)
PARTITION BY RANGE (battle_start_time);


CREATE INDEX idx_fbr_player_id ON fact_battle_results(player_id);
CREATE INDEX idx_fbr_vehicle_id ON fact_battle_results(vehicle_id);
CREATE INDEX idx_fbr_settings_id ON fact_battle_results(settings_id);
CREATE INDEX idx_fbr_destroyer_player_id ON fact_battle_results(destroyer_player_id);
CREATE INDEX idx_fbr_battle_id_time ON fact_battle_results(battle_id, battle_start_time);


COMMENT ON TABLE fact_battle_results IS 'Central fact table storing results for each player in each battle.';

COMMENT ON COLUMN fact_battle_results.battle_id IS 'Part of the composite foreign key to dim_battles.';
COMMENT ON COLUMN fact_battle_results.battle_start_time IS 'Part of the composite foreign key to dim_battles and the PARTITION KEY for this table.';
COMMENT ON COLUMN fact_battle_results.player_id IS 'Foreign key to the dim_players table.';
COMMENT ON COLUMN fact_battle_results.vehicle_id IS 'Foreign key to the dim_vehicles table.';
COMMENT ON COLUMN fact_battle_results.settings_id IS 'Foreign key to the dim_player_settings table.';
COMMENT ON COLUMN fact_battle_results.team_id IS 'The team the player was on (e.g., 1 or 2).';
COMMENT ON COLUMN fact_battle_results.damage_dealt IS 'Total damage dealt by the player.';
COMMENT ON COLUMN fact_battle_results.damage_assisted IS 'Total damage assisted by the player (spotting, tracking).';
COMMENT ON COLUMN fact_battle_results.damage_received IS 'Total damage received by the player.';
COMMENT ON COLUMN fact_battle_results.credits_earned IS 'Virtual currency earned in the battle (net).';
COMMENT ON COLUMN fact_battle_results.credits_spent IS 'Virtual currency spent in the battle (e.g., on ammo, repairs).';
COMMENT ON COLUMN fact_battle_results.is_survivor IS 'True if the player''s vehicle survived the battle.';
COMMENT ON COLUMN fact_battle_results.exit_reason_id IS 'Foreign key to dim_exit_reasons (NULL if player survived).';
COMMENT ON COLUMN fact_battle_results.destroyer_player_id IS 'The player_id of the enemy who destroyed this player''s vehicle.';