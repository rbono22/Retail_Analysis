Features
-
Store PK int FK >- Stores_data.Store
Date date
Temperature numeric
Fuel_Price  numeric
CPI numeric
Unemployment numeric
IsHoliday bool

Sales_data
-
Store PK int FK >- Stores_data.Store
Dept int
Date date FK >- Features.Date
Weekly_Sales numeric
IsHoliday bool

Stores_data
-
Store PK int
Type varchar
Size int

DSPI_data
-
Date date FK >- Features.Date
DSPI numeric

Inflation
-
Date date FK >- DSPI_data.Date
inlation numeric