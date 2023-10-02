/*
  no duplicates -> DISTINCT
  where skill = 'python, tableu, postgresql'
   skill = 'python' and skil = 'tableu' and skill = 'postgresql'
  sort output candidate id in ascending order
    group by candidate_id asc;
*/
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;
