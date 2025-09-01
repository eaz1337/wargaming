CREATE TABLE dim_players (
    player_id BIGINT PRIMARY KEY,
    nickname VARCHAR(24) NOT NULL,
    registration_date DATE,
    clan_id BIGINT,

    FOREIGN KEY (clan_id) REFERENCES dim_clans(clan_id)
);

CREATE UNIQUE INDEX idx_players_nickname ON dim_players(nickname);
CREATE INDEX idx_players_registration_date ON dim_players(registration_date);
CREATE INDEX idx_players_clan_id ON dim_players(clan_id);

COMMENT ON TABLE dim_players IS 'Dimension table for storing player information.';
COMMENT ON COLUMN dim_players.player_id IS 'Unique numeric identifier for the player (Primary Key).';
COMMENT ON COLUMN dim_players.nickname IS 'The player''s public in-game nickname (must be unique).';
COMMENT ON COLUMN dim_players.registration_date IS 'The date the player created their account.';
COMMENT ON COLUMN dim_players.clan_id IS 'Foreign key to the dim_clans table, indicating the player''s current clan (NULL if not in a clan).';