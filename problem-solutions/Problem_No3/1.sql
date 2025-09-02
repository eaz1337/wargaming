WITH battle_outcomes AS (
    SELECT
        fbr.player_id,
        b.start_time,
        CASE
            WHEN fbr.team_id = b.winning_team_id THEN 1
            ELSE 0
        END AS is_win
    FROM
        fact_battle_results AS fbr
    JOIN
        dim_battles AS b ON fbr.battle_id = b.battle_id AND fbr.battle_start_time = b.start_time
),

ranked_battles AS (
    SELECT
        player_id,
        start_time,
        is_win,
        ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY start_time) AS overall_rank
    FROM
        battle_outcomes
),

win_groups AS (
    SELECT
        player_id,
        overall_rank - ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY start_time) AS streak_group
    FROM
        ranked_battles
    WHERE
        is_win = 1
),

streak_lengths AS (
    SELECT
        player_id,
        COUNT(*) AS streak_length
    FROM
        win_groups
    GROUP BY
        player_id,
        streak_group
)


SELECT
    p.nickname,
    MAX(sl.streak_length) AS longest_win_streak
FROM
    streak_lengths AS sl
JOIN
    dim_players AS p ON sl.player_id = p.player_id
GROUP BY
    p.nickname
ORDER BY
    longest_win_streak DESC;