# E-Commerce Sales Business Review

**Sales Data BI project using using Excel and MySQL 8.0 for data cleaning and modelling and PowerBI for visualization**

### Goal

This project is meant to demonstrate data manipulation skills necessary for Business Intelligence and Data Analyst roles such as planning, data cleansing and modelling, data analysis and visualization using industry-standard tools such as MS Excel, MySQL and Power BI. 

The subject dataset belongs to Olist (a Brazilian E-Commerce website) and is made up of 100,000 random orders with product, customer and reviews info, spanning from September 2016 to October 2018.

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

*As Director of Sales, I want to have an **overview of our sales performance**. How are performing on a monthly basis? What is the trend? Also, I want to know what states buy the most and what states sell the most, and to identify our most successful product categories.*

*As a Local Sales Manager, I want to have a **detailed view of my state’s sales performance**. I want to be able to learn about our monthly revenue figures and month-on-month growth and, if need be, to know how much we have sold in specific dates, so that I can evaluate the effectiveness of past marketing campaigns. I also want to know what are my state’s best selling product categories, and where are the sellers located, so that I can have an idea of which channels to strengthen.*

*As a Payment Operations Lead, I want to know what is the **preferred payment method, overall and by state**, and if it has changed over time, so that I can liaise with our payment partners and work on developing less used payment methods.*

*As a Delivery Operations Lead, I want to know *how many delays there have been, who are the worst states, and during which periods have we experienced the biggest delays*, so that I can identify problematic states. I also want to know what has been the *average delivery time per state and how it has changed over time*, so that I can work with sellers to adjust delivery times.*

## 2. Planning & Data Preparation

Our dataset is comprised of 11 csv files that can be accessed through [this link](https://www.kaggle.com/olistbr/brazilian-ecommerce). Along with the csv files, the link also contains some data context, along with the data schema that we will use to create relationships between our datasets.
![image](https://user-images.githubusercontent.com/78386715/118380480-f05ba280-b5d9-11eb-9ac3-2e209c815afc.png)
A quick glance at the .csv files using Notepad and we are able to learn more about the data, map the table and column information and plan how the tables will relate with each other.

As we acquire visibility over the column names and respective datatypes, we can proceed to store the data in MySQL using MySQL Worbench.

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

Now that we have our data stored in a SQL database, we can begin to analyse each table by:
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

Our goal is to visualize sales data troughout time and according to location and product category.
To that effect, we will need to use the following tables:
- orders
- order_items
- order_payments
- products
- product_category_name_translation
- customers
- sellers

Since we want to filter the sales data by state but only have the state codes, we need to find a table that can provide all the Brazilian states' full names. A quick online search and we are able to find [one](https://en.wikipedia.org/wiki/Federative_units_of_Brazil).

Now that we have a clear strategy, we are ready to start using Power BI. We will perform the following steps:
1. Connect PowerBI to desired MySQL server and database, and choose the tables we need to import;
2. Using PowerQuery, rename the tables and categorize them (Dim or Fact), review the table data, rename the useful columns and delete the unacessary ones;
3. In order to be able to filter data using the full names of all the Brazilian States, connect PowerBI to the following [link](https://en.wikipedia.org/wiki/Federative_units_of_Brazil) and select the "states list" table;
4. Set up the correct datatypes and properties for each column;
5. Create a Dim_date table so that we can use Time Intelligence DAX functions;
6. Using the Model view, create the data model by establishing relationships between columns from different tables;
7. Create the necessary calculated columns and DAX measures (Subtotals, Percentage of Grand Totals, Month on Month Growth, etc.) and organize them in specific tables;
8. Set up the appropriate visualization graphics that allow the data to tell the story by presenting the information in a way that accomplishes the intended goals and answers the stakeholders' questions. 

## 6. Dashboard Review & Insights

We will answer the different business requests by looking at the Power BI graphics.

#### Overview

![v2 0_Overview_1](https://user-images.githubusercontent.com/78386715/125779553-e5038b82-e917-4cfc-8473-ec73c2d612c3.PNG)
**Monthly Revenue** - Since initial rollout in Jan 2017 sales have had an overall rising trend, but it has slowed down in the last 5 months, and the last 2 months have been stagnant with less than 1% growth.
**Product Categories** - So far the product categories that have achieved over 1M in sales have been Health & Beauty, Watches & Gifts, Bed, Bath & Table, Sports & Leisure and Computer Accessories.
**Purchases By State** - São Paulo, Rio de Janeiro and Minas Gerais are the states that perform the better in terms of products bought, representing more than half (63%) of overall purchases, with a revenue of over R$ 9.6M.
**Best Selling States** - São Paulo alone represents more than half (64%) of total product sales, having shipped close to R$ 10M in products. |

#### State

Selecting Roraima as an example:
![v2 0_State_1](https://user-images.githubusercontent.com/78386715/125779576-6b1c1413-4bbf-499c-9cb7-aab44afbf6cf.PNG)

**Monthly Revenue** - we’re able to learn that the state’s sales have been fairly low (below 1k) up to Mar18, where they achieved a 88% increase from the previous month, having contributed to around 23% of total sales so far. 
**Product Categories** - The most popular product categories are Sports & Leisure, Home appliances and Baby products.
**Sellers** - Although Roraima is a North state, all products come from the Southeast region which, by looking at the “Delivery Operations – Delivery Time” page, can result in concerning delivery times.

#### Payment Operations

![v2 0_Payment_Methods_1](https://user-images.githubusercontent.com/78386715/125780727-ec062705-f023-49c7-be72-03a84264800c.PNG)

Credit card is the most used method of payment, followed by check (boleto), then voucher and debit card. However, the last month saw an increase in the number of payments using debit card, surpassing voucher payments by 26.

#### Delivery Operations

![v2 0_Delivery_Average_1](https://user-images.githubusercontent.com/78386715/125781018-05b0c046-488d-4748-9d15-745592380df6.PNG)

**Average Delivery Time** - Roraima, Pará, Alagoas, Amapá e Amazonas (mostly Norte region states) all have a concerning average delivery time. Between Nov17 and Mar18, delivery times were more than 2 weeks, which coincided with the increase of orders during the same period.

![v2 0_Delivery_Delays_1](https://user-images.githubusercontent.com/78386715/125781594-ea10cbb2-83d7-4ae3-8bcd-5c2e85865513.PNG)

**Number of Delays** - São Paulo and Rio de Janeiro both have the biggest revenue and also the biggest number of delays, most of them experienced between Nov17 and Mar18. In the same period, most states also saw an increase in the number of delays, with the exception of states with a low number of purcheses, such as Tocatins, Acre, Alagoas and Sergipe.

