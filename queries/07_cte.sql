WITH order_counts AS(
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT
    CASE
    WHEN order_count = 1 THEN 'one_time'
    WHEN order_count BETWEEN 2 AND 5 THEN 'regular'
    ELSE 'vip'
    END AS segment,
    COUNT(*) AS customer_count
FROM order_counts
GROUP BY segment