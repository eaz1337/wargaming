-- Dimension table for all in-game vehicles
CREATE TABLE dim_vehicles (
    vehicle_id INT PRIMARY KEY,         -- Unique identifier for the vehicle (Primary Key)
    vehicle_name VARCHAR(50) NOT NULL,  -- The in-game name of the vehicle
    tier SMALLINT NOT NULL,             -- The tier of the vehicle (e.g., 1-10)
    nation VARCHAR(20) NOT NULL         -- The nation the vehicle belongs to (e.g., "U.S.A.", "Germany")
);