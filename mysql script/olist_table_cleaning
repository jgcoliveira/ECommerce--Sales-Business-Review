-- ///////////////////////////////////////////////////////////////////////
-- TABLE DATA CLEANING

-- ...........................
-- CUSTOMERS            ......--------------------------------------------------------------------------------------------------------------------------------
-- ...........................

-- find null values
SELECT *
FROM customers
WHERE customer_city IS NULL OR customer_state IS NULL; -- the remaining columns are already checked because of the NOT NULL condition

-- find out if for every customer_id there is in fact a customer_unique_id
SELECT customer_id, COUNT(customer_unique_id)
FROM customers
GROUP BY customer_id
HAVING COUNT(customer_unique_id) > 1;

-- ...........................
-- GEOLOCATION          ......--------------------------------------------------------------------------------------------------------------------------------
-- ...........................

-- no column has NULL values

-- verify city names A-B
SELECT geolocation_city, COUNT(geolocation_city) AS city_count, COUNT(geolocation_zip_code_prefix) AS zip_code_count, geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^a|^b"
ORDER BY geolocation_city;

-- some geolocation_city names are miswritten, so they need to be corrected

UPDATE geolocation SET geolocation_city = "arraial do cabo" WHERE geolocation_city = "...arraial do cabo";
UPDATE geolocation SET geolocation_city = "cidade" WHERE geolocation_city = "*cidade";
UPDATE geolocation SET geolocation_city = "teresopolis" WHERE geolocation_city = "´teresopolis";
UPDATE geolocation SET geolocation_city = "quarto centenario" WHERE geolocation_city = "4º centenario";


-- How to correct "*cidade" geolocation.city name
-- 1. find the corresponding geolocation_zip_code_prefix
SELECT * FROM geolocation
WHERE geolocation_city = "* cidade";

-- 2. find the corresponding geolocation_city
SELECT * FROM geolocation
WHERE geolocation_zip_code_prefix = 81470;

-- Since all 81470 have curitiba as their geolocation_city, we can conclude that * cidade = curitiba
UPDATE geolocation SET geolocation_city = "curitiba" WHERE geolocation_city = "* cidade";

UPDATE geolocation SET geolocation_city = "alta floresta d'oeste" WHERE geolocation_city = "alta floresta do oeste";
UPDATE geolocation SET geolocation_city = "alta floresta d'oeste" WHERE geolocation_city = "alta floresta doeste";
UPDATE geolocation SET geolocation_city = "alvorada d'oeste" WHERE geolocation_city = "alvorada do oeste";
UPDATE geolocation SET geolocation_city = "antunes" WHERE geolocation_city = "antunes (igaratinga)";
UPDATE geolocation SET geolocation_city = "aparecida d'oeste" WHERE geolocation_city = "";
UPDATE geolocation SET geolocation_city = "aparecida d'oeste" WHERE geolocation_city = "aparecida d oeste";
UPDATE geolocation SET geolocation_city = "aparecida d'oeste" WHERE geolocation_city = "aparecida doeste";
UPDATE geolocation SET geolocation_city = "armacao dos buzios" WHERE geolocation_city = "armacao de buzios";
UPDATE geolocation SET geolocation_city = "arraial d'ajuda" WHERE geolocation_city = "arraial d ajuda";
UPDATE geolocation SET geolocation_city = "bacaxa" WHERE geolocation_city = "bacaxa (saquarema) - distrito";
UPDATE geolocation SET geolocation_city = "belo horizonte" WHERE geolocation_city = "bh";
UPDATE geolocation SET geolocation_city = "biritiba-mirim" WHERE geolocation_city = "biritiba mirim";


-- verify city names C-D
SELECT geolocation_city, COUNT(geolocation_city), COUNT(geolocation_city) - COUNT(geolocation_zip_code_prefix) AS difference, geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^c|^d"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "califórnia da barra" WHERE geolocation_city = "california da barra (barra do pirai)";
UPDATE geolocation SET geolocation_city = "ceará-mirim" WHERE geolocation_city = "ceara mirim";
UPDATE geolocation SET geolocation_city = "colonia z-3" WHERE geolocation_city = "colônia z-3";
UPDATE geolocation SET geolocation_city = "diamante d'oeste" WHERE geolocation_city = "diamante d  oeste";
UPDATE geolocation SET geolocation_city = "dias d'avila" WHERE geolocation_city = "dias d avila";
UPDATE geolocation SET geolocation_city = "dias d'avila" WHERE geolocation_city = "dias davila";

