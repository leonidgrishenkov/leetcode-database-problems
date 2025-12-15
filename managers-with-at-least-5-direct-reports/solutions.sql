-- 1

SELECT name
FROM Employee
WHERE id IN (
		SELECT m.id
		FROM Employee m
			JOIN Employee e ON m.id = e.managerId
		GROUP BY m.id
		HAVING count(e.id) >= 5
	)
;

-- 2
SELECT m.name
FROM Employee m
	JOIN Employee e ON m.id = e.managerId
GROUP BY m.id, m.name
HAVING count(e.id) >= 5
;

-- 3
SELECT name
FROM Employee
WHERE id IN (
		SELECT managerId
		FROM Employee
		GROUP BY 1
		HAVING count(*) >= 5
	)
;
