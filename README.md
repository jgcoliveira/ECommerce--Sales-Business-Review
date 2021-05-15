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

As a Director of Sales, I want to know how much we have sold this Q2, compared to the previous year and previous Q1, so that I can know if the new marketing strategies applied this quarter have had an overall impact on sales. I also want which states and product categories have the most shipped orders, and if there are any trends.

As a local Sales Manager (assigned to a specific country state), I want to know about my state's sales volume, how it compares with other states and what product categories have sold the most, so that I can learn about my state's product category preferences, and share possible insights with other Sales Managers.

As a Product Specialist, I want to see how different product categories have been relating to one another on a weekly basis so that I can find any trends and colaborate with other Product Specialists on the possibility of improving product rollout

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

(INSERIR RESTO DAS TABELAS?)

We now have visibility over the column names and respective datatypes, and can therefore proceed to store the data in MySQL using MySQL Worbench.

## 3. Data Loading and Modelling using MySQL
The storing process begins by creating a dedicated SQL Schema. Afterwards, we will create all the tables necessary for our analysis by defining their columns and respective datatypes, and then upload the data from the .csv files, as seen on this SQL script (INSERIR LINK PARA SCRIPT)

At the same time, we evaluate the uniqueness of every row, as well as the business context of the data, in order to define the primary keys for each table

https://github.com/jgcoliveira/q2_business_rev/blob/c7986839b35e1810de3d3b3cd8edb925bafcb436/mysql%20script/olist_table_creation_upload.sql#L71

We can proceed to creating the tables and uploading the data from the .csv files into their designated SQL tables.

(FOREIGN KEYS)

## 4. Data Cleaning using MySQL

Now that we have our data stored in mySQL, we can begin to analyse each table by:
1. Understanding the business context by assessing the logical relationships between data in different columns;
2. Searching for inconsistencies and data errors, then taking the appropriate corrective measures.

(LISTAR CADA TABLE E ABORDAGEM?)

## 5. Data Modeling and Visualization using Power BI

Our goal is to visualize sales numbers troughout time and according to location and product category.
To that effect, we will need to use the following tables:
- orders
- order_items
- products
- product_category_name_translation
Since we want to filter the sales data by state, but only have the state codes, we need to find a table that can provide all the Brazilian states' full names. A quick online search and we are able to find [one](https://en.wikipedia.org/wiki/Federative_units_of_Brazil).

Now that we have a clear strategy, we are ready to start using Power BI. We will perform the following steps:
1. Connect PowerBI to desired MySQL server and database;
2. Choose the tables to import;
3. Using PowerQuery, rename the tables and categorize them (Dim or Fact), review the table data, rename the useful columns, delete the unacessary ones;
4. In order to be able to filter data using the full names of all the Brazilian States, connect PowerBI to the following link
5. Select the desired table to be used
6. Set up the correct datatypes and properties for each column

Using the Model view, create the data model by establishing relationships between columns from different tables



## 6. Insights
