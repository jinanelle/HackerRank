/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Input Format
- OCCUPATIONS Table
    Name: String
    Occupation: String

Sample Output
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria

Explanation
The first column is an alphabetically ordered list of Doctor names.

Pivot table : Rotate rows to columns
*/

WITH tb AS (
    SELECT 
        CASE WHEN Occupation = 'Doctor' THEN @rD := @rD +1
             WHEN Occupation = 'Professor' THEN @rP := @rP + 1
             WHEN Occupation = 'Singer' THEN @rS := @rS + 1 
             WHEN Occupation = 'Actor' THEN @rA := @rA + 1 
             END row_idx,
        CASE WHEN Occupation = 'Doctor' THEN Name END Doctor,
        CASE WHEN Occupation = 'Professor' THEN Name END Professor,
        CASE WHEN Occupation = 'Singer' THEN Name END Singer,
        CASE WHEN Occupation = 'Actor' THEN Name END Actor
    FROM OCCUPATIONS,
        (SELECT @rD:=0, @rP:=0, @rS:=0, @rA:=0) r
    ORDER BY Name)
SELECT MAX(Doctor), MAX(Professor), MAX(Singer), MAX(Actor)
FROM tb
GROUP BY row_idx