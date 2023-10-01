# [46 SQL Interview Questions and Answer In 13 minutes](https://www.youtube.com/watch?v=jsznpKasUUA)

## what is a db?
db = org set of data, stored, accessed electronic from comp sys
## what is a dbms?
dbms = db management system -> manipulate, retrieve, define, manage data in db
## rdbms
relational db management sys, data stored in form of a collection of tables in rdbms and relations def using table's common fields
## sql
structured query language - allows for query, manipulation, retrieving data stored in rdbms
## sql, mysql
sql is query language and mysql is a rdbms used to manage sql dbs
## tables, fields
table composed of rows, cols where data is organized, columns = fields, rows = records
## constraints
- rules implemented, concerning table data dictating what data can be inserted, updated, delete in tables
    - pk, fk, unique, not null, check
## primary key
constraint that uniquely ids each table row and contains unique values, implicit not null constraint
## cross-join
index used to obtain data from db quickly, quick look up table for finding records users need often
## subqeury
- nested one query inside another query
    - correlated sq: dependent, non-correlated: independent sq, output of sq is sub'ed in main query
## union, minus, intersect
* union - combine result sets of 2+ select statement
* minus - return only rows present in 1st result set that are not in second, eliminate duplicate rows
* intersect - combine rows in 2 queries, common btwn both results
# cursor
- db cursor = control structure enables traversal over rows in result set (retreive data one row at a time)
