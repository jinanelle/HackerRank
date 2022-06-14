/*
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/

SELECT DISTINCT(CITY)
FROM STATION 
WHERE CITY REGEXP '^[aeiouAEIOU]';

-- OR

SELECT DISTINCT(CITY)
FROM STATION 
WHERE CITY RLIKE '^[aeiouAEIOU]';

-- OR

SELECT DISTINCT CITY
FROM STATION 
WHERE SUBSTR(CITY, 1, 1) IN ('a', 'e', 'i', 'o', 'u');