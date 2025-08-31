-- Question 3: The type of map/arena (type = name and/or ID) where battle took place.
SELECT
    b.battle_id,
    b.start_time,
    m.map_name
FROM
    dim_battles AS b
JOIN
    dim_maps AS m ON b.map_id = m.map_id
ORDER BY
    b.start_time DESC
LIMIT 100;