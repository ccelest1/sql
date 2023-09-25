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
find total # of employee years worked in each building
*/
SELECT building, sum(years_employed)
    as total_tenure
from employees
group by building;

-- L11: QWA (pt 2)

-- L12: Query execution order
