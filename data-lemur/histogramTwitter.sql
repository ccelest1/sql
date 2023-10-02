/*
    given table of twitter data, write query to obtain histogram of tweets posted/user in 2022
    Output tweet count/user as bucket, number of twitter users that are in said bucket
*/

--solution
-- cte to look at tweets posted in the 2022 year
with activity as(
  select user_id,
        count(tweet_id) as user_tweets
  from tweets
  where tweet_date between '2022-01-01' and '2022-12-31'
  group by user_id
)

select
    user_tweets as tweet_bucket,
    count(user_id) as user_num
from activity
group by tweet_bucket;
