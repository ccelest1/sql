-- SQL LESSON 7: Outer Joins
/*
    if we have two tables with asymmetric data we can use left join, right join, full join to ensure data is not left out of results
*/

SELECT column, another_column, …
FROM mytable
INNER/LEFT/RIGHT/FULL JOIN another_table
    ON mytable.id = another_table.matching_id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;

/*
    ex:
    join table A to table B

    Left Join:
        include rows from A regardless of wether a matching row is found in B

    Right Join:
        include rows from B regardless of matching row found in A

    Full Join:
        rows from both are kept regardless of whether a matching row exists in other table
*/

/*

    Practice:
    working with tables storing data about empolyee occupancy and building capacity

    * bolt only supports left joins, so need to practice right, full joins at some point

*/

-- find list of all buildings with employees
SELECT DISTINCT Building from employees;

-- find list of all buildings, and capacity
SELECT DISTINCT Building_name, capacity from buildings;

-- list all buildings, distinct employee roles in each building (including empty)
SELECT DISTINCT building_name, role from buildings
left join employees
on buildings.building_name = employees.building;

-- SQL Lesson 8: NULLs
/*
    always sensical to reduce possibility of null vlaues in db as they req attention when constructing queries, contrains, processing results

    alt to null vlaues in db is to have data-type appropriate default values
        0 for numerical data
        empty strings for text data

    if db has to store incomplete data, null can be appropriate to avoid skewing later analysis

    Can test for null values by testing a column for null values in where cluase with is null, is not null
*/
SELECT column, another_column, …
FROM mytable
WHERE column IS/IS NOT NULL
AND/OR another_condition
AND/OR …;

-- find name, role of employees not assigned to a building
SELECT * from employees
where building is null;

-- find names of buildings with no employees
SELECT * from buildings
left join employees
    on buildings.building_name = employees.building
where role and name is null;

-- SQL Lesson 9: Queries w/ expressions
/*
    Can use expressions to write complex logic on column values via queries -> expressions can use math, string fxns with basic math to transform values where query is executed
*/

SELECT particle_speed / 2.0 AS half_particle_speed
FROM physics_data
WHERE ABS(particle_position) * 10.0 > 500;

-- use of expressions can save time, processing of result data
-- when expressions are used in select they should be given alias with AS keyword

/*
    exercises
*/

--- 1. list movies, combined sales
select title, (domestic_sales+international_sales)/1000000 as millions_of_dollars from boxoffice
join movies
    on boxoffice.movie_id = movies.id;

--- 2. movies, rating as percent
select title, rating*10 as percent_rating from boxoffice
join movies
    on boxoffice.movie_id = movies.id;

--- 3. movies with even years
select * from movies
where year%2=0;
