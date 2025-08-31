-- Question 2: The type of each battle (type = scenario = set or rules/restrictions).
SELECT
    b.battle_id,
    b.start_time,
    bt.type_name AS battle_type
FROM
    dim_battles AS b
JOIN
    dim_battle_types AS bt ON b.battle_type_id = bt.battle_type_id
ORDER BY
    b.start_time DESC
LIMIT 100;