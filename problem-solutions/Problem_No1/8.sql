-- Question 8: The reason of player’s death or preliminary leave of the battle.
SELECT
    p.nickname,
    er.reason AS exit_reason
FROM
    fact_battle_results AS fbr
JOIN
    dim_players AS p ON fbr.player_id = p.player_id
JOIN
    dim_exit_reasons AS er ON fbr.exit_reason_id = er.exit_reason_id
WHERE
    fbr.battle_id = [your_battle_id]
    AND fbr.is_survivor = false;