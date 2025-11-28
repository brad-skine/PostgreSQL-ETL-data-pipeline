SELECT etl.delete_sales_tables();
SELECT etl.clear_warehouse();
SELECT * FROM etl.etl_sales_pipeline();



SELECT * FROM staging.sales_cleaned;

SELECT * FROM warehouse.dim_product;
-- SELECT * FROM warehouse.fact_sales;