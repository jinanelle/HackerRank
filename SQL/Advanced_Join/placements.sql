/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Input Format
- Students
    ID : Integer
    Name : String
- Friends
    ID : Integer
    Friend_ID : Integer
- Packages
    ID : Integer
    Salary : Float

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

*/

SELECT s.name
FROM Students s
JOIN Packages p ON p.id = s.id
JOIN Friends f ON f.id = s.id
JOIN Packages pf ON pf.id = f.friend_id
WHERE pf.salary > p.salary
ORDER BY pf.salary ASC