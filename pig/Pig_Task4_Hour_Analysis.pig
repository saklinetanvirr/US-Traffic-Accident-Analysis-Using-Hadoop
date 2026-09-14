-- Pig Task 4: Hour-wise Accident Analysis

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


-- Remove header row and invalid hour values
filtered_accidents = FILTER accidents BY 
    ID != 'ID'
    AND Hour IS NOT NULL
    AND Hour >= 0
    AND Hour <= 23;


-- Group by hour
hour_group = GROUP filtered_accidents BY Hour;


-- Count accidents for each hour
hour_count = FOREACH hour_group GENERATE
    group AS Hour,
    COUNT(filtered_accidents) AS Total_Accidents;


-- Sort hours from 0 to 23
sorted_hour = ORDER hour_count BY Hour ASC;


-- Save result
STORE sorted_hour INTO '/traffic_accidents/Pig_Task4_Hour_Output'
USING PigStorage(',');