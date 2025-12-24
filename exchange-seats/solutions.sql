-- original
SELECT *
FROM seat;

-- solutions

-- 1
SELECT
	CASE WHEN id % 2 = 0 THEN id - 1
		WHEN (id % 2 = 1 AND id = (SELECT max(id) FROM seat)) THEN id
		ELSE id + 1
	END AS id,
	student
FROM seat
ORDER BY 1;
