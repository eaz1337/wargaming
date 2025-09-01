CREATE TABLE dim_maps (
    map_id SERIAL PRIMARY KEY,
    map_name VARCHAR(50) UNIQUE NOT NULL
);

COMMENT ON TABLE dim_maps IS 'Dimension table for game maps.';

COMMENT ON COLUMN dim_maps.map_id IS 'Unique identifier for the map (Primary Key).';
COMMENT ON COLUMN dim_maps.map_name IS 'The in-game name of the map (must be unique).';