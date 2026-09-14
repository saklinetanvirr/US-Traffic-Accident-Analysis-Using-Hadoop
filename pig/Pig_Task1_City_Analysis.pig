-- Pig Task 1: City-wise Accident Analysis

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

city_group = GROUP accidents BY City;

city_count = FOREACH city_group GENERATE
    group AS City,
    COUNT(accidents) AS Total_Accidents;

sorted_city = ORDER city_count BY Total_Accidents DESC;

top_city = LIMIT sorted_city 10;

STORE top_city INTO '/traffic_accidents/Pig_Task1_City_Output'
USING PigStorage(',');