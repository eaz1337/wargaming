CREATE TABLE dim_players (
    player_id BIGINT PRIMARY KEY,
    nickname VARCHAR(24) NOT NULL,
    registration_date DATE
);
CREATE UNIQUE INDEX idx_players_nickname ON dim_players(nickname);
CREATE INDEX idx_players_registration_date ON dim_players(registration_date);


COMMENT ON TABLE dim_players IS 'Dimension table for storing player information.';

COMMENT ON COLUMN dim_players.player_id IS 'Unique numeric identifier for the player (Primary Key).';
COMMENT ON COLUMN dim_players.nickname IS 'The player''s public in-game nickname (must be unique).';
COMMENT ON COLUMN dim_players.registration_date IS 'The date the player created their account.';