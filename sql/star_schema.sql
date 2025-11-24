CREATE TABLE warehouse.dim_customer (
	customer_id SERIAL PRIMARY KEY, 
	name TEXT,
	city TEXT,
	zip INT
);

CREATE TABLE warehouse.dim_product (
	product_id SERIAL PRIMARY KEY,
	name TEXT,
	price NUMERIC,
	category TEXT 
);

CREATE TABLE warehouse.dim_date (
	date_id SERIAL PRIMARY KEY,
	order_date Date,
	year int,
	month int,
	day INT
);


CREATE TABLE warehouse.dim_promotion (
	promotion_id SERIAL PRIMARY KEY,
	name TEXT,
	ad_type TEXT,
	coupon_type TEXT,
	discount DECIMAL(12,4),
	start_date DATE,
	end_date DATE,
	Active BOOLEAN,
	UpdateTime TIMESTAMP 
);


CREATE TABLE warehouse.fact_sales (
	sale_id SERIAL PRIMARY KEY,
	  customer_id INT REFERENCES warehouse.dim_customer(customer_id),
    product_id INT REFERENCES warehouse.dim_product(product_id),
    promotion_id INT REFERENCES warehouse.dim_promotion(promotion_id),
    date_id INT REFERENCES warehouse.dim_date(date_id),
	units_sold NUMERIC,
	revenue NUMERIC
);
	
