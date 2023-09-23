-- SQL Lesson 4: Filter, sort query results
/*
    sql provides method to discard rows that have duplicate column value using distinct keyword
*/

SElECT DISTINCT column, another_col
FROM mytable
WHERE condition(s);

-- DISTINCT blindly removes duplicate rows
-- will use GROUP BY clause to descriminate based on specific cols

/*
    Ordering Results
    - SQL provides way to sort results in ascending, descending order with order by clause
*/

SELECT col, another_col,
FROM mytable
WHERE condition(s)
ORDER BY column ASC/DESC

-- Limit results to subset
/*
    indicate to db subset of results desired to return, LIMIT reduce's number of rows to return, optional OFFSET specify where to begin counting # of rows from
*/

SELECT column, another_column, …
FROM mytable
WHERE condition(s)
ORDER BY column ASC/DESC
LIMIT num_limit OFFSET num_offset;

/*
    Examples: popular websites, front page = list of links that are sorted by popularity, time andeach next page is a set at various db offsets
    - execute queries quickly, increased efficiency with requested content
*/

-- EXERCISES
-- 1. Directors of pixar movies alpha w/o duplicates
SELECT DISTINCT director FROM movies
ORDER BY director ASC;

--2. last 4 pixar movies
SELECT DISTINCT * FROM movies
ORDER BY year desc
limit 4;

--3. five first piaxr moives by alpha
SELECT DISTINCT * FROM movies
ORDER BY title asc
limit 5;

--4. next 5 pixar movies
SELECT DISTINCT * FROM movies
ORDER BY title asc
limit 5 offset 5;


-- SQL Review: Simple Select Queries
--- 1. list all canadian cities and populations
SELECT city, country, population FROM north_american_cities
Where country = 'Canada';

--- 2. Order cities in us by lat from north to south
SELECT * FROM north_american_cities
Where country = 'United States'
Order by latitude desc;

--- 3. list cities west of chicago ordered from east to west
SELECT * FROM north_american_cities
Where longitude<-87.629798
order by longitude asc;

--- 4. list two largest cities in mexico
SELECT * FROM north_american_cities
where Country = 'Mexico'
order by population desc
limit 2;

-- 5. list third and fourth largest cities by population in the us
SELECT * FROM north_american_cities
where country='United States'
order by population desc
limit 2 offset 2;

--- SQL lesson 6; multi table queries with joins

/*
    entity data in real world is often broken apart and stored across several tables using normalization

    db normalization is useful as it reduces duplicate data in a table and allows for data in db to grow independent of each other

*/

/*
    tables sharing common information about single entitiy req pk that id's entity that is unique across db
        such as an auto-increment integer as it space efficient

    Using jOIN clause allows for combining of row data across seperate tables

    1st JOIN type is INNER JOIN
*/

--- inner join example
SELECT column, other_col
FROM mtybale
INNER JOIN other_table
    ON mytable.id = other_table.id
WHERE condition(s)
ORDER BY column, ... asc/desc
LIMIT num_limit offset num_offset;

/*
    Practice - boxOffice Table stores info about ratings, sales of pixar movie and movide_id in BO table corresponds to id col in movies table 1-to-1
*/

-- find domestic, international sales for each movie
SELECT * FROM movies
INNER JOIN Boxoffice
 on movies.id=Boxoffice.movie_id;

-- sales # for each movie that did better internationally vs domestically
SELECT * FROM movies
INNER JOIN Boxoffice
 on movies.id=Boxoffice.movie_id
where Boxoffice.international_sales>Boxoffice.domestic_sales;

-- list all movies by ratings in descending order
SELECT * FROM movies
INNER JOIN Boxoffice
 on movies.id=Boxoffice.movie_id
ORDER By Boxoffice.rating desc;