-- verify city names E-F
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^e|^f"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "embu-guacu" WHERE geolocation_city = "embu guaçu";
UPDATE geolocation SET geolocation_city = "embu-guacu" WHERE geolocation_city = "embuguacu";
UPDATE geolocation SET geolocation_city = "estrela d'oeste" WHERE geolocation_city = "estrela d oeste";
UPDATE geolocation SET geolocation_city = "figueiropolis d'oeste" WHERE geolocation_city = "figueiropolis d oeste";
UPDATE geolocation SET geolocation_city = "figueiropolis d'oeste" WHERE geolocation_city = "figueirópolis doeste";
UPDATE geolocation SET geolocation_city = "florianopolis" WHERE geolocation_city = "florian&oacute;polis";
UPDATE geolocation SET geolocation_city = "florinia" WHERE geolocation_city = "florínea";
UPDATE geolocation SET geolocation_city = "franca" WHERE geolocation_city = "franca sp";

-- verify city names G-H
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^g|^h"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "gouveia" WHERE geolocation_city = "gouvea";
UPDATE geolocation SET geolocation_city = "guajara-mirim" WHERE geolocation_city = "";
UPDATE geolocation SET geolocation_city = "" WHERE geolocation_city = "guajara mirim";
UPDATE geolocation SET geolocation_city = "guarulhos" WHERE geolocation_city = "guarulhos-sp";
UPDATE geolocation SET geolocation_city = "herval d'oeste" WHERE geolocation_city = "";
UPDATE geolocation SET geolocation_city = "herval d'oeste" WHERE geolocation_city = "";
UPDATE geolocation SET geolocation_city = "" WHERE geolocation_city = "herval d' oeste";
UPDATE geolocation SET geolocation_city = "" WHERE geolocation_city = "herval d oeste";
UPDATE geolocation SET geolocation_city = "herval d'oeste" WHERE geolocation_city = "herval doeste";
UPDATE geolocation SET geolocation_city = "paranapanema" WHERE geolocation_city = "holambra ii";

-- verify city names I-J
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^i|^j"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "itabatan" WHERE geolocation_city = "itabatan (mucuri)";

-- verify city names K-L
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^k|^l"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "lambari d'oeste" WHERE geolocation_city = "lambari d%26apos%3boeste";
UPDATE geolocation SET geolocation_city = "lambari d'oeste" WHERE geolocation_city = "lambari doeste";
UPDATE geolocation SET geolocation_city = "linhares" WHERE geolocation_city = "linharesl";

-- verify city names M-N
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^m|^n"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "maceio" WHERE geolocation_city = "maceia³";
UPDATE geolocation SET geolocation_city = "machadinho d'oeste" WHERE geolocation_city = "machadinho d oeste";
UPDATE geolocation SET geolocation_city = "machadinho d'oeste" WHERE geolocation_city = "machadinho doeste";
UPDATE geolocation SET geolocation_city = "mogi mirim" WHERE geolocation_city = "mogi-mirim";
UPDATE geolocation SET geolocation_city = "monte gordo" WHERE geolocation_city = "monte gordo (camacari) - distrito";
UPDATE geolocation SET geolocation_city = "nova brasilandia d'oeste" WHERE geolocation_city = "nova brasilandia d oeste";
UPDATE geolocation SET geolocation_city = "nova brasilandia d'oeste" WHERE geolocation_city = "nova brasilandia doeste";

