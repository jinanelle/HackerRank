/*
Query the average population for all cities in CITY, rounded down to the nearest integer.
Note
CEIL()  : rounds UP 
FLOOR() : rounds DOWN
*/

SELECT FLOOR(AVG(Population))
FROM CITY
