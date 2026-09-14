-- Pig Task 2: Monthly Accident Trend

SET default_parallel 4;

accidents = LOAD '/traffic_accidents/US_Traffic_Accidents_Cleaned.csv'
USING PigStorage(',')
AS (
ID:chararray,
Severity:int,
Start_Time:chararray,
Year:int,
Month:int,
Hour:int,
City:chararray,
State:chararray,
Weather_Condition:chararray,
Temperature:double,
Visibility:double,
Distance:double,
Start_Lat:double,
Start_Lng:double
);

-- Remove header/invalid month records
filtered_accidents = FILTER accidents BY Month IS NOT NULL AND Month > 0;

-- Group by month
month_group = GROUP filtered_accidents BY Month;

-- Count accidents per month
month_count = FOREACH month_group GENERATE
    group AS Month,
    COUNT(filtered_accidents) AS Total_Accidents;

-- Sort by month
sorted_month = ORDER month_count BY Month ASC;

-- Store output
STORE sorted_month INTO '/traffic_accidents/Pig_Task2_Monthly_Output'
USING PigStorage(',');