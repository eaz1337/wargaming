CREATE TABLE dim_vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_name VARCHAR(50) NOT NULL,
    tier SMALLINT NOT NULL,
    nation VARCHAR(20) NOT NULL
);

CREATE INDEX idx_vehicles_tier ON dim_vehicles(tier);
CREATE INDEX idx_vehicles_nation ON dim_vehicles(nation);

COMMENT ON TABLE dim_vehicles IS 'Dimension table for all in-game vehicles.';

COMMENT ON COLUMN dim_vehicles.vehicle_id IS 'Unique identifier for the vehicle (Primary Key).';
COMMENT ON COLUMN dim_vehicles.vehicle_name IS 'The in-game name of the vehicle.';
COMMENT ON COLUMN dim_vehicles.tier IS 'The tier of the vehicle (e.g., 1-10).';
COMMENT ON COLUMN dim_vehicles.nation IS 'The nation the vehicle belongs to (e.g., "U.S.A.", "Germany").';