CREATE DATABASE OlistAnalytics;
USE OlistAnalytics;
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, order_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
show databases;
USE olistanalytics;
SHOW TABLES;
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_customers_dataset.csv' 
INTO TABLE olistanalytics.customers 
FIELDS TERMINATED BY ','  
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
SELECT * FROM olistanalytics.customers LIMIT 10;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_orders_dataset.csv'
INTO TABLE olistanalytics.orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  order_id, 
  customer_id, 
  order_status, 
  @v_purchase_ts, 
  @v_approved_at, 
  @v_carrier_date, 
  @v_delivered_date, 
  @v_estimated_date
)
SET 
  order_purchase_timestamp = STR_TO_DATE(@v_purchase_ts, '%d-%m-%Y %H:%i'),
  order_approved_at = STR_TO_DATE(NULLIF(@v_approved_at, ''), '%d-%m-%Y %H:%i'),
  order_delivered_carrier_date = STR_TO_DATE(NULLIF(@v_carrier_date, ''), '%d-%m-%Y %H:%i'),
  order_delivered_customer_date = STR_TO_DATE(NULLIF(@v_delivered_date, ''), '%d-%m-%Y %H:%i'),
  order_estimated_delivery_date = STR_TO_DATE(@v_estimated_date, '%d-%m-%Y %H:%i');
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_products_dataset.csv'
INTO TABLE olistanalytics.products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  product_id, 
  product_category_name, 
  @v_name_len, 
  @v_desc_len, 
  @v_photos_qty, 
  @v_weight, 
  @v_length, 
  @v_height, 
  @v_width
)
SET 
  product_name_lenght = NULLIF(@v_name_len, ''),
  product_description_lenght = NULLIF(@v_desc_len, ''),
  product_photos_qty = NULLIF(@v_photos_qty, ''),
  product_weight_g = NULLIF(@v_weight, ''),
  product_length_cm = NULLIF(@v_length, ''),
  product_height_cm = NULLIF(@v_height, ''),
  product_width_cm = NULLIF(@v_width, '');
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_items_dataset.csv' 
INTO TABLE olistanalytics.order_items 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;