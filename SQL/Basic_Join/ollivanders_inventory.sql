/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

Input Format
- Wands (the higher the power, the better the wand is)
- Wands_Property ( is_evil = 0|1 )
*/

SELECT W.id, P.age, W.coins_needed, W.power
FROM Wands W
JOIN Wands_Property P 
ON P.code = W.code
WHERE 
    P.is_evil = 0 AND 
    W.coins_needed = (SELECT MIN(W2.coins_needed) 
                      FROM Wands W2 JOIN Wands_Property P2 
                      ON P2.code = W2.Code
                      WHERE P.age = P2.age AND W.power = W2.power)
ORDER BY W.power DESC, P.age DESC