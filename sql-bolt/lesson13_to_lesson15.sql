-- L13: Row Insertion (SQL schemas, adding new data)
/*
    table in db = 2d set of cols (properties), row (entity instances)
    db schema = what describes table structure, datatypes each table column contains
        in movies table, values of year must be int, values in title must be str

    fixed structure allows db to be efficient and consistent despite the storage of billions of rows
*/
-- Data Insertion
/*
    req to use INSERT in order to insert data into db
    declares which table to write into, columns being filled, one or move rows of data to insert

    In general, each data row inserted has values for each corresponding column in table
    Insert several rows by listing them sequentially
*/

insert into mytable
values (val1orexp1, val2orexp2,...),
       (val3orexp3, val3orexp3,...)

/*
    if you have incomplete data, table contains cols supporting default values
    insert rows with only columns of data by specifying them explicitly
*/
insert into mytable
       (col, other_col)
values (value1, value2),
       (value3, value4)

/*
    ^ number of values req to match # of cols specificed
    inserting values this way have benefit of being forward compatible
        if you add a new col to table w/ default value, no hardcoded insert statements will change as a result to accomodate
        * can use math and string expressions with values that are being inserted
        * ensure all inserted data is formatted consistently
*/
INSERT INTO boxoffice
(movie_id, rating, sales_in_millions)
VALUES (1, 9.9, 283742034 / 1000000);

-- exercise 13
--1 (insert toy story 4)
insert into movies
(title, director)
values ("Toy Story 4", "John Lasseter")
--2 (insert into boxoffice toy story with associated id, rating, domestic, international sales)
insert into boxoffice
(id, rating, domestic_sales, ineternational_sales)
values (15, 8.7, 340000000, 270000000)

-- L14: Row Updates
/*
    updating data can be done with UPDATE statement
    specify table, columns, rows to update
    data being updated has to match data type of cols in table schema
*/
update mytable
set column = value_or_exp
other_col = other_value_or_exp
...
where condition;
-- takes in several col/value pairs, apply changes to each and row that satisfies constraint in where clause

/*
    take consideration to correctly writing update statements
    be careful about that transaction, always write constraint and teset in slect query to make sure updating right rows -> then write column/value pairs to update
*/

-- 1. need to update director for a bug's life to john lasseter
-- need to select correct row for a bug's life by saying where title = 'A Bug's Life'
/*
    select title, director
    from movies
    where title = 'A Bug's Life'

    update movies
    set director = 'John Lasseter'
    where title = "A Bug's Life"
*/
update movies
set director = 'John Lasseter'
where title = "A Bug's Life"

-- 2. update toystory 2 year
/*
    update movies
    set year = 1999
    where title = 'Toy Story 2'
*/
update movies
set year = 1999
where title = 'Toy Story 2'

-- 3. update title, director for Toy Story 8
/*
update movies
set title = 'Toy Story 3', director = 'Lee Unkrich'
where title = 'Toy Story 8'
*/
update movies
set title = 'Toy Story 3', director = 'Lee Unkrich'
where title = 'Toy Story 8'

-- L15: Row Deletion
/*
    deleting data from table in db, use delete stmnt describing table to act on and rows via where
*/
-- 1. delete movies released prior to 2005
/*
select * from movies where year<=2005
*/
delete from movies
where year<=2005;

--2. remove movies by Andrew Stanton
delete from movies
where director='Andrew Stanton';
