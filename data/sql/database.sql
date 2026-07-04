CREATE DATABASE procurement_analytics;
USE procurement_analytics;

CREATE TABLE suppliers(
supplier_id VARCHAR(10) PRIMARY KEY,
supplier_name VARCHAR(100),
supplier_rating DECIMAL(2,1),
contract_type VARCHAR(30)
);

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(255),
category_id INT,
category_name VARCHAR(100),
product_price DECIMAL(10,2),
supplier_id VARCHAR(10),
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id)
);

CREATE TABLE purchase_orders(
order_item_id INT PRIMARY KEY,
order_id INT,
order_date DATETIME,
shipping_date DATETIME,
product_id INT,
quantity INT,
unit_price DECIMAL(10,2),
procurement_cost DECIMAL(10,2),
lead_time INT,
delivery_delay INT,
delivery_status VARCHAR(30),
shipping_mode VARCHAR(30),
order_country VARCHAR(100),
order_region VARCHAR(100),
FOREIGN KEY(product_id)
REFERENCES products(product_id)
);

CREATE TABLE inventory(
inventory_id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT,
warehouse VARCHAR(50),
inventory_level INT,
reorder_level INT,
safety_stock INT,
inventory_status VARCHAR(50),
FOREIGN KEY(product_id)
REFERENCES products(product_id)
);

CREATE TABLE payments(
payment_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
payment_status VARCHAR(30),
payment_date DATETIME
);
DROP TABLE payments;
