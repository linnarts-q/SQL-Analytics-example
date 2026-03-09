SELECT * FROM (
    SELECT
        categories.name,
        customers.name,
        SUM(order_items.quantity * order_items.price_at_purchase) AS total_spent,
        RANK() OVER (PARTITION BY categories.name ORDER BY SUM(order_items.quantity * order_items.price_at_purchase) DESC) AS rank
    FROM categories
    INNER JOIN products ON products.category_id = categories.id
    INNER JOIN order_items ON order_items.product_id = products.id
    INNER JOIN orders ON order_items.order_id = orders.id
    INNER JOIN customers ON orders.customer_id = customers.id
    GROUP BY categories.name, customers.name
           ) AS ranked_customers
WHERE rank = 1