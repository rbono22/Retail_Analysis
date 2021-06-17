-- The following queries assume that all tables have been created using the queries in the create_table_schema.sql file

-- Join features and stores_data
SELECT fe.store,
stdata.type,
stdata.size,
fe.date,
fe.temperature,
fe.fuel_price,
fe.cpi,
fe.unemployment,
fe.isholiday
INTO feature_store_data
FROM features AS fe
LEFT JOIN stores_data AS stdata
ON (stdata.store = fe.store);
-- Check to make sure join is successful
SELECT * FROM feature_store_data;
-- If not successful, drop table
DROP TABLE feature_store_data;


-- Second join, feature_store_data and sales_data
SELECT fsd.store,
fsd.type,
fsd.size,
sd.dept,
fsd.date,
sd.weekly_sales,
fsd.temperature,
fsd.fuel_price,
fsd.cpi,
fsd.unemployment,
fsd.isholiday
INTO feature_store_sales_data
FROM feature_store_data AS fsd
LEFT JOIN sales_data AS sd
ON (sd.date = fsd.date) AND (sd.store = fsd.store);
-- Check to make sure second join is successful
SELECT * FROM feature_store_sales_data;
-- If not successful, drop table
DROP TABLE feature_store_sales_data;


-- Get number of rows: There are 422,740 rows
SELECT count(*) AS exact_count FROM feature_store_sales_data;


-- Third join, feature_store_sales_data and inflation
SELECT fsd.store,
fsd.type,
fsd.size,
fsd.dept,
fsd.date,
fsd.weekly_sales,
fsd.temperature,
fsd.fuel_price,
fsd.cpi,
i.inflation,
fsd.unemployment,
fsd.isholiday
INTO feature_store_sales_inflation_data
FROM feature_store_sales_data AS fsd
LEFT JOIN inflation AS i
ON EXTRACT(YEAR FROM fsd.date) = EXTRACT(YEAR FROM i.date)
-- Check to make sure third join is successful
SELECT * FROM feature_store_sales_inflation_data;
-- If not successful, drop table
DROP TABLE feature_store_sales_inflation_data;


-- Fourth join, feature_store_sales_inflation_data and dspi_data
SELECT fsd.store,
fsd.type,
fsd.size,
fsd.dept,
fsd.date,
fsd.weekly_sales,
fsd.temperature,
fsd.fuel_price,
fsd.cpi,
fsd.inflation,
dd.dspi,
fsd.unemployment,
fsd.isholiday
INTO feature_store_sales_inflation_dspi_data
FROM feature_store_sales_inflation_data AS fsd
LEFT JOIN dspi_data AS dd
ON (SELECT EXTRACT(YEAR FROM fsd.date) = EXTRACT(YEAR FROM dd.date)
AND EXTRACT(MONTH FROM fsd.date) = EXTRACT(MONTH FROM dd.date))
-- Check to make sure fourth join is successful
select * from feature_store_sales_inflation_dspi_data;
-- If not successful, drop table
DROP TABLE feature_store_sales_inflation_dspi_data;


-- Check number of rows in the dataset per store
SELECT store AS store_number, 
	COUNT(store) AS number_of_rows
INTO store_counts
FROM feature_store_sales_inflation_dspi_data AS fsd
GROUP BY fsd.store
ORDER BY fsd.store;


-- Check number of rows in descending order.
SELECT *
FROM store_counts
ORDER BY number_of_rows DESC;
-- Store 13 has the highest number of rows: 10,500
-- Store 36 has the least number of rows: 6,248
-- MAX - MIN = 4,252 
