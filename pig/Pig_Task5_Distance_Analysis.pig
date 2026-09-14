-- Pig Task 5: Distance Impact Analysis

SET default_parallel 1;


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


-- Remove header and invalid distance values
filtered_accidents = FILTER accidents BY
    ID != 'ID'
    AND Distance IS NOT NULL
    AND Distance >= 0;


-- Short distance accidents (0-1 mile)
short_distance = FILTER filtered_accidents BY Distance <= 1;

short_result = FOREACH short_distance GENERATE
    'Short Distance' AS Distance_Range;


-- Medium distance accidents (1-5 miles)
medium_distance = FILTER filtered_accidents BY 
    Distance > 1 AND Distance <= 5;

medium_result = FOREACH medium_distance GENERATE
    'Medium Distance' AS Distance_Range;


-- Long distance accidents (>5 miles)
long_distance = FILTER filtered_accidents BY Distance > 5;

long_result = FOREACH long_distance GENERATE
    'Long Distance' AS Distance_Range;


-- Combine categories
all_distance = UNION short_result, medium_result, long_result;


-- Group categories
distance_group = GROUP all_distance BY Distance_Range;


-- Count accidents
distance_count = FOREACH distance_group GENERATE
    group AS Distance_Range,
    COUNT(all_distance) AS Total_Accidents;


-- Sort result
sorted_distance = ORDER distance_count BY Total_Accidents DESC;


-- Store output
STORE sorted_distance INTO '/traffic_accidents/Pig_Task5_Distance_Output'
USING PigStorage(',');