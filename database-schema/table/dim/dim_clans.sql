CREATE TABLE dim_clans (
    clan_id BIGINT PRIMARY KEY,
    clan_name VARCHAR(100) NOT NULL,
    clan_tag VARCHAR(5) UNIQUE NOT NULL,
    motto VARCHAR(255),
    leader_player_id BIGINT,
    creation_date DATE NOT NULL,
    member_count INT,
    is_recruiting BOOLEAN
);

CREATE INDEX idx_clans_leader_player_id ON dim_clans(leader_player_id);

COMMENT ON TABLE dim_clans IS 'Dimension table for clans in the game.';
COMMENT ON COLUMN dim_clans.clan_id IS 'Unique identifier for the clan (Primary Key).';
COMMENT ON COLUMN dim_clans.clan_name IS 'The full name of the clan.';
COMMENT ON COLUMN dim_clans.clan_tag IS 'The short, unique tag of the clan (e.g., [WG]).';
COMMENT ON COLUMN dim_clans.motto IS 'The clan''s motto or description.';
COMMENT ON COLUMN dim_clans.leader_player_id IS 'The player_id of the clan leader.';
COMMENT ON COLUMN dim_clans.creation_date IS 'The date the clan was founded.';
COMMENT ON COLUMN dim_clans.member_count IS 'The current number of members in the clan.';
COMMENT ON COLUMN dim_clans.is_recruiting IS 'Flag indicating if the clan is open for new members.';