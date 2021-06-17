-- The following queries will create the necessary tables for this project.
-- These queries must be run in this exact order.
-- Data must be imported in the exact table sequence below as well.

CREATE TABLE "dspi_data" (
    "date" date   NOT NULL,
    "dspi" numeric   NOT NULL,
    PRIMARY KEY("date")
);

CREATE TABLE "inflation" (
    "date" date   NOT NULL,
    "inflation" numeric   NOT NULL,
    FOREIGN KEY("date") REFERENCES "dspi_data" ("date")
);

CREATE TABLE "stores_data" (
    "store" int   NOT NULL,
    "type" varchar   NOT NULL,
    "size" int   NOT NULL,
    PRIMARY KEY ("store")
);

CREATE TABLE "features" (
    "store" int   NOT NULL,
    "date" date   NOT NULL,
    "temperature" numeric   NOT NULL,
    "fuel_price" numeric   NOT NULL,
    "cpi" numeric   NOT NULL,
    "unemployment" numeric   NOT NULL,
    "isholiday" bool   NOT NULL,
    FOREIGN KEY("store") REFERENCES "stores_data" ("store")
);

CREATE TABLE "sales_data" (
    "store" int   NOT NULL,
    "dept" int   NOT NULL,
    "date" date   NOT NULL,
    "weekly_sales" numeric   NOT NULL,
    "isholiday" bool   NOT NULL,
    FOREIGN KEY("store") REFERENCES "stores_data" ("store")
);

-- To drop all tables and start over, use the queries below
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- To drop a single table, use the query below
DROP TABLE sales_data;
DROP TABLE stores_data;
DROP TABLE features;
DROP TABLE dspi_data;

-- Check to make sure all of the tables generated correctly
SELECT * FROM dspi_data;
SELECT * FROM inflation;
SELECT * FROM features;
SELECT * FROM sales_data;
SELECT * FROM stores_data; 