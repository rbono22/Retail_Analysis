-- The following query will create the final table for the merged dataset "final_cleaned_dataset.csv"
-- This dataset is found inside of the "Resources" folder in "cleaned_datasets"


CREATE TABLE "retail" (
    "store" int   NOT NULL,
    "type" varchar   NOT NULL,
    "size" int   NOT NULL,
    "dept" int   NOT NULL,
    "date" date   NOT NULL,
    "weekly_sales" numeric   NOT NULL,
    "temperature" numeric   NOT NULL,
    "fuel_price" numeric   NOT NULL,
    "cpi" numeric   NOT NULL,
    "inflation" numeric   NOT NULL,
    "dspi" numeric   NOT NULL,
    "unemployment" numeric   NOT NULL,
    "isholiday" bool   NOT NULL
);


-- To drop the retail table and start over, use the query below
DROP TABLE retail;

-- Check to make the retail table generated correctly
SELECT * FROM retail;
