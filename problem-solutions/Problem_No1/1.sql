-- Question 1: The date and time of each battle started as well as battle’s duration.
SELECT
    battle_id,
    start_time,
    duration_seconds
FROM
    dim_battles
ORDER BY
    start_time DESC
LIMIT 100;