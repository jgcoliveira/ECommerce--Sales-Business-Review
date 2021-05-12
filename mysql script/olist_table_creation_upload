-- ///////////////////////////////////////////////////////////////////////
-- TABLE CREATION AND DATA UPLOAD
-- .................................................................................
-- CUSTOMERS TABLE
-- 1. create table with required columns

CREATE TABLE customers (
	customer_id VARCHAR(40) NOT NULL,
    customer_unique_id VARCHAR(40) NOT NULL,
	customer_zip_code_prefix INT NOT NULL,
    customer_city VARCHAR(20),
    customer_state VARCHAR(2),
    PRIMARY KEY (customer_id)
    );

-- 2. find secure_file_priv

SHOW VARIABLES LIKE "secure_file_priv";

-- 3. make sure path is correct

LOAD DATA INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Raw Data/Olist/olist_customers_dataset.csv"
INTO TABLE customers 
FIELDS TERMINATED BY "," 
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

SELECT * FROM customers;

-- .................................................................................
-- GEOLOCATION TABLE

CREATE TABLE geolocation (
	geolocation_id INT AUTO_INCREMENT,
    geolocation_zip_code_prefix INT NOT NULL,
    geolocation_lat VARCHAR(40) NOT NULL,
    geolocation_lng VARCHAR(40) NOT NULL,
    geolocation_city VARCHAR(40) NOT NULL,
    geolocation_state VARCHAR(2) NOT NULL,
    PRIMARY KEY (geolocation_id)
    );

--
 
LOAD DATA INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Raw Data/Olist/olist_geolocation_dataset.csv"
INTO TABLE geolocation 
FIELDS TERMINATED BY "," 
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 ROWS
(geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state); -- include here the columns you wish to upload sans primary key

-- when loaded several times, the data triggers auto increment values. In order to start from 1 again, first delete the table data

DELETE FROM geolocation;

-- then, set the auto_increment to 1

ALTER TABLE geolocation AUTO_INCREMENT = 1;

-- upload data again

-- .................................................................................
-- ORDER ITEMS TABLE

-- since there is no clear primary key, raw data must be analysed in order to find of the possibility of using a composity key.
-- using Excel's pivot table function, we can assess that for every order_id there is a unique order_item_id. Ex. order X contains items 1, 2 ,3 etc. The product id can be the same, but the order_item_id still differs.
-- Therefore, we shall create a composite key using use order_id and order_item_id 

CREATE TABLE order_items (
order_id VARCHAR(40) NOT NULL,
order_item_id INT NOT NULL,
product_id VARCHAR(40) NOT NULL,
seller_id VARCHAR(40) NOT NULL,
shipping_limit_date DATETIME, -- ensure that the date format accounts for the time also
price DECIMAL(8,2) NOT NULL,
freight_value DECIMAL(8,2) NOT NULL,
PRIMARY KEY (order_id, order_item_id)
);

LOAD DATA INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Raw Data/Olist/olist_order_items_dataset.csv"
INTO TABLE order_items 
FIELDS TERMINATED BY "," 
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

-- .................................................................................
-- ORDER PAYMENTS TABLE

-- using Excel's pivot table function, we can assess that for every order_id there is a payment_sequential.
-- Therefore, we shall create a composite key using use order_id and order_item_id 

CREATE TABLE order_payments (
order_id VARCHAR(40) NOT NULL,
 payment_sequential INT NOT NULL,
 payment_type VARCHAR(20) NOT NULL,
 payment_installments INT NOT NULL,
payment_value DECIMAL(8,2) NOT NULL,
PRIMARY KEY (order_id, payment_sequential)
);

LOAD DATA INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Raw Data/Olist/olist_order_payments_dataset.csv"
INTO TABLE order_payments	
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\r\n" -- all fields are terminated by ",", including the last column. \r must be included.
IGNORE 1 ROWS;

-- .................................................................................
-- ORDER REVIEWS TABLE
-- This table is deemed unacessary for the required analyis

