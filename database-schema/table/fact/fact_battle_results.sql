-- Central fact table storing results for each player in each battle
CREATE TABLE fact_battle_results (
    battle_id BIGINT NOT NULL,              -- Foreign key to the dim_battles table
    player_id BIGINT NOT NULL,              -- Foreign key to the dim_players table
    vehicle_id INT NOT NULL,                -- Foreign key to the dim_vehicles table
    graphics_preset_id INT,                 -- Foreign key to the dim_graphics_presets table
    team_id SMALLINT NOT NULL,              -- The team the player was on (e.g., 1 or 2)
    damage_dealt INT,                       -- Total damage dealt by the player
    damage_assisted INT,                    -- Total damage assisted by the player
    damage_received INT,                    -- Total damage received by the player
    credits_earned INT,                     -- Virtual currency earned in the battle
    credits_spent INT,                      -- Virtual currency spent in the battle (e.g., on ammo, repairs)
    is_survivor BOOLEAN,                    -- True if the player's vehicle survived the battle
    exit_reason_id INT,                     -- Foreign key to dim_exit_reasons (NULL if player survived)
    destroyer_player_id BIGINT,             -- The player_id of the enemy who destroyed this player's vehicle (NULL if survived or destroyed by non-player events)

    PRIMARY KEY (battle_id, player_id),     -- Composite primary key ensures a player appears only once per battle

    FOREIGN KEY (battle_id) REFERENCES dim_battles(battle_id),
    FOREIGN KEY (player_id) REFERENCES dim_players(player_id),
    FOREIGN KEY (vehicle_id) REFERENCES dim_vehicles(vehicle_id),
    FOREIGN KEY (exit_reason_id) REFERENCES dim_exit_reasons(exit_reason_id),
    FOREIGN KEY (graphics_preset_id) REFERENCES dim_graphics_presets(preset_id),
    FOREIGN KEY (destroyer_player_id) REFERENCES dim_players(player_id)
);