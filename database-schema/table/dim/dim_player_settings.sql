-- The single, master dimension table for ALL player settings
CREATE TABLE dim_player_settings (
    settings_id SERIAL PRIMARY KEY,              -- Unique ID for the entire combination of settings
    settings_hash VARCHAR(64) UNIQUE NOT NULL,   -- A single hash for ALL settings combined
    texture_quality VARCHAR(20),
    shadow_quality VARCHAR(20),
    is_destruction_physics_enabled BOOLEAN,
    master_volume SMALLINT,
    voice_chat_enabled BOOLEAN,
    mouse_sensitivity SMALLINT,

);