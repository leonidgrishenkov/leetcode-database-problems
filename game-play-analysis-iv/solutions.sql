-- 1
WITH t AS (
	SELECT
		player_id,
		device_id,
		event_date,
		games_played,
		row_number() OVER (PARTITION BY player_id ORDER BY event_date) AS rn,
		lag(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS lag_event_date
	FROM Activity
)

SELECT round(count(DISTINCT t.player_id)::decimal / (SELECT count(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM t
WHERE rn = 2
	AND (event_date - lag_event_date) = 1
;

-- 2
SELECT round(count(player_id)::decimal / (SELECT count(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity
WHERE (player_id, event_date) IN (
		SELECT
			player_id,
			min(event_date) + 1
		FROM Activity
		GROUP BY 1
	)
;
