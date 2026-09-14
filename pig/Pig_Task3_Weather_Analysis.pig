-- Pig Task 3: Weather Condition Analysis

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

-- Remove header and empty weather values
filtered_accidents = FILTER accidents BY 
    Weather_Condition IS NOT NULL 
    AND Weather_Condition != 'Weather_Condition';

-- Group by weather condition
weather_group = GROUP filtered_accidents BY Weather_Condition;

-- Count accidents
weather_count = FOREACH weather_group GENERATE
    group AS Weather_Condition,
    COUNT(filtered_accidents) AS Total_Accidents;

-- Sort highest accidents first
sorted_weather = ORDER weather_count BY Total_Accidents DESC;

-- Store result
STORE sorted_weather INTO '/traffic_accidents/Pig_Task3_Weather_Output'
USING PigStorage(',');