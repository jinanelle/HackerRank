/*
Consider P1(a,c) and P2(b,d) to be two points on a 2D plane 
where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) 
and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2 and format your answer to display  decimal digits.

https://en.wikipedia.org/wiki/Euclidean_distance

*/

WITH t AS (
    SELECT MIN(LAT_N) a, MAX(LAT_N) b, MIN(LONG_W) c, MAX(LONG_W) d
    FROM STATION
)
SELECT ROUND(SQRT(POW(b-a,2)+POW(d-c,2)), 4) euclidean_distance
FROM t

--OR

SELECT ROUND(SQRT(POW(MAX(LAT_N)-MIN(LAT_N),2)+POW(MAX(LONG_W)-MIN(LONG_W),2)), 4) euclidean_distance
FROM STATION
