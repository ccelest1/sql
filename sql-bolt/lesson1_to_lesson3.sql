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

--- LESSON 2
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

-- select pixar movies with id not = to
SELECT id, title FROM movies
where id not in (1,2,3);

-- select pixar movies with id = to
SELECT id, title FROM movies
where id in (1,2,3);

--- LESSON 3
/*
    When writing WHERE clauses with cols that have text data, sql supports operators to perform case insensitivity string comparison, wildcard pattern matching

    =
    exact string comparison
    col_name='abc'

    !=, <>
    case sensitive string inequality
    col_name != 'abcd'

    LIKE
    case ins string comparison
    col_name LIKE 'ABC'

    NOT LIKE
    string inequality case ins
    col_name NOT LIKE 'ABCD'

    %
    match seq of 0 or + chars
    col_name LIKE '%AT%'
    (match 'AT', 'ATTIC')

    _
    match a single character
    col_name LIKE 'AN_'
    (match 'AND', not 'AN')

    IN(..)
    string exists in list
    col_name IN ('A', 'B')

    NOT IN(...)
    string not in list
    col_name NOT IN ('D','E')
*/

/*
    full text search is better done with libs
    like apache lucene, sphinx as they are efficient and support wider vairety of search fts like internationalization, adv queries
*/

/*

    SELECT column, another_column, …
    FROM mytable
    WHERE condition
    AND/OR another_condition
    AND/OR …;

    example of using and/or

    SELECT id, title, year FROM movies
    where id not in (1,2,3)
    and year=2003 or year=1999

*/

-- toy story movies
SELECT id, title, year FROM movies
where title like '%Toy Story%';

-- john lasseter movies
SELECT * FROM movies
where director = 'John Lasseter';

-- not john
SELECT * FROM movies
where director != 'John Lasseter';

-- wall- movies
SELECT * FROM movies
where title LIKE "%WALL%";
