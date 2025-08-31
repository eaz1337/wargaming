-- Question 6: Total performance of each player (damage dealt, damage assisted, damage received, etc.)
SELECT
    p.nickname,
    fbr.damage_dealt,
    fbr.damage_assisted,
    fbr.damage_received
FROM
    fact_battle_results AS fbr
JOIN
    dim_players AS p ON fbr.player_id = p.player_id
WHERE
    fbr.battle_id = [your_battle_id]
ORDER BY
    fbr.damage_dealt DESC;