-- verify city names O-P
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^o|^p"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "olho d'água das cunhãs" WHERE geolocation_city = "olho d agua das cunhas";
UPDATE geolocation SET geolocation_city = "olho d'água das flores" WHERE geolocation_city = "olho d agua das flores";
UPDATE geolocation SET geolocation_city = "olho d'água das cunhãs" WHERE geolocation_city = "olho dágua das cunhãs";
UPDATE geolocation SET geolocation_city = "olho d'água grande" WHERE geolocation_city = "olho d'agua grande";
UPDATE geolocation SET geolocation_city = "olho d'água grande" WHERE geolocation_city = "olho dágua grande";
UPDATE geolocation SET geolocation_city = "olho d'água das flores" WHERE geolocation_city = "olho d'agua das flores";
UPDATE geolocation SET geolocation_city = "olho-d'água do borges" WHERE geolocation_city = "olho-d agua do borges";
UPDATE geolocation SET geolocation_city = "olhos d'água" WHERE geolocation_city = "olhos-d agua";
UPDATE geolocation SET geolocation_city = "olhos d'água" WHERE geolocation_city = "olhos d'agua";
UPDATE geolocation SET geolocation_city = "palmeira d'oeste" WHERE geolocation_city = "palmeira d oeste";
UPDATE geolocation SET geolocation_city = "palmeira d'oeste" WHERE geolocation_city = "palmeira doeste";
UPDATE geolocation SET geolocation_city = "pau d'arco" WHERE geolocation_city = "pau d  arco";
UPDATE geolocation SET geolocation_city = "penedo" WHERE geolocation_city = "penedo (itatiaia)";
UPDATE geolocation SET geolocation_city = "pérola d'oeste" WHERE geolocation_city = "perola doeste";
UPDATE geolocation SET geolocation_city = "pingo-d'agua" WHERE geolocation_city = "pingo-d agua";
UPDATE geolocation SET geolocation_city = "porto alegre" WHERE geolocation_city = "porto aelgre";
UPDATE geolocation SET geolocation_city = "praia grande" WHERE geolocation_city = "praia grande (fundão) - distrito";
UPDATE geolocation SET geolocation_city = "presidente castello branco" WHERE geolocation_city = "presidente castelo branco";

-- verify city names Q-R
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^q|^r"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "rancho alegre d'oeste" WHERE geolocation_city = "rancho alegre d  oeste";
UPDATE geolocation SET geolocation_city = "realeza" WHERE geolocation_city = "realeza (manhuacu)";
UPDATE geolocation SET geolocation_city = "brasilia" WHERE geolocation_city = "riacho fundo";
UPDATE geolocation SET geolocation_city = "brasilia" WHERE geolocation_city = "riacho fundo 2";
UPDATE geolocation SET geolocation_city = "rio de janeiro" WHERE geolocation_city = "rio de janeiro, rio de janeiro, brasil";
UPDATE geolocation SET geolocation_city = "rio de janeiro" WHERE geolocation_city = "rj";

-- verify city names S-T
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^s|^t"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "sao paulo" WHERE geolocation_city = "sa£o paulo";
UPDATE geolocation SET geolocation_city = "santana do livramento" WHERE geolocation_city = "sant'ana do livramento";
UPDATE geolocation SET geolocation_city = "santa bárbara d'oeste" WHERE geolocation_city = "santa barbara d oeste";
UPDATE geolocation SET geolocation_city = "santa bárbara d'oeste" WHERE geolocation_city = "santa bárbara d`oeste";
UPDATE geolocation SET geolocation_city = "santa bárbara d'oeste" WHERE geolocation_city = "santa bárbara doeste";
UPDATE geolocation SET geolocation_city = "santa clara d'oeste" WHERE geolocation_city = "santa clara d oeste";
UPDATE geolocation SET geolocation_city = "santa rita d'oeste" WHERE geolocation_city = "santa rita d oeste";
UPDATE geolocation SET geolocation_city = "santa rita d'oeste" WHERE geolocation_city = "santa rita doeste";
UPDATE geolocation SET geolocation_city = "sao joao d'alianca" WHERE geolocation_city = "sao joao d alianca";
UPDATE geolocation SET geolocation_city = "sao joao d'alianca" WHERE geolocation_city = "sao joao dalianca";
UPDATE geolocation SET geolocation_city = "sao joao do pau d'alho" WHERE geolocation_city = "sao joao do pau d alho";
UPDATE geolocation SET geolocation_city = "sao joao do pau d'alho" WHERE geolocation_city = "são joão do pau d%26apos%3balho";
UPDATE geolocation SET geolocation_city = "sao joao do pau d'alho" WHERE geolocation_city = "sao joao do pau dalho";
UPDATE geolocation SET geolocation_city = "sao jorge d'oeste" WHERE geolocation_city = "sao jorge do oeste";
UPDATE geolocation SET geolocation_city = "sao jorge d'oeste" WHERE geolocation_city = "sao jorge doeste";
UPDATE geolocation SET geolocation_city = "sao roque do canaa" WHERE geolocation_city = "sao roque do cannaa";
UPDATE geolocation SET geolocation_city = "sao paulo" WHERE geolocation_city = "sãopaulo";
UPDATE geolocation SET geolocation_city = "sao paulo" WHERE geolocation_city = "sp";
UPDATE geolocation SET geolocation_city = "cabo frio" WHERE geolocation_city = "tamoios (cabo frio)";
UPDATE geolocation SET geolocation_city = "trajano de moraes" WHERE geolocation_city = "trajano de morais";

