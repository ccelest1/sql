# INTRO
## sql
- structured query language allowing for query, manipulation, and data transformation from relational db and due to simplicity - sql dbs provide safe, scalable storage for several sites, mobile apps
    - popular dbs = sqlite, mysql, pg, oracle, ms sql server
    - rdbm = collection of related 2d tables with fixed # of columns (attributes/properties), data rows
    - sql allows one ot understand and answer specific questions 'what type of cars on road currently have < 4 wheels', 'how many models of cars prod by Tesla'

    | id | model | # wheels | # doors | type |
    | ----- | ----- | ----- | ----- | ----- |
    | 1 | ford | 4 | 2 | sedan |
    | 2 | tesla | 4 | 2 | sports |

## Review - 9/29/23
Some Friends Just Only Will Get Hung Over Literally Often
    - Select From Join On Where Group By Having Order By Limit Offset
### Each Command
- Select: select specific cols from table
- From: specify table that has cols that is being selected
- Where: specify rows to pick
- group by: group rows that have similar values together
- having: specify groups to include, formed by group by clause
- order by: order rows in result set (asc/dsc)
- limit: limit number of rows returned

### 1 to 3
- sql select
```sql
-- select structure
select col, col2
from mytable
where condition
    and/or other condition

-- operators for condition can include =, !=, etc. in terms of operands, (ranges) BETWEEN AND, NOT BETWEEN AND, (exact numbers) IN (..), NOT IN(...)
-- operators can be used for strings =, !=
-- perform string comparison using (strs) NOT LIKE, LIKE, (match sequence) LIKE '%str%'
-- col_name IN, NOT IN (number of strings)
```
### 4 to 6
- distinct, order by, limit, offset
```sql
SELECT column, another_column, …
FROM mytable
WHERE condition(s)
ORDER BY column ASC/DESC
LIMIT num_limit OFFSET num_offset;
```
- joins
```sql
SELECT column, other_col
FROM mytable
INNER JOIN other_table
    ON mytable.id = other_table.id
WHERE condition(s)
ORDER BY column, ... asc/desc
LIMIT num_limit offset num_offset;
```
### 7 to 9
- outer joins
```sql
SELECT column, another_column, …
FROM mytable
INNER/LEFT/RIGHT/FULL JOIN another_table
    ON mytable.id = another_table.matching_id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;
```
- using null
```sql
SELECT column, another_column, …
FROM mytable
WHERE column IS/IS NOT NULL
AND/OR another_condition
AND/OR …;
```
### 10 to 12
- using group by and aggregate functions
```sql
SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression
GROUP BY column;
```
- full query with having
```sql
SELECT DISTINCT column, AGG_FUNC(column_or_expression), …
FROM mytable
    JOIN another_table
      ON mytable.column = another_table.column
    WHERE constraint_expression
    GROUP BY column
    HAVING constraint_expression
    ORDER BY column ASC/DESC
    LIMIT count OFFSET COUNT;
```
### 13 to 15
- insert stmnt
```sql
insert into mytable
       (col, other_col)
values (value1, value2),
       (value3, value4)
```
- row updates
```sql
update mytable
set column = value_or_exp
where other_col = other_value_or_exp;
```
- row deletions
```sql
delete from table
where col = value_or_exp
```
### 16 to 18
- create table
```sql
CREATE TABLE IF NOT EXISTS mytable (
    column DataType TableConstraint DEFAULT default_value,
    another_column DataType TableConstraint DEFAULT default_value,
    …
)
create table if not exists datatable(
    id int primary key not null default ...,
    type varchar(10) not null,
    color text not null,
    vim float unique not null
)
```
- data types: int/boolean, float/serial, char(num)/varchar(num)/text, date/datetime, blob
- constraints: primary key, autoincrement, unique, not null, check, foreign key

- alter table
* add cols
```sql
alter table mytable
add col type constraint default defaultvalue
```
* rename table
```sql
alter table myable
rename to newTable;
```
* rename column
```sql
alter table mytable
rename column prev to nexw
```
* drop table
```sql
drop table if exists mytable;
```
