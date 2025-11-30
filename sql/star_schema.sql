CREATE TABLE warehouse.dim_customer (
	customer_id SERIAL PRIMARY KEY, 
	name TEXT,
	city TEXT,
	zip INT
);

CREATE TABLE warehouse.dim_product (
	product_id SERIAL PRIMARY KEY,
	name TEXT,  -- unque here would have been approach
	price NUMERIC,
	catagory TEXT 
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



ALTER TABLE warehouse.dim_customer  -- relaized later taht these needed Unique
									-- to prevent duplicates 
ADD CONSTRAINT dim_customer_name_uniq UNIQUE (name);

ALTER TABLE warehouse.dim_product 
ADD CONSTRAINT dim_product_name_uniq UNIQUE (name);

ALTER TABLE warehouse.dim_promotion 
ADD CONSTRAINT dim_promotion_name_uniq UNIQUE (name);

ALTER TABLE warehouse.dim_date 
ADD CONSTRAINT dim_date_orderdate_uniq UNIQUE (order_date);
