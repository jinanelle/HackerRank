/*
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

Input Format
- Hackers
- Challenges

Sample:
hacker      name        count
21283       Angela      6       
41933       Anna        6       
88255       Patrick     5       
73475       Samy        4       
50777       Rose        4       
62743       Frank       3       
96196       Lisa        1       

Output:
21283 Angela 6 
41933 Anna 6
88255 Patrick 5
62743 Frank 3
96196 Lisa 1

Note:
maximum = 6
1. include unique occurrences (Patrick, Frank, and Lisa)
2. include maximum occurrences (Angela, Anna)
3. exclude repeated occurrences that are less than maximum (Samy and Rose)

*/

SELECT H.hacker_id, H.name, COUNT(C.challenge_id) total
FROM Hackers H
JOIN Challenges C 
    ON C.hacker_id = H.hacker_id
GROUP BY 1, 2
HAVING 
    total IN (
        -- group by challenge_counter, and only include unique occurrences
        SELECT challenge_counter
        FROM (
                -- count challenges for each hacker
                SELECT hacker_id, COUNT(challenge_id) challenge_counter
                FROM Challenges
                GROUP BY 1
            ) AS tb
        GROUP BY challenge_counter
        HAVING COUNT(challenge_counter) = 1
    )
    OR total = (
        -- include maximum occurrences
        SELECT MAX(challenge_counter) 
        FROM (
                -- count challenges for each hacker
                SELECT hacker_id, COUNT(challenge_id) challenge_counter
                FROM Challenges
                GROUP BY 1
            ) AS tb
    )
ORDER BY 3 DESC, 1 ASC

-- Solution 2
-- In the maximim part, it's possible to ORDER BY and LIMIT instead of a subquery

-- Soultion 3
-- Using WITH, to reduce repetition

WITH 
    tb AS (
    -- count challenges for each hacker
    SELECT hacker_id, COUNT(challenge_id) challenge_counter
    FROM Challenges
    GROUP BY 1
    )
SELECT H.hacker_id, H.name, COUNT(C.challenge_id) total
FROM Hackers H
JOIN Challenges C 
    ON C.hacker_id = H.hacker_id
GROUP BY 1, 2
HAVING 
    total IN (
        -- group by challenge_counter, and only include unique occurrences
        SELECT challenge_counter
        FROM tb
        GROUP BY challenge_counter
        HAVING COUNT(challenge_counter) = 1
    )
    OR total = (
        -- include maximum occurrences
        SELECT MAX(challenge_counter) 
        FROM tb
    )
ORDER BY 3 DESC, 1 ASC