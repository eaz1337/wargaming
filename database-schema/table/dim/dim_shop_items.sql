CREATE TABLE dim_shop_items (
    item_id BIGINT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    item_type VARCHAR(50) NOT NULL,
    item_category VARCHAR(50),
    is_premium BOOLEAN DEFAULT false,
    base_price_credits INT,
    base_price_gold INT,
    base_price_bonds INT
);

CREATE INDEX idx_shop_items_type ON dim_shop_items(item_type);
CREATE INDEX idx_shop_items_category ON dim_shop_items(item_category);

COMMENT ON TABLE dim_shop_items IS 'Dimension table for all items available in the in-game shop or as rewards.';
COMMENT ON COLUMN dim_shop_items.item_id IS 'Unique identifier for the item (Primary Key).';
COMMENT ON COLUMN dim_shop_items.item_name IS 'The name of the item (e.g., "Large Repair Kit", "T-34-85").';
COMMENT ON COLUMN dim_shop_items.item_type IS 'The general type of the item (e.g., "Consumable", "Equipment", "Vehicle").';
COMMENT ON COLUMN dim_shop_items.item_category IS 'A more specific category (e.g., "Ammunition", "Style").';
COMMENT ON COLUMN dim_shop_items.is_premium IS 'Flag indicating if this is a premium item.';
COMMENT ON COLUMN dim_shop_items.base_price_credits IS 'The base price in Credits (NULL if not applicable).';
COMMENT ON COLUMN dim_shop_items.base_price_gold IS 'The base price in Gold (NULL if not applicable).';
COMMENT ON COLUMN dim_shop_items.base_price_bonds IS 'The base price in Bonds (NULL if not applicable).';