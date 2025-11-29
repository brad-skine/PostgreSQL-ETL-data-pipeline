SELECT etl.delete_sales_tables();
SELECT etl.clear_warehouse();
CALL etl.etl();
-- SELECT etl.etl_sales_pipeline();



-- SELECT * FROM staging.sales_cleaned;


-- SELECT * FROM warehouse.dim_product;
SELECT * FROM warehouse.dim_customer;

