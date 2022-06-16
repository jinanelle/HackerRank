/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

- a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
- b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
- c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
- d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

https://xlinux.nist.gov/dads/HTML/manhattanDistance.html

*/

WITH t AS (
    SELECT MIN(LAT_N) a, MIN(LONG_W) b, MAX(LAT_N) c, MAX(LONG_W) d
    FROM STATION
)
SELECT ROUND(ABS(c-a)+ABS(d-b), 4) manhattan_distance
FROM t

--OR

SELECT ROUND(ABS(MAX(LAT_N)-MIN(LAT_N))+ABS(MAX(LONG_W)-MIN(LONG_W)), 4) manhattan_distance
FROM STATION

