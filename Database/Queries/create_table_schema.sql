-- The following queries will create the necessary tables for this project.
-- These queries must be run in this exact order.
-- Data must be imported in the exact table sequence below as well.

CREATE TABLE "dspi_data" (
    "Date" date   NOT NULL,
    "DSPI" numeric   NOT NULL,
    PRIMARY KEY("Date")
);

CREATE TABLE "dspi_ratio" (
    "Date" date   NOT NULL,
    "DSPI_ratio" numeric   NOT NULL,
    FOREIGN KEY("Date") REFERENCES "dspi_data" ("Date")
);

CREATE TABLE "stores_data" (
    "Store" int   NOT NULL,
    "Type" varchar   NOT NULL,
    "Size" int   NOT NULL,
    PRIMARY KEY ("Store")
);

CREATE TABLE "features" (
    "Store" int   NOT NULL,
    "Date" date   NOT NULL,
    "Temperature" numeric   NOT NULL,
    "Fuel_Price" numeric   NOT NULL,
    "MarkDown1" numeric   NOT NULL,
    "MarkDown2" numeric   NOT NULL,
    "MarkDown3" numeric   NOT NULL,
    "MarkDown4" numeric   NOT NULL,
    "MarkDown5" numeric   NOT NULL,
    "CPI" numeric   NOT NULL,
    "Unemployment" numeric   NOT NULL,
    "IsHoliday" bool   NOT NULL,
    FOREIGN KEY("Store") REFERENCES "stores_data" ("Store")
);

CREATE TABLE "sales_data" (
    "Store" int   NOT NULL,
    "Dept" int   NOT NULL,
    "Date" date   NOT NULL,
    "Weekly_Sales" numeric   NOT NULL,
    "IsHoliday" bool   NOT NULL,
    FOREIGN KEY("Store") REFERENCES "stores_data" ("Store")
);

-- To drop all tables and start over, use the queries below
-- DROP SCHEMA public CASCADE;
-- CREATE SCHEMA public;

-- To drop a single table, use the query below
-- DROP TABLE sales_data;
-- DROP TABLE stores_data;
-- DROP TABLE features;

-- Check to make sure all of the tables generated correctly
SELECT * FROM dspi_data;
SELECT * FROM dspi_ratio;
SELECT * FROM features;
SELECT * FROM sales_data;
SELECT * FROM stores_data;