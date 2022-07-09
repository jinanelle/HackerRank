/*
Write a query to print all prime numbers less than or equal to 1000. 
Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

For example, the output for all prime numbers <= 10  would be:
2&3&5&7

*/

SET @row_num:=1;
WITH 
numbers AS (
    SELECT @row_num:=@row_num+1 AS val
    FROM INFORMATION_SCHEMA.TABLES t1, INFORMATION_SCHEMA.TABLES t2
    LIMIT 999 ),
numbers_reminders AS (
    SELECT n1.val, 
    (SELECT COUNT(n2.val)
    FROM numbers n2
    WHERE n2.val < ((n1.val / 2) + 1) AND  MOD(n1.val, n2.val) = 0) reminders
    FROM numbers n1
    )
SELECT GROUP_CONCAT(val SEPARATOR '&')
FROM numbers_reminders
WHERE reminders = 0
ORDER BY 1