# Quarter 2 Sales Business Review

**Sales Data BI project using using Excel and MySQL 8.0 for data cleaning and modelling and PowerBI for visualization**

### Goal

This project is meant to demonstrate data manipulation skills necessary for Business Intelligence and Data Analyst roles, such as planning, data cleansing, modelling and visualization using industry-standard tools such as MS Excel, MySQL and Power BI. 

The subject dataset belongs to Olist (a Brazilian E-Commerce website) and is made up of 100,000 random orders with product, customer and reviews info, spanning from September 2016 and October 2018.

### Summary
* [1. Business Request](##1.-business-request)
* [2. Planning & Data Preparation](##2.-planning-&-data-preparation)
* [3. Data Loading and Modelling using MySQL](##3.-data-loading-and-modelling-using-mysql)
* [4. Data Cleaning using MySQL](##4.-data-cleaning-using-mysql)
* [5. Data Modeling and Visualization using Power BI](##5.-data-modeling-and-visualization-using-power-bi)
* [6. Insights](##6.-insights)

### Technologies

- MS Excel
- MS PowerBI  2.93.641.0
- MySQL 8.0

## 1. Business Request

Our data processing will be done to cater to several fictional stakeholders requests. 

User Stories:

*As a Director of Sales, I want to know **how much we have sold this Q2, compared to the previous year and previous Q1**, so that I can know if the new marketing strategies applied this quarter have had an overall impact on sales.*

*As a local Sales Manager (assigned to a specific country state), **I want to know about my state's sales volume, how it compares and relates with other states and what product categories have sold the most**, so that I can learn about my state's product category preferences, and share possible insights with other Sales Managers.*

## 2. Planning & Data Preparation

Our dataset is comprised of 11 csv files that can be accessed through [this link](https://www.kaggle.com/olistbr/brazilian-ecommerce). Along with the csv files, the link also contains some data context, along with the data schema that we will use to create relationships between our datasets.
![image](https://user-images.githubusercontent.com/78386715/118380480-f05ba280-b5d9-11eb-9ac3-2e209c815afc.png)
A quick glance at the .csv files using Notepad and we are able to learn more about the data, map the table and column information and plan how the tables will relate with each other.

|CUSTOMERS               |
| ---------------------- |
|**customer_id**         |
|customer_unique_id      |
|customer_zip_code_prefix|
|customer_city           |
|customer_state          |

We now have visibility over the column names and respective datatypes, and can therefore proceed to store the data in MySQL using MySQL Worbench.

## 3. Data Loading and Modelling using MySQL

The storing process begins by creating a dedicated SQL Schema. Afterwards, we will create all the tables necessary for our analysis by defining their columns and respective datatypes, and then upload the data from the .csv files, as seen on this [SQL script](https://github.com/jgcoliveira/q2_business_rev/blob/46c46ac27829aeb11793fa5c342c4dd868d26f24/mysql%20script/olist_table_creation_upload.sql).

At the same time, we evaluate the uniqueness of every row, as well as the business context of the data, in order to define the primary keys for each table.

We can proceed to creating the tables and uploading the data from the .csv files into their designated SQL tables, as seen on the example below:

```mysql
-- ORDER PAYMENTS TABLE

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
```

After all the tables have been created and the raw data loaded, we can create relationships between the tables by defining foreign keys, as exemplified by the code snippet below from [this script](https://github.com/jgcoliveira/q2_business_rev/blob/407e92c92f215c1c50bbe6c4a6ad454fff9a757e/mysql%20script/olist_foreign_keys.sql):

```mysql
ALTER TABLE order_payments
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);
```

## 4. Data Cleaning using MySQL

Now that we have our data stored in mySQL, we can begin to analyse each table by:
1. Understanding the business context by assessing the logical relationships between data in different columns;
2. Searching for inconsistencies and data errors, then taking the appropriate corrective measures.

The following code snippet exemplifies this approach:
```mysql
-- ...........................
-- ORDER ITEMS          ......
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
```

## 5. Data Modeling and Visualization using Power BI

Our goal is to visualize sales numbers troughout time and according to location and product category.
To that effect, we will need to use the following tables:
- orders
- order_items
- products
- product_category_name_translation
Since we want to filter the sales data by state, but only have the state codes, we need to find a table that can provide all the Brazilian states' full names. A quick online search and we are able to find [one](https://en.wikipedia.org/wiki/Federative_units_of_Brazil).

Now that we have a clear strategy, we are ready to start using Power BI. We will perform the following steps:
1. Connect PowerBI to desired MySQL server and database, and choose the tables we need to import;
2. Using PowerQuery, rename the tables and categorize them (Dim or Fact), review the table data, rename the useful columns and delete the unacessary ones;
3. In order to be able to filter data using the full names of all the Brazilian States, connect PowerBI to the following [link](https://en.wikipedia.org/wiki/Federative_units_of_Brazil) and select the "states list" table;
4. Set up the correct datatypes and properties for each column;
5. Using the Model view, create the data model by establishing relationships between columns from different tables;
6. Set up the visualization graphics that best present the information we want to convey;
7. Create the necessary auxiliar columns and DAX expressions.

## 6. Dashboard Review & Insights

We will answer the different business requests by looking at the Power BI graphics

Overview - Comparing to the previous year Q2, Q2 2018 had a significant increase on overall sales, but just a (INSERIR VALOR) increase compared to the previous Q1.

State - A sales manager can choose its designated area, see the monthly sales evolution, find which Product Categories have sold the most, and in which state are the orders located.
![image](https://user-images.githubusercontent.com/78386715/118489062-4f253700-b714-11eb-8768-e667d2dd4cc9.png)

In order to decrease shipping times and improve customer satisfaction, the sales manager can look at the orders sellers map, see where orders are low and raise new sellers in those neighbouring states. 

