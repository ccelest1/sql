/*
  duplicates, >=2 (identical info)
  s -> count(company_id) as duplicate_companies
  f -> job_listings
  g -> duplicate_companies
  h -> count(count_id) >=2
*/
with job_counts as (
  select company_id, title, description,
  count(job_id) as job_count
  from job_listings
  group by company_id, title, description
)

select count(distinct company_id) as duplicate_companies
from job_counts
where job_count>1;
