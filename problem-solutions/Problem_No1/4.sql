-- Question 4: The list of all players participated in battle.
SELECT
    p.nickname
FROM
    fact_battle_results AS fbr
JOIN
    dim_players AS p ON fbr.player_id = p.player_id
WHERE
    fbr.battle_id = [your_battle_id];