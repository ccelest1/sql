-- L10: Queries with aggregates (pt 1)
/*
    sql supports use of aggregate expressions allowing for summary of info about groups of data rows

    can use aggreagte fxn like 'how many movies has Pixar produced', 'what is the highest grossing pixar film each year?'
*/

-- example
SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression;

-- without specific grouping, aggregate functions runs on set of rows and returns single value
-- easier to read and process with an alias

/*
    Common aggreate fxns used:
    COUNT(* (all) or col) - count # of rows in group else count number of rows with non-NULL values in col
    MIN(col) - find smallest numerical value in col for all group rows
    MAX(col) - largest numerical
    AVG(col) - average
    SUM(col) - sum
*/

-- Grouped aggregate fxns
/*
    apply aggregate fxns to indv groups of data in group (group avg of tenure based on role)

    Group rows that have same value in column specified
*/
SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression
GROUP BY column;

/*
exercise 1
find longest time employee has been at stuido
*/
SELECT MAX(years_employed) as max_tenure
from employees;

/*
exercise 2
for each role, find avg # of years employeed by employees in role
*/
select role, avg(years_employed) as avg_tenure
from employees
group by role;

/*
exercise 3
find total # of employee years worked in each building
*/
SELECT building, sum(years_employed)
    as total_tenure
from employees
group by building;

-- L11: QWA (pt 2)

/*
    if group by clause is executed following the where clause, how do you filter grouped rows
    SQL allows for filtering GRs with  HAVING clause used spec for GROUP BY cluase
*/

SELECT group_by_column, AGG_FUNC(column_expression) AS aggregate_result_alias, …
FROM mytable
WHERE condition
GROUP BY column
HAVING group_condition;

/*
    HAVING constraint written same as WHERE clause allowing one to make quick sense of data
*/

-- Exercise 11
--- find number of artists in studio w/o having clause
SELECT role, count(role) as artist_count
from employees
where role = 'artist'

-- find number of employees of each role in studio
SELECT role, count(role) as artist_count
from employees
group by role;

-- find number of years employed by al engineers
SELECT role, sum(years_employed)
    as total_engineer_tenure
from employees
where role = 'Engineer'
group by role;

-- L12: Query execution order
SELECT DISTINCT column, AGG_FUNC(column_or_expression), …
FROM mytable
    JOIN another_table
      ON mytable.column = another_table.column
    WHERE constraint_expression
    GROUP BY column
    HAVING constraint_expression
    ORDER BY column ASC/DESC
    LIMIT count OFFSET COUNT;

/*
    each query involves finding data req in db -> filter data to entity that can be processed, understood quickly
*/

/*
    ORDER OF EXECUTION

    1. FROM and JOIN
    FROM and JOIN clause are first executed to determine dataset being queried and includes subqueries -> cause temporary tables to be created with columns, rows of tables being joined

    2. WHERE
    Once we have total working dataset, first-pass where constraints are applied to indv rows, discard rows that don't fit constrain
    Each of the constraints can only access columns direct from table requested in from clause
    - Aliases in SELECT part of query are not accesible in most dbs as they include expressions dependent on query parts not yet executed

    3. GROUP BY
    Remaining rows following the applied where constraints are grouped based on common values in col specified in group by clause
    Due to grouping, only be as many rows as there are unique values in column
    Will only be as many rows as there are unique values in col -> only use when you have aggregate fxns in query

    4. HAVING
    Discard rows taht don't satisfy contrain after applying group by clause
    Includes aliases

    5. SELECT
    finally compute select expressions

    6. DISTINCT
    rows with duplcate values in column marked as DISTINCT will be thrown

    7. ORDER BY
    Rows will be sorted by data in ascending, descending order
    can reference aliases in this clause

    8. LIMIT/OFFSET
    rows outside range specified by limit and offset are discarded leaving final set of rows to be returned

    Conclusion
*/

-- exercise 12 (tasks)
-- find number of movies each director has directed: so require director, count(title) as number_of_movies_directed -> group by director -> result table should be total_number_of_movies, director columns
select director, count(title)
 as number_of_movies_directed
from movies
group by director;

-- find total domestic, international sales attributed to each director
-- we want to find the sum of both domestic and international sales corresponding to each director for all the movies they have directed
-- we know we will have to perform (only on sqlbolt) left join between movies and boxoffice (from movies m) m.id (left join boxoffice bo) == b.movie_id
-- then we need to use an aggregate function, sum() on the columns domestic, international sales, sum(domestic_sales) and sum(international_sales)
/*
    select m.director, sum(bo.domestic_sales) as total_domestic, sum(bo.international_sales) as total_international
    from movies m
    left join boxoffice bo
        on m.id == bo.movie_id
    group by director
*/
select m.director, sum(bo.International_sales+bo.Domestic_sales) as total_sales
from movies m
left join boxoffice bo
    on m.id == bo.movie_id
group by director;
