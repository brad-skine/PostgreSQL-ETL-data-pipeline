SELECT etl.delete_sales_tables();
SELECT etl.load_raw_sales();
SELECT etl.transform_sales();
SELECT etl.load_warehouse();
