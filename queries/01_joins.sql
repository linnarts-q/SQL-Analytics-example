SELECT
orders.id AS order_id,
customers.name AS customer,
products.name AS product,
order_items.price_at_purchase AS price,
order_items.quantity AS quantity,
(order_items.quantity * order_items.price_at_purchase) AS total

FROM order_items
INNER JOIN orders ON order_items.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN products ON order_items.product_id = products.id