-- Problem 4: Gather specific daily metrics for each player.
-- This query uses window functions to rank battles and conditional aggregation
-- to pivot the required data into columns.

WITH daily_battle_details AS (
    -- Step 1: Join the necessary tables and determine the outcome of each battle.
    -- Also, cast the timestamp to a date for daily grouping.
    SELECT
        fbr.player_id,
        b.start_time AS battle_start_time,
        CAST(b.start_time AS DATE) AS battle_date,
        fbr.damage_dealt,
        fbr.kills,
        CASE
            WHEN b.winning_team_id = 0 THEN 'draw'
            WHEN fbr.team_id = b.winning_team_id THEN 'win'
            ELSE 'loss'
        END AS outcome
    FROM
        fact_battle_results AS fbr
    JOIN
        dim_battles AS b ON fbr.battle_id = b.battle_id AND fbr.battle_start_time = b.start_time
),

ranked_battles AS (
    SELECT
        player_id,
        battle_date,
        battle_start_time,
        damage_dealt,
        kills,
        outcome,
        ROW_NUMBER() OVER (PARTITION BY player_id, battle_date, outcome ORDER BY battle_start_time) AS battle_rank
    FROM
        daily_battle_details
)

SELECT
    p.nickname,
    rb.battle_date,
    MAX(CASE WHEN rb.outcome = 'win' AND rb.battle_rank = 7 THEN rb.damage_dealt END) AS damage_in_7th_win,
    MAX(CASE WHEN rb.outcome = 'loss' AND rb.battle_rank = 3 THEN rb.kills END) AS kills_in_3rd_loss,
    MAX(CASE WHEN rb.outcome = 'draw' AND rb.battle_rank = 1 THEN rb.battle_start_time END) AS timestamp_of_1st_draw
FROM
    ranked_battles AS rb
JOIN
    dim_players AS p ON rb.player_id = p.player_id
GROUP BY
    p.nickname,
    rb.battle_date
ORDER BY
    p.nickname,
    rb.battle_date;