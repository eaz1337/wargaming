-- Dimension table for game maps
CREATE TABLE dim_maps (
    map_id SERIAL PRIMARY KEY,      -- Unique identifier for the map (Primary Key)
    map_name VARCHAR(50) UNIQUE NOT NULL -- The in-game name of the map (must be unique)
);