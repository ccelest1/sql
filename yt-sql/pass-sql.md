# pass sql interviews

## Google
```sql
-- which website received most visits as reflected by clicks between '2002-01-01' and '2022-06-04'
-- 1. so we are given two tables that are google_search_websites and google_search_activity and asked to find about frequency of clicks
-- the output expects a table that provides the url , click_count count() - aggregate function, order by col desc

select gsw.url, count(gsa.session_id) as click_count
from google_search_websites gsw
inner join google_search_activity gsa
    on (gsw.website_id=gsa.website_id)
where event_type = 'clicked'
    and DATE(creation_dt) between '2022-01-01' and '2022-06-01'
group by gsw.url
order by click_count desc
```
### start with clarifying questions
- want to start with some clarifying questions: is it fair to assume that there is a many to one relationship between activity and website table, are there any missing values in either tables
- ask if there are any inherent relationships, if there are missing values

### starting problem
- so let me start problem and as i go i will solve problem out loud

```sql
-- alt
where activity as(
    select website_id, count(*) click_count
    from google_search_activity gsa
    where event_type = 'clicked'
        and date(creation_dt) between '2022-01-01' and '2022-06-01'
        group by website_id
)

select url, click_count
from google_search_websites gsw
right join activity
    on(gsa.website_id=gsw.website_id)
order by click_count desc
```
