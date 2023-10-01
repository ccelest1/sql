# INNER JOIN (JOIN) VS OUTER JOIN (LEFT/RIGHT/FULL JOIN)

## Inner Join
### Use Case
- Desire to retrieve only rows with matching values on both sides
### Result
- Return rows where there is a match between specified columns in both tables
### Example
- if you have 2 tables, 1 with customer info and 1 with order info (tables: customers, orders) and want to inner join to only retrieve rows where a customer has placed an order

```sql
select customer_id, customer_name
from customers
inner join orders
    on customers.customer_id = orders.customer_id
```
## Left Outer Join
### Use Case
- want to retrieve rows from left (first) table and matching rows from right (second) table -> if no match, null values returned for columns from right table
### Result
- return rows from left table, matching rows from right table -> if no match in right table, null values are included
### Example
- if there a list of employees, list of departments (tables: employees, departments) -> use left join to get list of employees (that may or may not have an associated department) and corresponding department (if available)
```sql
-- or on employees.name on departments.employee_name
select * from employees
left join departments
    on employees.id = departments.employee_id
-- potentially
where departments.employee_id is not null
```

## Right Outer Join
### Use Case
- reversed left join, retrieve all rows from right(second) table and matching rows from left (first) table
### Result
- return all rows from right table, matching rows from left table -> if no match in left table, null values are included
### Example
- right join would provide list of departments (that may or may not have associated employees) and employees assigned to them, null values for departments with no employees

```sql
select * from employees
right join employees
    on employees.name == department.employee_name
where employees.department is not null
```
## Full Join
### Use Case
- retrieve all rows from both tables, matching rows where they exist and null values where there's no match
### Result
- returns all rows from both tables -> when there is a match, obtain matched data -> where there is no match, obtain null values
### Example
- if there is a list of products, list of reviews -> full join returns all products, corresponding reviews + reviews with no associated products, products with no reviews
```sql
-- on products.name == reviews.product_name
select * from products
full join reviews
    on products.product_id == reviews.product_id
```
## Self Join
- want to combine rows from single table based on related column in table -> performed when table contains hierarchical or structured data and req to establish relationships between rows in same table
### Example
- employees table with manager ids that relate to employee id

| EmployeeID | EmployeeName | ManagerID |
| - | - | - |
| 1 | John | 2 |
| 2 | Alice | NULL |
| 3 | Bob | 2 |
| 4 | Carol | 1 |

```sql
select e.EmployeeName, m.EmployeeName as ManagerName
from Employees e
inner join Employees m on e.ManagerID = m.EmployeeID
```
- results in table that shows an employee name and their corresponding manager name if they have a manager

| EmployeeName | ManagerName |
| - | - |
| John | Alice |
| Bob | Alice |
| Carol | John |

## Conclusion
- really have to look at tables and data requirements in order to choose appropriate join'
    * inner joins are common for only matching data, outer joins for including non-matching data from 1 or both tables in result set
