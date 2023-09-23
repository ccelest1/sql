-- SELECT stmnts
/*
    Query is stmnt that declares what data is being saught, where to find db, transform it prior to being returned
*/

-- returns 2d set of rows columns requested
SELECT column, another_column
FROM mytable;
-- return all columns
SELECT *
FROM mytable;


-- SELECT queries w/ constraints
/*
    Select for specific cols of data from table - Filter using WHERE cluase in query checking for specific values
*/
SELECT column, another_col,
FROM mytable
WHERE condition
    AND/OR another_condition

/*

    Makes results more manageable to understand and allows query to run faster due to reduction in non-necessary data

    Complex causes constructed by several AND or OR keywords (ex: num_wheels >=4 AND doors <= 2)

    =, !=, < ...
    Numerical Operators
    col_name!=4

    BETWEEN AND ...
    Number in range of 2 values (inclusive)
    col_name BETWEEN 1.5 and 10.5

    NOT BETWEEN AND...
    Number is not within range
    col_name NOT BETWEEN 1 and 10

    IN (...)
    Number exists in list
    col_name in (2,4,6)

    NOT IN (...)
    num doesn't exist in a list
    col_name NOT IN (1,3,5)

*/

-- movie with row id=6
SELECT title, id
from Movies
where id = 6

-- movies released between 2000 and 2010
SELECT title, year
from Movies
where year
between 2000 and 2010

-- movies not releaseed in years between 2000 and 2010
SELECT title, year
from Movies
where year
not between 2000 and 2010

-- first 5 pixar movies and release year
SELECT id, title, year
from Movies
where id between 1 and 5
