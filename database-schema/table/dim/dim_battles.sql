-- Table for storing player information
CREATE TABLE dim_players (
    player_id BIGINT PRIMARY KEY,   -- Unique numeric identifier for the player (Primary Key).
    nickname VARCHAR(24) NOT NULL  -- The player's public in-game nickname (Cannot be null).
    registration_date DATE          -- The date the player created their account
);