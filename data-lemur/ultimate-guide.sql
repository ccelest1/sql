-- ! GROUP BY !
-- [question](https://datalemur.com/questions/tesla-unfinished-parts)
-- tesla investigating prod bottlenecks and req data extraction
-- write query to determine parts that have started assemply process, not finished
/*
    parts_assembly table has all parts in production at varying stages
    unifnished part lacks finish_date
*/
-- solution
select part from parts_assembly
where finish_date is NULL
group by part;
-- or
select * from parts_assembly
where finish_date is NULL
group by parts_assembly.id;


-- ! AGGREGATE FUNCTIONS !

-- [question](https://datalemur.com/questions/cards-issued-difference)
-- need query outputs name of each credit card, difference in number of issued cards between month and highest issuance cards and lowest issuance
-- arrange results based on largest disparity
/*
    need to select name
    difference = aggregate function
        month of highest issuance
            month
            where issued_amount = max(issued_amount)
        month of lowest issuance
            month
            where issued_amount = min(issued_amount)
*/
-- solution
SELECT card_name, max(issued_amount) - min(issued_amount)
  as abs_difference
from monthly_cards_issued mci
group by card_name
order by abs_difference DESC;

select col_name, aggregate(function)
    as alias
from table_name
group by col_name
order by function_alias desc/asc;

/*
    select stmnt has card_name col, aggregate function to calculate difference between month with max issuance and month with min issuance per card
    from the table
    group by the card_name
    order based on largest disparity (order by desc)
*/


-- most common aggregate fxns are: avg() [ return avg value ], count() [ return # of rows ], max() [ return largest value ], min() [ return smallest value ], sum() [ return sum of data in rows via specified column ]

/*
    constantly going to write sql joins to analyze data together (two tables)
*/

-- [question](https://datalemur.com/blog/sql-interview-guide#join-sql-interview-questions:~:text=SQL%20interview%20Question%20asked%20by%20Microsoft)

-- example: 'which azure customer buys at >= 1 azure product from each prod category'
/*
    tables
        customer_contracts: detail products by each company
        products: details what product category each azure service belongs to
    going to require inner join on product id (as right table may have products that aren't bought)
    select * from customer_contracts cc
    join products p
        on cc.product_id = p.product_id
    where
*/
-- solution

-- (1)
-- join both tables with columns of customer_id, product_category
SELECT cc.customer_id, p.product_category FROM customer_contracts cc
left join products p
  on cc.product_id = p.product_id;

--(2) count all distinct product categories a customer has purchhased product from i.e. remove duplicates
-- can only group by with cols specified in select line
SELECT cc.customer_id,
    COUNT(DISTINCT p.product_category) as unique_count
FROM customer_contracts cc
left join products p
    on cc.product_id = products.product_id
group by customers.customer_id;

-- (3) wrap prev step into CTE, select only users that have products from all categories
-- CTE is a Common Table Expression (temp result set that can be referenced in select, insert, update, delete stmnt in sql
-- ctes are defined with 'with' keyword
/*
    CTE example

    WITH RevenueCTE AS (
    SELECT
        OrderID,
        SUM(Quantity * UnitPrice) AS TotalRevenue
    FROM
        OrderDetails
    GROUP BY
        OrderID
    )

    SELECT
        Orders.OrderID,
        Customers.CustomerName,
        RevenueCTE.TotalRevenue
    FROM
        Orders
    JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID
    JOIN
        RevenueCTE ON Orders.OrderID = RevenueCTE.OrderID
*/

-- cte [ returns count of distinct product categories a customer has purchased a product from ]
with supercloud as (
    SELECT cc.customer_id,
        count(DISTINCT (p.product_category) as unique_count
    FROM customer_contracts as cc
    left join products as p
    on cc.product_id = p.product_id
    GROUP BY cc.customer_id;
)


select customer_id
from supercloud
where unique_count = (
  select count(distinct product_category)
  from products
)
order by customer_id

/*
^^
[ select only users who have products from all categories ]  -> filter for unique_count of 3 (3 prod categories) -> make it dynamic with subquery ref products table
*/

-- 4 various joins tested in sql assessments
/*
    4 main methods involved in joining db tables
    inner - combine rows with mtaching
    left - combine rows from left, null for right
    right - combine rows from right, null for left
    full join - combine regardless of matching
*/

-- common sql join interview questions
-- self join
-- anti-join
-- performance consideration of sql join
-- optimizing slow join queries
-- how to join >2 tables
-- does join alway have to be on two rows sharing same value?

-- ! COMMON DATE/TIME FXNS !
/*
    now(): return current date, time
    current_date(): return current date
    interval: add specific time interval to date
    datediff: calculate time difference between dates
    extract: extract specific part of date (month, day, year)

    date/time operators
    +: add time interval to date/time value
    -: subtract time interval from date/time value
    ||: concatenate date/time values
*/

-- [question](https://datalemur.com/questions/second-day-confirmation)
/*
    Provided table of text messages, email signup data
    Required to write query display ids of users who confirmed # via text message on day after signing up (2nd tiktok day)

    Utilizes interval, interval '1 day'
    where texts.action_data = emails.signup_date + INTERVAL '1 day'
*/


/*
- how to perform percentages -
round (100 * count(disinct p.purchased)/count(distinct p.not_purchased))
*/
