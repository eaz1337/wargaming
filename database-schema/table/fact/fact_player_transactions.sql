CREATE TABLE fact_player_transactions (
    transaction_id BIGINT NOT NULL,
    transaction_time TIMESTAMP NOT NULL,
    player_id BIGINT NOT NULL,
    item_id BIGINT,
    transaction_type VARCHAR(20) NOT NULL,
    amount_credits INT,
    amount_gold INT,
    amount_bonds INT,
    amount_free_xp INT,

    PRIMARY KEY (transaction_id, transaction_time),

    FOREIGN KEY (player_id) REFERENCES dim_players(player_id),
    FOREIGN KEY (item_id) REFERENCES dim_shop_items(item_id)
)
PARTITION BY RANGE (transaction_time);

CREATE INDEX idx_transactions_player_id ON fact_player_transactions(player_id);
CREATE INDEX idx_transactions_item_id ON fact_player_transactions(item_id);
CREATE INDEX idx_transactions_type ON fact_player_transactions(transaction_type);

COMMENT ON TABLE fact_player_transactions IS 'Fact table logging all player economic activities. Partitioned by transaction_time.';
COMMENT ON COLUMN fact_player_transactions.transaction_id IS 'Unique identifier for the transaction. Part of the composite primary key.';
COMMENT ON COLUMN fact_player_transactions.transaction_time IS 'The exact time of the transaction. This is the PARTITION KEY.';
COMMENT ON COLUMN fact_player_transactions.player_id IS 'Foreign key to the dim_players table.';
COMMENT ON COLUMN fact_player_transactions.item_id IS 'Foreign key to the dim_shop_items table (NULL for currency-only transactions).';
COMMENT ON COLUMN fact_player_transactions.transaction_type IS 'Type of transaction (e.g., "purchase", "sale", "reward", "expense").';
COMMENT ON COLUMN fact_player_transactions.amount_credits IS 'The change in Credits (can be positive or negative).';
COMMENT ON COLUMN fact_player_transactions.amount_gold IS 'The change in Gold (can be positive or negative).';
COMMENT ON COLUMN fact_player_transactions.amount_bonds IS 'The change in Bonds (can be positive or negative).';
COMMENT ON COLUMN fact_player_transactions.amount_free_xp IS 'The change in Free Experience (can be positive or negative).';