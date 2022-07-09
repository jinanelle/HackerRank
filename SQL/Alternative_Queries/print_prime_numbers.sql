/*
Write a query to print all prime numbers less than or equal to 1000. 
Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

For example, the output for all prime numbers <= 10  would be:
2&3&5&7

*/

SET @row_num:=0;
WITH tb AS (
    SELECT @row_num:=@row_num+1 AS row_idx
    FROM INFORMATION_SCHEMA.TABLES t1,INFORMATION_SCHEMA.TABLES t2
    LIMIT 1000 )
SELECT row_idx 
FROM tb
ORDER BY row_idx;