-- verify city names U-V
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^u|^v"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "venda nova do imigrante" WHERE geolocation_city = "venda nova do imigrante-es";
UPDATE geolocation SET geolocation_city = "vila bela da santissima trindade" WHERE geolocation_city = "vila bela da santssima trindade";

-- verify city names W-X
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^w|^x"
ORDER BY geolocation_city;

UPDATE geolocation SET geolocation_city = "xangri-la" WHERE geolocation_city = "xangrila";

-- verify city names Y-Z
SELECT geolocation_city, COUNT(geolocation_city), geolocation_zip_code_prefix AS zip_code
FROM geolocation
GROUP BY geolocation_city
HAVING geolocation_city REGEXP "^y|^z"
ORDER BY geolocation_city;

-- In order to have visibility over the number of geolocation_zip_code_prefix that refer to have more than one geolocation_city
SELECT geolocation_zip_code_prefix, geolocation_city, geolocation_state, COUNT(geolocation_zip_code_prefix) -- returns the number of records associated with each geolocation_city, grouped by geolocation_zip_code_prefix
FROM geolocation 
	WHERE geolocation_zip_code_prefix IN (
	SELECT geolocation_zip_code_prefix			-- returns every geolocation_zip_code_prefix with more than 1 city 
	FROM geolocation
	GROUP BY geolocation_zip_code_prefix
	HAVING COUNT(DISTINCT(geolocation_city)) > 1
	)
GROUP BY geolocation_zip_code_prefix, geolocation_city
ORDER BY geolocation_zip_code_prefix;

-- We now know which records have a different city assigned, and can thus correct them

