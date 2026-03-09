SELECT customers.name AS customer, COUNT(*) AS order_count
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
GROUP BY customer_id
HAVING COUNT(*) > 1