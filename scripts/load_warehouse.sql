CREATE OR REPLACE FUNCTION etl.load_warehouse(
	)
    RETURNS void
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$

INSERT INTO warehouse.dim_customer (name, city, zip)
SELECT DISTINCT 
	customer_name as name,
	city AS city,
	NULL::INT AS zip
FROM staging.sales_cleaned;

INSERT INTO warehouse.dim_date (order_date, year, month, day)
SELECT DISTINCT 
	order_date,
	EXTRACT(day FROM order_date) as day,
	EXTRACT(month FROM order_date) as month,
	EXTRACT(year FROM order_date) as year
FROM staging.sales_cleaned
WHERE order_date IS NOT NULL;

INSERT INTO warehouse.dim_product (name, catagory)
SELECT DISTINCT 
	product_name AS name,
	NULL as catagory
FROM staging.sales_cleaned;

INSERT INTO warehouse.dim_promotion (name,ad_type,coupon_type,
	discount,start_date, end_date, active, updatetime)
SELECT DISTINCT  -- default values
    promotion_name,
    'Unknown' AS ad_type,
    'None' AS coupon_type,
    0 AS discount,
    CURRENT_DATE AS start_date,
    CURRENT_DATE + INTERVAL '3 years' AS end_date,
    TRUE AS active,
    CURRENT_TIMESTAMP AS updatetime
FROM staging.sales_cleaned
WHERE promotion_name IS NOT NULL;

INSERT INTO warehouse.fact_sales (customer_id, product_id, 
promotion_id, date_id, units_sold, revenue)

SELECT 

c.customer_id,
pr.product_id,
pro.promotion_id,
d.date_id,
s.units_sold,
s.total_revenue AS revenue

FROM staging.sales_cleaned s
JOIN warehouse.dim_customer c ON s.customer_name = c.name
JOIN warehouse.dim_product pr ON s.product_name = pr.name
--left join as many sales have may have no promotion.
LEFT JOIN warehouse.dim_promotion pro ON s.promotion_name = pro.name
JOIN warehouse.dim_date d ON s.order_date = d.order_date;


$BODY$;

ALTER FUNCTION etl.load_warehouse()
    OWNER TO postgres;
