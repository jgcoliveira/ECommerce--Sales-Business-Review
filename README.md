# Quarter 2 Business Review

### Goal
Sales Data BI project using using Excel and MySQL for data cleaning and modelling and PowerBI for visualization

This project is meant to demonstrate data manipulation skills necessary for Business Intelligence and Data Analyst roles, such as planning, data cleansing, modelling and visualization using industry-standard tools such as MS Excel, MySQL and Power BI. 

The subject dataset belongs to Olist (a Brazilian online retailer) and is made up of several tables describing information related with online orders between September 2016 and October 2018.

Project Walkthrough:

## 1. Business Request

Visual representation of Quarter 2 2018 Sales

User Stories:

As a Director of Sales, I want to know how much we have sold this Q2, compared to the previous year and previous Q1, so that I can know if the new marketing strategies applied this quarter have been effective. I also want which states and product categories have the most shipped orders, and if there are any trends.

As a local Sales Manager (assigned to a specific country state), I want to know about my state's sales volume, how it compares with other states and what product categories have sold the most, so that I can learn about my state's product category preferences, and share possible insights with other Sales Managers.

As a Product Specialist, I want to see how different product categories have been relating to one another on a weekly basis so that I can find any trends and colaborate with other Product Specialists on the possibility of improving product rollout

## 2. Planning & Data Preparation

Our dataset is comprised of 11 csv files that can be accessed through [this link](https://www.kaggle.com/olistbr/brazilian-ecommerce).
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

The storing process begins by creating a dedicated SQL Schema. Afterwards, we will create all the tables necessary for our analysis by defining their columns and respective datatypes, and then upload the data from the .csv files, as seen on [this SQL script]mysql script/olist_table_creation_upload.sql).

At the same time, we evaluate the uniqueness of every row, as well as the business context of the data, in order to define the primary keys for each table

(INSERIR IMAGEM)
(ORDERS É UM BOM EXEMPLO)

We can proceed to creating the tables and uploading the data from the .csv files into their designated SQL tables.

## 3. Data Cleaning



## 4. Data Modelling

## 5. Data Visualization

## 6. Insights