-- .................................................................................
-- ORDERS TABLE

CREATE TABLE orders (
order_id VARCHAR(40),
customer_id VARCHAR(40),
order_status VARCHAR(15),
order_purchase VARCHAR(20),
order_approved VARCHAR(20),
order_delivered_carrier_date VARCHAR(20),
order_delivered_customer_date VARCHAR(20),
order_estimated_delivery_date VARCHAR(20),
PRIMARY KEY (order_id)
);

-- Since there is a number of values with empty dates and mysql does not accept '' as dates (except if we disable sql strict mode, which we will not do)
-- the date columns values must first be uploaded as strings, then converted into dates using the DATETIME type

LOAD DATA INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Raw Data/Olist/olist_orders_dataset.csv"
INTO TABLE orders	
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 ROWS
SET	order_purchase = IF(order_purchase = '', NULL, order_purchase),
	order_approved = IF(order_approved = '', NULL, order_approved),
	order_delivered_carrier_date = IF(order_delivered_carrier_date = '', NULL, order_delivered_carrier_date),
    order_delivered_customer_date = IF(order_delivered_customer_date = '', NULL, order_delivered_customer_date),
    order_estimated_delivery_date = IF(order_estimated_delivery_date = '', NULL, order_estimated_delivery_date)
    ;

-- Now we will alter the data type

ALTER TABLE orders 
MODIFY order_purchase DATETIME,
MODIFY order_approved DATETIME,
MODIFY order_delivered_carrier_date DATETIME,
MODIFY order_delivered_customer_date DATETIME,
MODIFY order_estimated_delivery_date DATETIME;


-- .................................................................................
-- PRODUCTS TABLE 

CREATE TABLE products (
product_id VARCHAR(40) NOT NULL,
product_category_name VARCHAR(50),
product_name_length INT,
product_description_length INT,
product_photos_qty INT,
product_weight_g INT,
product_length_cm INT,
product_height_cm INT,
product_width_cm INT,
PRIMARY KEY (product_id)
);

-- Using Excel, empty integer values were replaced by 0 so that it could be uploaded.

LOAD DATA INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Raw Data/Olist/olist_products_dataset_test.csv"
INTO TABLE products	
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 ROWS
SET product_category_name = IF(product_category_name = '', 'desconhecido', product_category_name),
	product_name_length = IF(product_name_length = 0, NULL, product_name_length),
    product_description_length = IF(product_description_length = 0, NULL, product_description_length),
    product_photos_qty = IF(product_photos_qty = 0, NULL, product_photos_qty),
    product_weight_g = IF(product_weight_g = 0, NULL, product_weight_g),
    product_length_cm = IF(product_length_cm = 0, NULL, product_length_cm),
    product_height_cm= IF(product_height_cm = 0, NULL, product_height_cm),
    product_width_cm= IF(product_width_cm= 0, NULL, product_width_cm)
    ; -- in order to be able to store the csv data, empty product_category_name fields were labeled as "desconhecido" and empty product dimensions fields were labeled as NULL

-- .................................................................................
-- SELLERS TABLE

CREATE TABLE sellers (
seller_id VARCHAR(40) NOT NULL,
seller_zip_code_prefix INT,
seller_city VARCHAR(40),
seller_state VARCHAR(2),
PRIMARY KEY (seller_id)
);

LOAD DATA INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Raw Data/Olist/olist_sellers_dataset.csv"
INTO TABLE sellers
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

-- .................................................................................
-- PRODUCT CATEGORY NAME TRANSLATION TABLE

CREATE TABLE product_category_name_translation (
product_category_name VARCHAR(50) NOT NULL,
product_category_name_english VARCHAR(50) NOT NULL,
PRIMARY KEY (product_category_name)
);

LOAD DATA INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Raw Data/Olist/product_category_name_translation.csv"
INTO TABLE product_category_name_translation
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

INSERT INTO product_category_name_translation VALUES ("desconhecido", "unknown");
