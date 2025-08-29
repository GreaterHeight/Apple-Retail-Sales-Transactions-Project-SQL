-- Apple Retails Millions Rows Sales Schemas

-- Create Database
CREATE DATABASE AppleSalesDB
GO

USE AppleSalesDB
GO

/*
IMPORTANT PROJECT GUIDANCE 
-- ------------------------------
PLEASE READ THIS
-- ------------------------------
-- Please make sure to Import in this order: 
1. Import first to Category TABLE
2. Import to Product Table
3. Import to Stores Table
4. Import to Sales TABLE
5. Import to Warranty Table

For any issues reach out to below
dm on instagram -- https://www.instagram.com/TheSegunSamuel/
email segun.samuel@greaterheight.tech
*/

-- DROP TABLE command
DROP TABLE IF EXISTS warranty;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS stores;

-- CREATE TABLE commands

CREATE TABLE stores
(
	store_id NVARCHAR(5) PRIMARY KEY,
	store_name	NVARCHAR(30),
	city	NVARCHAR(25),
	country NVARCHAR(25)
);


CREATE TABLE category
(
	category_id NVARCHAR(10) PRIMARY KEY,
	category_name NVARCHAR(20)
);

CREATE TABLE products
(
	product_id	NVARCHAR(10) PRIMARY KEY,
	product_name	NVARCHAR(35),
	category_id	NVARCHAR(10),
	launch_date	date,
	price FLOAT,
	CONSTRAINT fk_category 
	FOREIGN KEY (category_id) 
	REFERENCES category(category_id)
);

CREATE TABLE sales
(
	sale_id	NVARCHAR(15) PRIMARY KEY,
	sale_date	DATE,
	store_id	NVARCHAR(5), -- this fk
	product_id	NVARCHAR(10), -- this fk
	quantity INT,
	CONSTRAINT fk_store 
	FOREIGN KEY (store_id) 
	REFERENCES stores(store_id),
	CONSTRAINT fk_product 
	FOREIGN KEY (product_id) 
	REFERENCES products(product_id)
);

CREATE TABLE warranty
(
	claim_id NVARCHAR(10) PRIMARY KEY,	
	claim_date	date,
	sale_id	NVARCHAR(15),
	repair_status NVARCHAR(15),
	CONSTRAINT fk_orders 
	FOREIGN KEY (sale_id) 
	REFERENCES sales(sale_id)
);
Go



-- Success Message
SELECT 'Schema created successful' as Success_Message;

 
BULK INSERT Category
FROM 'C:\DataScience2025\Apple Sales Data Analysis Project\category.csv'
WITH (
   FORMAT = 'CSV',
	FIELDTERMINATOR = ',',  -- Specifies the column delimiter
	FIELDQUOTE = '"',       -- handle quoted fields
    ROWTERMINATOR = '\n',   -- Specifies the row terminator (newline character)
    FIRSTROW = 2,            -- Optional: Skips the header row if present
	TABLOCK
);
Go


BULK INSERT Products
FROM 'C:\DataScience2025\Apple Sales Data Analysis Project\Products.csv'
WITH (
    FORMAT = 'CSV',
	FIELDTERMINATOR = ',',  -- Specifies the column delimiter
	FIELDQUOTE = '"',       -- handle quoted fields
    ROWTERMINATOR = '\n',   -- Specifies the row terminator (newline character)
    FIRSTROW = 2,            -- Optional: Skips the header row if present
	TABLOCK
);
Go




BULK INSERT Stores
FROM 'C:\DataScience2025\Apple Sales Data Analysis Project\Stores.csv'
WITH (
    FORMAT = 'CSV',
	FIELDTERMINATOR = ',',  -- Specifies the column delimiter
	FIELDQUOTE = '"',       -- handle quoted fields
    ROWTERMINATOR = '\n',   -- Specifies the row terminator (newline character)
    FIRSTROW = 2,            -- Optional: Skips the header row if present
	TABLOCK
);
Go

BULK INSERT Sales
FROM 'C:\DataScience2025\Apple Sales Data Analysis Project\Sales.csv'
WITH (
    FORMAT = 'CSV',
	FIELDTERMINATOR = ',',  -- Specifies the column delimiter
	FIELDQUOTE = '"',       -- handle quoted fields
    ROWTERMINATOR = '\n',   -- Specifies the row terminator (newline character)
    FIRSTROW = 2,            -- Optional: Skips the header row if present
	TABLOCK
);
Go


BULK INSERT Warranty
FROM 'C:\DataScience2025\Apple Sales Data Analysis Project\Warranty.csv'
WITH (
    FORMAT = 'CSV',
	FIELDTERMINATOR = ',',  -- Specifies the column delimiter
	FIELDQUOTE = '"',       -- handle quoted fields
    ROWTERMINATOR = '\n',   -- Specifies the row terminator (newline character)
    FIRSTROW = 2,            -- Optional: Skips the header row if present
	TABLOCK
);
Go

-- Success Message
SELECT 'Data Imported successful' as Success_Message;

 


