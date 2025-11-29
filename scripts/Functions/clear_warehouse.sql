CREATE OR REPLACE FUNCTION etl.clear_warehouse()
RETURNS void
LANGUAGE sql
AS $$
TRUNCATE TABLE 
    warehouse.fact_sales,
    warehouse.dim_customer,
    warehouse.dim_date,
    warehouse.dim_product,
    warehouse.dim_promotion
 RESTART IDENTITY CASCADE;
$$;