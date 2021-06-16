Features
-
Store PK int FK >- Sales_Data.Store
Date date FK >- DSPI_data.Date
Temperature int
Fuel_Price  int
MarkDown1  int
MarkDown2  int
MarkDown3  int
MarkDown4  int
MarkDown5  int
CPI int
Unemployment int
IsHoliday bool FK >- Sales_Data.IsHoliday

Sales_Data
-
Store PK int FK >- Stores_Data.Store
Dept int
Date date
Weekly_Sales int
IsHoliday bool

Stores_Data
-
Store PK int FK >- Features.Store
Type varchar
Size int

DSPI_data
-
Date date FK >- DSPI_ratio.Date
DSPI int

DSPI_ratio
-
Date date FK >- Sales_Data.Date
DSPI_ratio int