UPDATE geolocation SET geolocation_city = "embu das artes" WHERE geolocation_city = "embu";
UPDATE geolocation SET geolocation_city = "jacare" WHERE geolocation_city = "jacaré (cabreúva)";
UPDATE geolocation SET geolocation_city = "mogi mirim" WHERE geolocation_city = "mogi-mirim";
UPDATE geolocation SET geolocation_city = "mogi-guacu" WHERE geolocation_city = "mogi guacu";
UPDATE geolocation SET geolocation_city = "estrela d'oeste" WHERE geolocation_city = "estrela doeste";
UPDATE geolocation SET geolocation_city = "rio de janeiro" WHERE geolocation_city = "rio janeiro";
UPDATE geolocation SET geolocation_city = "paraty" WHERE geolocation_city = "parati" AND geolocation_zip_code_prefix = 23970;
UPDATE geolocation SET geolocation_city = "campos dos goytacazes" WHERE geolocation_city = "campos dos goytacaze";
UPDATE geolocation SET geolocation_city = "campos dos goytacazes" WHERE geolocation_city = "goitacazes";
UPDATE geolocation SET geolocation_city = "belo horizonte" WHERE geolocation_city = "belo horizonta";
UPDATE geolocation SET geolocation_city = "vitorinos" WHERE geolocation_city = "vitorinos - alto rio doce";
UPDATE geolocation SET geolocation_city = "lavras" WHERE geolocation_city = "lavras mg";
UPDATE geolocation SET geolocation_city = "piumhi" WHERE geolocation_city = "piumhii";
UPDATE geolocation SET geolocation_city = "limeira do oeste" WHERE geolocation_city = "limeira do oeste mg";
UPDATE geolocation SET geolocation_city = "monte gordo" WHERE geolocation_city = "monte gordo (camacari) - distrito";
UPDATE geolocation SET geolocation_city = "jiquiriçá" WHERE geolocation_city = "jequirica";
UPDATE geolocation SET geolocation_city = "itabata" WHERE geolocation_city = "itabatan";
UPDATE geolocation SET geolocation_city = "nova redencao" WHERE geolocation_city = "nova redencao bahia";
UPDATE geolocation SET geolocation_city = "muquem do sao francisco" WHERE geolocation_city = "muquém de são francisco";
UPDATE geolocation SET geolocation_city = "campo alegre de lourdes" WHERE geolocation_city = "campo alegre de lourdes, bahia, brasil";
UPDATE geolocation SET geolocation_city = "cabo de santo agostinho" WHERE geolocation_city = "santo agostinho";
UPDATE geolocation SET geolocation_city = "maceió" WHERE geolocation_city = "maceia³";
UPDATE geolocation SET geolocation_city = "barra de santo antonio" WHERE geolocation_city = "barra de  santo antônio";
UPDATE geolocation SET geolocation_city = "santa cecilia" WHERE geolocation_city = "santa cecilia de umbuzeiro";
UPDATE geolocation SET geolocation_city = "itapajé" WHERE geolocation_city = "itapage";
UPDATE geolocation SET geolocation_city = "senador la rocque" WHERE geolocation_city = "senador la roque";
UPDATE geolocation SET geolocation_city = "mojui dos campos" WHERE geolocation_city = "mujui dos campos";
UPDATE geolocation SET geolocation_city = "cachoeira do piriá" WHERE geolocation_city = "cachoeira de piria";
UPDATE geolocation SET geolocation_city = "tailândia" WHERE geolocation_city = "taliandia";
UPDATE geolocation SET geolocation_city = "pedra branca do amapari" WHERE geolocation_city = "amapari";
UPDATE geolocation SET geolocation_city = "rio branco" WHERE geolocation_city = "rio bracnco";
UPDATE geolocation SET geolocation_city = "bom jesus" WHERE geolocation_city = "bom jesus de goias";
UPDATE geolocation SET geolocation_city = "machadinho d'oeste" WHERE geolocation_city = "machadinho d oeste";
UPDATE geolocation SET geolocation_city = "nova brasilandia d'oeste" WHERE geolocation_city = "nova brasilandia d oeste" OR geolocation_city = "nova brasilandia doeste";
UPDATE geolocation SET geolocation_city = "mirassol d'oeste" WHERE geolocation_city = "mirassol d oeste" OR geolocation_city = "mirassol doeste";
UPDATE geolocation SET geolocation_city = "bataypora" WHERE geolocation_city = "bataipora";
UPDATE geolocation SET geolocation_city = "itapejara d'oeste" WHERE geolocation_city = "itapejara d  oeste";
UPDATE geolocation SET geolocation_city = "balneário piçarras" WHERE geolocation_city = "picarras";
UPDATE geolocation SET geolocation_city = "herval d'oeste" WHERE geolocation_city = "" AND geolocation_zip_code_prefix = 89610;
UPDATE geolocation SET geolocation_city = "barra do quaraí" WHERE geolocation_city = "barrado quarai";


-- In order do verify if all geolocation_zip_code_prefix refer to a single geolocation_state

SELECT geolocation_id, geolocation_zip_code_prefix, geolocation_city, geolocation_state
FROM geolocation
	WHERE geolocation_zip_code_prefix IN (
    SELECT geolocation_zip_code_prefix -- returns the geolocation_zip_code_prefix that have more than 1 geolocation_state
	FROM geolocation
	GROUP by geolocation_zip_code_prefix
	HAVING COUNT(DISTINCT(geolocation_state)) > 1
);

-- we now have visibility over the records that have the wrong geolocation_state and are now able to correct them

