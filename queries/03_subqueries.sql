SELECT
    products.name,
    products.price,
    categories.name AS category
FROM (
    SELECT category_id, AVG(price) AS avg_price
    FROM products
    GROUP BY category_id
) AS category_avg
INNER JOIN products ON products.category_id = category_avg.category_id
INNER JOIN categories ON products.category_id = categories.id
WHERE products.price > category_avg.avg_price