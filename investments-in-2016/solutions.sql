WITH t AS (
	SELECT
		tiv_2016,
		count(*) OVER (PARTITION BY tiv_2015) - 1 AS tiv_2015_cnt,
		count(*) OVER (PARTITION BY lat, lon) - 1 AS loc_cnt
	FROM Insurance
)

SELECT round(sum(t.tiv_2016)::decimal, 2) AS tiv_2016
FROM t
WHERE tiv_2015_cnt <> 0 AND loc_cnt = 0
;
