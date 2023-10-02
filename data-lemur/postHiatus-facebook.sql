/*

find days between first and last post of 2021 calendar year
for users who have posted more than once

cte that shows us the tweets posted in the year 2021
cte that groups by user_id
min_post_date = min(post_date::date)
max_post_date = max(post_date::date)
max_post_date - min_post_date = days_between

we want to know in 2021 year
use date_part function
date_part('year', post_date::date) = 2021
group by user_id // group by user_id to undesrstand
which posts correspond to respective user

screen out users who only have one post
having count(post_id)>1

*/
select user_id,
      max(post_date::date) - min(post_date::date)
      as days_between
from posts
WHERE date_part('year',post_date::date)=2021
group by user_id
having count(post_id)>1;

--- min and max you need ex: max year max(post_date::year), min(post_date::year)
