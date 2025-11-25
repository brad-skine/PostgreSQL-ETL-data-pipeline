DROP TABLE IF EXISTS raw.sales_raw

CREATE TABLE raw.sales_raw (
	sale_id INT,
	customer_name TEXT,
	product_name TEXT,
	promotion_name TEXT,
	units_sold INT,
	price NUMERIC,
	order_date DATE
);



COPY raw.sales_raw
FROM 'C:\projects\data_warehouse_project\data\sales.csv'
DELIMITER ','
CSV HEADER;