UPDATE geolocation SET geolocation_state = "SP" WHERE geolocation_id = 22262;
UPDATE geolocation SET geolocation_state = "SP" WHERE geolocation_id = 72853;
UPDATE geolocation SET geolocation_state = "RJ" WHERE geolocation_id = 431000;
UPDATE geolocation SET geolocation_state = "RJ" WHERE geolocation_id = 460407;
UPDATE geolocation SET geolocation_zip_code_prefix = 77320 WHERE geolocation_id = 792395;
UPDATE geolocation SET geolocation_zip_code_prefix = 76958 WHERE geolocation_id = 825883;
UPDATE geolocation SET geolocation_state = "MS" WHERE geolocation_id = 840048;
UPDATE geolocation SET geolocation_zip_code_prefix = 88630 WHERE geolocation_id = 847701;


-- ...........................
-- ORDERS          ......--------------------------------------------------------------------------------------------------------------------------------
-- ...........................

-- first we need to have visibility over the different types of orders registered
SELECT order_status, COUNT(order_status)
FROM olist.orders
GROUP BY order_status;

-- orders can be: delivered, unavailable, shipped, canceled, invoiced, processing, approved, created

-- ........................................................................
-- CREATED
-- orders created should only have a order_purchase date
SELECT * 
FROM orders
WHERE order_status = "created";

-- no need to correct anything

-- ........................................................................
-- APPROVED
-- orders approved should have a order_purchase date and an order_approved date

SELECT * 
FROM orders
WHERE order_status = "approved" AND order_delivered_carrier_date IS NOT NULL OR order_status = "approved" AND order_delivered_customer_date IS NOT NULL;

-- no need to correct anything

-- ........................................................................
-- PROCESSING
-- orders processing should also have a order_purchase date and an order_approved date

SELECT * 
FROM orders
WHERE order_status = "processing" AND order_delivered_carrier_date IS NOT NULL OR order_status = "processing" AND order_delivered_customer_date IS NOT NULL;

-- no need to correct anything

-- ........................................................................
-- CANCELLED
-- orders canceled should not have order_delivered_customer_date

SELECT * 
FROM orders
WHERE order_status = "canceled" AND order_delivered_customer_date IS NOT NULL;

-- there are a few canceled orders with delivery dates. The status need to be updated to delivered

UPDATE orders
SET order_status = "delivered" 
WHERE order_status = "canceled" AND order_delivered_customer_date IS NOT NULL;

-- ........................................................................
-- INVOICED
-- orders invoiced should not have order_delivered_customer_date or order_delivered_carrier_date

SELECT * FROM olist.orders
WHERE order_status = "invoiced" AND order_delivered_customer_date IS NOT NULL OR order_status = "invoiced" AND order_delivered_carrier_date IS NOT NULL;

-- no need to correct anything

-- ........................................................................
-- SHIPPED
-- orders shipped should have order_delivered_carrier_date but no order_delivered_customer_date

SELECT * FROM olist.orders
WHERE order_status = "shipped" AND order_delivered_customer_date IS NOT NULL;

SELECT * FROM olist.orders
WHERE order_status = "shipped" AND order_delivered_carrier_date IS NULL;

-- no need to correct anything

-- ........................................................................
-- UNAVAILABLE
-- orders unavailable should also have a order_purchase date and an order_approved date but no order_delivered_carrier_date and order_delivered_customer_date

SELECT * FROM olist.orders
WHERE order_status = "unavailable" AND order_delivered_carrier_date IS NOT NULL OR order_status = "unavailable" AND order_delivered_customer_date IS NOT NULL ;

-- ........................................................................
-- DELIVERED
-- orders should all have delivered order_delivered_customer_date 

SELECT * FROM olist.orders
WHERE order_status = "delivered" AND order_delivered_customer_date IS NULL;

-- there are orders without order_delivered_carrier_date and order_delivered_customer_date. these orders_status must be corrected to invoicing and shipped 

UPDATE orders
SET order_status = "invoiced"
WHERE order_id = "2d858f451373b04fb5c984a1cc2defaf";

UPDATE orders
SET order_status = "shipped"
WHERE order_status = "delivered" AND order_delivered_customer_date IS NULL;

-- ...........................
-- ORDER ITEMS          ......--------------------------------------------------------------------------------------------------------------------------------
-- ...........................

-- no column has NULL values

