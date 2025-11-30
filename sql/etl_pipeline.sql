SELECT etl.load_raw_sales(); -- extract
SELECT etl.transform_sales(); -- transform
SELECT etl.load_warehouse(); -- load into warehouse - star schemas
