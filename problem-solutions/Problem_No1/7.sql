-- Question 7: Total amounts of virtual currencies player earned and spent in battle.
SELECT
    p.nickname,
    fbr.credits_earned,
    fbr.credits_spent
FROM
    fact_battle_results AS fbr
JOIN
    dim_players AS p ON fbr.player_id = p.player_id
WHERE
    fbr.battle_id = [your_battle_id];