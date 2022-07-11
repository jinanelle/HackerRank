/*
You are given a table, Functions, containing two columns: X and Y.

Input Format
- Functions
    X : Integer
    Y : Integer

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

Sample Input
X       Y
20      20
20      20
20      21
23      22
22      23
21      20

Sample Output
20 20
20 21
22 23

*/

WITH tb AS (
    SELECT x, y, @r:=@r+1 rowNumber FROM Functions, (SELECT @r:=0) r
)
SELECT DISTINCT 
    CASE WHEN a.x < b.x THEN a.x ELSE b.x END X,
    CASE WHEN a.x < b.x THEN a.y ELSE b.y END Y
FROM tb a, tb b
WHERE a.x = b.y AND a.y = b.x AND a.rowNumber <> b.rowNumber
ORDER BY 1,2

-- OR

SELECT a.x, a.y
FROM Functions a
JOIN Functions b ON a.x = b.y AND a.y = b.x
GROUP BY a.x, a.y
HAVING COUNT(*) > 1 OR a.x < a.y
ORDER BY 1,2