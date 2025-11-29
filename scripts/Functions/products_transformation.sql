
CREATE OR REPLACE FUNCTION etl.transform_products()
    RETURNS void
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$



DROP TABLE IF EXISTS staging.products_cleaned;
CREATE TABLE staging.products_cleaned AS 
SELECT 
	product_id,
	INITCAP(product_name) as product_name,
	INITCAP(catagory) as catagory,
	INITCAP(brand) as brand,
	retail_price,
	retail_price * 1.15 AS with_gst_price,
	INITCAP(supplier) as supplier
FROM raw.products_raw
WHERE retail_price > 0;


$BODY$;
ALTER FUNCTION etl.transform_products()
    OWNER TO postgres;


	