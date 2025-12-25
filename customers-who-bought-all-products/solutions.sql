SELECT
	customer_id,
	product_key
FROM customer
ORDER BY 1, 2;

SELECT *
FROM product;

-- 1
WITH t AS (
	SELECT
		customer_id,
		count(DISTINCT product_key) bought_products,
		(SELECT count(DISTINCT product_key) FROM product) AS total_products
	FROM customer
	GROUP BY 1
)

SELECT customer_id
FROM t
WHERE bought_products = total_products;

-- 2
SELECT customer_id
FROM customer
GROUP BY 1
HAVING count(DISTINCT product_key) = (
		SELECT count(product_key) FROM product
	);
