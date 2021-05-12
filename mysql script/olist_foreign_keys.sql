-- ///////////////////////////////////////////////////////////////////////
-- FOREIGN KEYS

-- looking at the different columns in the several tables, it is possible to connect them in order to prevent actions that would destroy the links.

ALTER TABLE order_items
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_payments
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE orders
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE products
ADD FOREIGN KEY (product_category_name) REFERENCES product_category_name_translation(product_category_name);
-- By trying to connect the products table with the product_category_name_translation table, the error code 1452 tells us that there is data in the products table that is unmatched in the product_category_name_translation table.
-- We now need to find which values in the products table do not have matches.

SELECT p.product_category_name, pcnt.product_category_name
FROM products p
LEFT JOIN product_category_name_translation pcnt
	ON p.product_category_name = pcnt.product_category_name
WHERE pcnt.product_category_name IS NULL
GROUP BY p.product_category_name;

INSERT INTO product_category_name_translation
VALUES	("pc_gamer", "pc_gamer"),
		("portateis_cozinha_e_preparadores_de_alimentos", "kitchen_portables_food_processors");

ALTER TABLE products
ADD FOREIGN KEY (product_category_name) REFERENCES product_category_name_translation(product_category_name);
