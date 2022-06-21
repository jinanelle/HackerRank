/*
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
*/

-- only TRUE when the number of entries is ODD

SELECT ROUND(S.LAT_N,4) median
FROM STATION S
WHERE 
      (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N < S.LAT_N) = 
      (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N > S.LAT_N)


-- more accurate

SET @row_num:=0;
SELECT ROUND(AVG(LAT_N),4) median
FROM
      (SELECT @row_num:=@row_num+1 AS row_idx, LAT_N
      FROM STATION
      ORDER BY LAT_N) S
WHERE S.row_idx in (FLOOR((@row_num+1)/2), FLOOR((@row_num+2)/2));

