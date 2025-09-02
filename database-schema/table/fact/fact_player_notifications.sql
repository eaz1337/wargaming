CREATE TABLE fact_player_notifications (
    notification_sk BIGSERIAL NOT NULL, 
    notification_time TIMESTAMP NOT NULL, 
    notification_type_id INT NOT NULL,  
    sender_player_id BIGINT,            
    receiver_player_id BIGINT NOT NULL, 
    message_content TEXT NOT NULL,      
    is_read BOOLEAN DEFAULT FALSE,      
    read_time TIMESTAMP,                

    PRIMARY KEY (notification_sk, notification_time),

    FOREIGN KEY (notification_type_id) REFERENCES dim_notification_types(notification_type_id),
    FOREIGN KEY (sender_player_id) REFERENCES dim_players(player_id),
    FOREIGN KEY (receiver_player_id) REFERENCES dim_players(player_id)
)
PARTITION BY RANGE (notification_time);

CREATE INDEX idx_fpn_receiver_player_id ON fact_player_notifications(receiver_player_id);
CREATE INDEX idx_fpn_sender_player_id ON fact_player_notifications(sender_player_id);
CREATE INDEX idx_fpn_notification_type_id ON fact_player_notifications(notification_type_id);
CREATE INDEX idx_fpn_is_read ON fact_player_notifications(is_read);

COMMENT ON TABLE fact_player_notifications IS 'Fact table logging all in-game notifications and messages sent to players. Partitioned by notification_time.';
COMMENT ON COLUMN fact_player_notifications.notification_sk IS 'Surrogate key for each individual notification instance.';
COMMENT ON COLUMN fact_player_notifications.notification_time IS 'The timestamp when the notification was sent or generated. This is the PARTITION KEY.';
COMMENT ON COLUMN fact_player_notifications.notification_type_id IS 'Foreign key to the dim_notification_types table, specifying the type of notification.';
COMMENT ON COLUMN fact_player_notifications.sender_player_id IS 'Foreign key to dim_players for the sender of the message (NULL for system-generated notifications).';
COMMENT ON COLUMN fact_player_notifications.receiver_player_id IS 'Foreign key to dim_players for the recipient of the notification.';
COMMENT ON COLUMN fact_player_notifications.message_content IS 'The full text content of the notification or message.';
COMMENT ON COLUMN fact_player_notifications.is_read IS 'Boolean flag indicating whether the player has read the notification.';
COMMENT ON COLUMN fact_player_notifications.read_time IS 'Timestamp when the notification was marked as read (NULL if not yet read).';