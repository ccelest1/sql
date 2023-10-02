/*
  return ids of fb pages with zero likes
    pages with no likes, rows with missing date and values
    right join -> null values occuring in the pages_table
    0 likes represented by rows in pages_like with NULL
    output is to be sorted in ascending ORDER BY
      group by page_id
      order by page_id asc

    resulting table -> page_id, likes for pages with no likes
*/
select
      pg.page_id
from pages pg
left join page_likes pl
  on (pg.page_id=pl.page_id)
where pl.page_id is NULL;
