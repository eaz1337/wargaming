-- Question 5: Information about what players were in what team as well as team that won battle.
SELECT
    p.nickname,
    fbr.team_id,
    b.winning_team_id
FROM
    fact_battle_results AS fbr
JOIN
    dim_players AS p ON fbr.player_id = p.player_id
JOIN
    dim_battles AS b ON fbr.battle_id = b.battle_id
WHERE
    fbr.battle_id = [your_battle_id];