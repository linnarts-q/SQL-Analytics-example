SELECT * FROM (SELECT customers.id           AS customer_id,
                      orders.created_at,
                      orders.id AS order_id,
                      ROW_NUMBER()              OVER (PARTITION BY customer_id ORDER BY orders.created_at) AS row_number
               FROM orders
               INNER JOIN customers ON orders.customer_id = customers.id
               )
AS number_row
WHERE row_number = 1