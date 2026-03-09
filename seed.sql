INSERT INTO categories (name) VALUES
    ('Mens'),
    ('Womens'),
    ('Home'),
    ('Promo');

INSERT INTO products (name, price, category_id) VALUES
    ('Shorts',5,1),
    ('Shirt',6,1),
    ('Skirt',4,2),
    ('T-Shirt',5,2),
    ('Pillow',6,3),
    ('Pillow cover',3,3),
    ('Cool chair',7,4),
    ('Cool chair 2',8,4);

INSERT INTO customers (name, email) VALUES
    ('Daniel','daniel2000@test.mail'),
    ('Viktor','viktor.ua@test.mail'),
    ('Robert','proskater40@test.mail'),
    ('Michael','michael1@test.mail'),
    ('Bob','bobthebestbob@test.mail');

INSERT INTO orders (customer_id, status, created_at) VALUES
    (1,'completed','2024-01-25 10:00:00'),
    (2,'cancelled','2024-01-27 13:15:00'),
    (2,'completed','2024-01-27 21:40:00'),
    (3,'completed','2024-01-29 11:41:00'),
    (1,'cancelled','2024-02-17 12:14:00'),
    (2,'completed','2024-02-19 08:02:00'),
    (4,'cancelled','2024-02-25 22:51:00'),
    (2,'pending','2024-03-12 14:34:00'),
    (5,'pending','2024-03-16 09:59:00'),
    (3,'pending','2024-04-01 12:44:00');

INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
    (1,1,2,5),
    (2,7,1,7),
    (2,8,1,8),
    (3,3,10,3),
    (4,5,2,6),
    (4,6,2,3),
    (5,1,5,5),
    (5,2,5,6),
    (6,4,3,4),
    (6,1,3,5);