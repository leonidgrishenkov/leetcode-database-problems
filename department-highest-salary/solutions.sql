-- 1
SELECT
	d.name AS "Department",
	e.name AS "Employee",
	e.salary AS "Salary"
FROM Employee e
	JOIN Department d ON e.departmentId = d.id
WHERE (e.departmentId, e.salary) IN (
		SELECT
			departmentId,
			max(salary)
		FROM Employee
		GROUP BY 1
	)
;

-- 2
WITH t AS (
	SELECT
		*,
		dense_rank() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rn
	FROM Employee
)

SELECT
	d.name AS "Department",
	t.name AS "Employee",
	t.salary AS "Salary"
FROM t
	JOIN Department d ON t.departmentId = d.id
WHERE t.rn = 1
;
