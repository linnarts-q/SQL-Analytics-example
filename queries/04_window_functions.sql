SELECT * FROM (
    SELECT
        categories.name AS category,
        products.name,
        products.price,
        RANK () OVER (PARTITION BY category_id ORDER BY price DESC) AS rank
FROM products
INNER JOIN categories ON products.category_id = categories.id
) AS ranked_products
WHERE rank <=2
