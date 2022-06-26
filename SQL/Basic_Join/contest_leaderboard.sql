/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 

If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of 0 from your result.

Input Format
- Hackers
- Submissions

Sample Output
4071 Rose 191
74842 Lisa 174
84072 Bonnie 100
4806 Angela 89
26071 Frank 85
80305 Kimberly 67
49438 Patrick 43

Explanation
Hacker Rose submitted 3 solutions for 2 challenges 19797 and 49593:
4071 Rose 19797 95
4071 Rose 49593 43
4071 Rose 49593 96
the total score = 95 + max (43, 96) = 191.
-
Hacker Bonnie submitted 2 solutions for 2 challenges 49593 and 63132:
84072 Bonnie 49593 100
84072 Bonnie 63132 0
the total score = 100 + 0 = 100.

*/

SELECT H.hacker_id, H.name, SUM(tb.score) total
FROM Hackers H
JOIN (
    -- get the max score for each hacker and challenge
    SELECT hacker_id, challenge_id, MAX(score) score
    FROM Submissions
    GROUP BY hacker_id, challenge_id 
    ) AS tb
ON tb.hacker_id = H.hacker_id
GROUP BY 1, 2
HAVING total <> 0
ORDER BY 3 DESC, 1 ASC

