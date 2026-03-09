SELECT
    month,
    revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS diff,
    LAG(revenue) OVER (ORDER BY month) as prev_revenue
FROM (
    SELECT
        strftime('%Y-%m', orders.created_at) AS month,
        SUM (order_items.quantity * order_items.price_at_purchase) AS revenue
    FROM order_items
    INNER JOIN orders ON order_items.order_id = orders.id
    GROUP BY month
) AS monthly_revenue