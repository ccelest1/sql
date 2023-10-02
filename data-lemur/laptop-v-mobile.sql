/*
  table tracking viewership based
  on device type: laptop, tablet, phone
    mobile = count(laptop) + count(phone)
  select l, m ^ (agg)
  output total views for lp as laptop_reviews
  total for mobile mobile_views
*/
SELECT count(*) FILTER
        (WHERE device_type = 'laptop')
        as laptop_views,
        count(*) FILTER
        (WHERE device_type in ('tablet','phone'))
        as mobile_views
from viewership;
