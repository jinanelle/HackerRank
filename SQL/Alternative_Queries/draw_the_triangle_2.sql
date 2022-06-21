/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *

Write a query to print the pattern P(20).
*/

-- the query has to refer to a table, any existing table
-- SQL has many built-in tables, like INFORMATION_SCHEMA.TABLES

SET @num = 0;
SELECT REPEAT('* ', @num:=@num+1) 
FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;