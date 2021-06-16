-- The following queries will create the necessary tables for this project.
-- These queries must be run in this exact order.
-- Data must be imported in the exact sequence below as well.

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

CREATE TABLE "features" (
    "Store" int   NOT NULL,
    "Date" date   NOT NULL,
    "Temperature" int   NOT NULL,
    "Fuel_Price" int   NOT NULL,
    "MarkDown1" int   NOT NULL,
    "MarkDown2" int   NOT NULL,
    "MarkDown3" int   NOT NULL,
    "MarkDown4" int   NOT NULL,
    "MarkDown5" int   NOT NULL,
    "CPI" int   NOT NULL,
    "Unemployment" int   NOT NULL,
    "IsHoliday" bool   NOT NULL,
    PRIMARY KEY ("Store")
);

CREATE TABLE "stores_data" (
    "Store" int   NOT NULL,
    "Type" varchar   NOT NULL,
    "Size" int   NOT NULL,
    PRIMARY KEY ("Store"),
    FOREIGN KEY("Store") REFERENCES "features" ("Store")
);

CREATE TABLE "sales_data" (
    "Store" int   NOT NULL,
    "Dept" int   NOT NULL,
    "Date" date   NOT NULL,
    "Weekly_Sales" int   NOT NULL,
    "IsHoliday" bool   NOT NULL,
    PRIMARY KEY ("Store"),
    FOREIGN KEY("Store") REFERENCES "stores_data" ("Store")
);

-- To drop all tables and start over, use the queries below
-- DROP SCHEMA public CASCADE;
-- CREATE SCHEMA public;

-- Check to make sure all tables are generated correctly
-- SELECT * FROM dspi_data;
-- SELECT * FROM dspi_ratio;
-- SELECT * FROM features;
-- SELECT * FROM sales_data;
-- SELECT * FROM stores_data;