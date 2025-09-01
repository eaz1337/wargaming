CREATE TABLE dim_tournaments (
    tournament_id BIGINT PRIMARY KEY,
    tournament_name VARCHAR(255) NOT NULL,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    tournament_type VARCHAR(50),
    rules_url VARCHAR(512)
);

CREATE INDEX idx_tournaments_start_date ON dim_tournaments(start_date);
CREATE INDEX idx_tournaments_type ON dim_tournaments(tournament_type);

COMMENT ON TABLE dim_tournaments IS 'Dimension table for e-sports and other in-game tournaments.';
COMMENT ON COLUMN dim_tournaments.tournament_id IS 'Unique identifier for the tournament (Primary Key).';
COMMENT ON COLUMN dim_tournaments.tournament_name IS 'The official name of the tournament.';
COMMENT ON COLUMN dim_tournaments.start_date IS 'The start date and time of the tournament.';
COMMENT ON COLUMN dim_tournaments.end_date IS 'The end date and time of the tournament.';
COMMENT ON COLUMN dim_tournaments.tournament_type IS 'The type or format of the tournament (e.g., "1v1", "3v3", "Clan").';
COMMENT ON COLUMN dim_tournaments.rules_url IS 'A URL link to the official tournament rules.';