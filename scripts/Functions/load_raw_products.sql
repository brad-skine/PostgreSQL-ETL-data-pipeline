
CREATE OR REPLACE FUNCTION etl.load_raw_products(
	)
    RETURNS void
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$

DROP TABLE IF EXISTS raw.products_raw;

CREATE TABLE raw.products_raw (
	product_Id INT,
	product_name TEXT,
	catagory TEXT,
	brand TEXT,
	retail_price NUMERIC,
	supplier TEXT
);


COPY raw.products_raw
FROM 'C:\projects\data_warehouse_project\data\products.csv'
DELIMITER ','
CSV HEADER;


$BODY$;
ALTER FUNCTION etl.load_raw_products()
    OWNER TO postgres;