-- Let's check for order items without any associated customer_id on the orders table 
SELECT oi.order_id, oi.order_item_id, oi.product_id, o.customer_id
FROM order_items oi
LEFT JOIN orders o
	ON oi.order_id = o.order_id
HAVING o.customer_id IS NULL;

-- all order_items have an associated order_id and customer_id on the orders table

-- Let's check if there are any orders without order_items order_id
SELECT o.order_id, o.order_status
FROM orders o 
WHERE o.order_id NOT IN ( -- all o.order_id that do not have a order_items record
	SELECT oi.order_id 
	FROM order_items oi
);

-- we can see that most orders records without a order_items record have "cancelled", "unavailable" status.
-- Let's group by status in order to have better visibility

SELECT o.order_status, COUNT(o.order_status)
FROM orders o 
WHERE o.order_id NOT IN ( -- all o.order_id that do not have a order_items record
	SELECT oi.order_id 
	FROM order_items oi
)
GROUP BY o.order_status;

-- we can conclude that order_status "unavailable", "canceled", "invoiced", "created" usually do not have a order_items record.
-- However, there is a "shipped" orders record that does not have the necessary order_items record. We can delve deeper and find the order_id 

SELECT *
FROM orders o 
WHERE o.order_id NOT IN ( -- all o.order_id that do not have a order_items record
	SELECT oi.order_id 
	FROM order_items oi
)
HAVING order_status = "shipped";

-- We will delete this single order so that it won't interfere with future analyses
-- Since there are foreign key relationships between the orders table and order_payments table, we must see if there is any related record with this particular order_id and delete it

DELETE FROM order_payments
WHERE order_id = "a68ce1686d536ca72bd2dadc4b8671e5";

DELETE FROM orders
WHERE order_id = "a68ce1686d536ca72bd2dadc4b8671e5";

-- ...........................
-- ORDER PAYMENTS       ......--------------------------------------------------------------------------------------------------------------------------------
-- ...........................

-- all records are not null

-- Let's have some visibility over the different payment types
SELECT payment_type, COUNT(payment_type)
FROM order_payments
GROUP BY payment_type;

-- We should verify if there are any order_id in the orders table without a order_payments record
SELECT * 
FROM orders
WHERE order_id NOT IN (
	SELECT order_id
    FROM order_payments
    );
    
-- order_id bfbd0f9bdef84302105ad712db648a6c has no payment record, but has been delivered.

-- Let's find the order_items record
SELECT *
FROM order_items
WHERE order_id = "bfbd0f9bdef84302105ad712db648a6c";

-- Based on the existing information, we can create a order_payments record.
-- Assuming the following fields: payment_sequential = 1, payment_type = not_defined, payment_installments = 1, payment_value =  143.46

INSERT INTO order_payments VALUES ("bfbd0f9bdef84302105ad712db648a6c", 1, "not_defined", 1, 143.46);

-- ...........................
-- PRODUCTS       ......--------------------------------------------------------------------------------------------------------------------------------
-- ...........................

-- As previously seen in the upload phase, some records have null values in the product_name_length, product_description_length, product_photos_qty fields
-- these records are  "desconhecido" but the null values won't interfere with future analyses, as only product_id and product_category_name are relevant

-- ...........................
-- SELLERS              ......--------------------------------------------------------------------------------------------------------------------------------
-- ...........................

-- There are no null values on this table
-- However, the seller's zip_code/city/state combination need to match the geolocation's zip_code/city/state in order to be able to filter the correct location

-- let's try and find the seller_city values that do no match the geolocation_city values

SELECT s.seller_city, g.geolocation_city,  s.seller_zip_code_prefix FROM sellers s
LEFT JOIN geolocation g
	ON s.seller_zip_code_prefix = g.geolocation_zip_code_prefix -- tables are joined through the zip_code
GROUP BY s.seller_city, g.geolocation_city
HAVING s.seller_city <> g.geolocation_city;						-- only show records that differ in the city name

-- We can update those values and match the geolocation table
UPDATE sellers s
	JOIN geolocation g
		ON s.seller_zip_code_prefix = g.geolocation_zip_code_prefix
SET s.seller_city = g.geolocation_city
WHERE s.seller_city <> g.geolocation_city AND s.seller_zip_code_prefix = g.geolocation_zip_code_prefix;
