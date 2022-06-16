/*
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.
*/

-- returns first matching row
SELECT ROUND(LONG_W,4)
FROM STATION 
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1

-- OR
-- returns all matching rows
SELECT ROUND(LONG_W,4)
FROM STATION 
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
)
ORDER BY 1
