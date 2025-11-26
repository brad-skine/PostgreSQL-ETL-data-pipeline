DROP TABLE IF EXISTS raw.sales_raw;
DROP TABLE IF EXISTS staging.sales_cleaned;

TRUNCATE TABLE 
warehouse.fact_sales,
warehouse.dim_customer,
warehouse.dim_date,
warehouse.dim_product,
warehouse.dim_promotion
CASCADE;

