SELECT etl.delete_sales_tables();
SELECT etl.clear_warehouse();
CALL etl.etl();

SELECT * FROM warehouse.fact_sales;
