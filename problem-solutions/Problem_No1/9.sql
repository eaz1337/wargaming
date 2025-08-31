-- Question 9: Information on player’s destroyer (name or ID of another player who destroyed player’s vehicle).
SELECT
    victim.nickname AS player_nickname,
    destroyer.nickname AS destroyer_nickname
FROM
    fact_battle_results AS fbr
JOIN
    dim_players AS victim ON fbr.player_id = victim.player_id
LEFT JOIN
    dim_players AS destroyer ON fbr.destroyer_player_id = destroyer.player_id
WHERE
    fbr.battle_id = [your_battle_id]
    AND fbr.is_survivor = false;