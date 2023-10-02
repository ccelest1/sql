/*
cte -
s -> *
f -> messages
w -> date_part('year',sent_date::date) = '2022'
g -> sender_id
*/
with user_2022_year as (
SELECT sender_id, count(sent_date) as num_sent FROM messages
WHERE date_part('year', sent_date) = '2022'
      and date_part('month', sent_date) = '08'
GROUP BY sender_id
ORDER BY num_sent desc
LIMIT 2
)

SELECT * FROM user_2022_year;
