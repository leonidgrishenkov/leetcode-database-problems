-- first, pretty eager
WITH t AS (
	SELECT
		requester_id AS id,
		count(accepter_id) AS num
	FROM RequestAccepted
	GROUP BY 1
),

tt AS (
	SELECT
		accepter_id AS id,
		count(requester_id) AS num
	FROM RequestAccepted
	GROUP BY 1
)

SELECT
	id,
	sum(num) AS num
FROM (
	SELECT
		id,
		num
	FROM t
	UNION ALL
	SELECT
		id,
		num
	FROM tt
) q
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
;

-- optimized
SELECT
	id,
	sum(num) AS num
FROM (
	SELECT
		requester_id AS id,
		count(accepter_id) AS num
	FROM RequestAccepted
	GROUP BY 1
	UNION ALL
	SELECT
		accepter_id AS id,
		count(requester_id) AS num
	FROM RequestAccepted
	GROUP BY 1
) q
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
;

-- even more optimized
SELECT
	id,
	count(*) AS num
FROM (
	SELECT requester_id AS id
	FROM RequestAccepted
	UNION ALL
	SELECT accepter_id AS id
	FROM RequestAccepted
) q
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
;
