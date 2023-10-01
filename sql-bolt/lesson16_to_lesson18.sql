-- Lesson 16: Creating Tables
/*
    if new entities, relationships to store in db, create new db using create table
*/
CREATE TABLE IF NOT EXISTS mytable (
    column DataType TableConstraint DEFAULT default_value,
    another_column DataType TableConstraint DEFAULT default_value,
    …
/*
    structure of new table def by table schema, def series of cols -> each col has name, data type for col, optional table constraint on values inserted and optional default value

    if there is a table with same name, sql implementation usually throws error ->  suppress error, skip creating redundant use IF NOT EXISTS clause

    * common data types *
    integer, boolean
    - int dbs store whole int values like count of number, age
    - boolean val represented by int of 0 or 1

    float, double, real
    - float types store precise numerical data like measurements, fractional values

    character(num_chars), varchar(num_chars),
    text
    text can store strings, text in several locales (diff btwn types is just db efficiency)
    char and varchar types specfiied with max # of chars that can be stored

    date, datetime
    date, timestamps track time series, event data

    blob
    binary data, have to store with correct metadata to requery

    * constraints *
    primary key
    values in col are unique - id single row in table

    autoincrement
    int values, auto filled and increment with each row insertion

    unique
    values in col req to be unique -> can't insert other row with same value in col as row in other table
    Does not have to be a key for table row

    not null

    check (exp)
    run complex exp to test if inserted values are valid  -> check values are +, greather than size, start with prefix

    foreign key
    ensure each value in column corresponds to other value in column of other table
        - make sure every row in payroll corresponds to valid employee in employee table
*/
CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT,
    director TEXT,
    year INTEGER,
    length_minutes INTEGER
);
-- create table with cols: name(str), version(number-float), download_count(int)
create table if not exists database(
    name str,
    version float,
    download_count int
)
-- Lesson 17: Altering Tables
/*
    alter table allows for add, remove, modify cols + constraints

    - add cols
    similar to create table
    specify data type of col, constraints, default values applied to existing and new rows
    can specify where using FIRST, AFTER clauses
*/
ALTER TABLE mytable
ADD column DataType OptionalTableConstraint
    DEFAULT default_value;
/*
    - remove cols
    Some dbs
*/
ALTER TABLE mytable
DROP col_to_delete;

-- rename cols
ALTER TABLE mytable
RENAME TO new_table_name;

-- exercise 17
-- add col 'aspect_ratio' with float type
alter table movies
add column aspect_ratio float default 2.39;
-- add col named landuage w/ text data type, constraint of English language
alter table movies
add column language text default 'english';

-- Lesson 18: Dropping Tables
/*
    remove entire table w/ data, metadata using drop table statement
    removes table schema from db

    use if exists clause
    if another table with depdendency have to update all depend tables to remove depend rows, remove all tables
*/
DROP TABLE IF EXISTS mytable;

-- exercise 18
-- drop movies, boxoffice table
drop table if exists movies;
drop table if exists Boxoffice;
