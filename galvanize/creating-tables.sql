-- reviewing creating tables using sql
/*
    create table
    update table
    add rows
    delete rows
    drop table
*/

-- creating tables

-- constraint follows the type
CREATE table if not exists automobile(
    id int PRIMARY KEY,
    year smallint --int,
    model varchar(100),
    vin varchar(19),
    color varchar(20)
)

--postgresql
-- serial, smallint = int
-- model = unique as it is a business key
create table if not exists auto(
    id serial not null primary KEY,
    years smallint not null,
    model varchar(19) unique not null,
    color varchar(20) not NULL
);

-- vehicle model
create table if not exists vms(
    id serial not null primary key,
    name varchar(50) not null ,
    manufacturer varchar(50) not null,
    picture_url varchar(256),
)

--insert into table

-- existing is a table 'films'
insert into films (code, title, did, date_prod, kind)
values (..., ..., ..., ..., ...,)

-- data retrieval using select statement
select id, name
from vms
where vehicle_model is not null / is NULL

-- search for partial strings
select id, name
from vms
where vehicle_model like '%ford%'

-- using equality
select id, name, vim
from vms
where vim = 1

-- more than 1 criterion
select id, name, vim, picture
from vms
where vim = 1 and/or picture like '%Blue%'

-- update table
update vms
set col1 = value1, col2 = value2
where id = x
where price <=10

-- delete row
delete from vms
where price>=5
where product like '%fun%'
where product = 'fun toy'

--- creating foreign keys, references
create table am(
    id serial not null primary key,
    name varchar(100) not null,
    man_id int not null references manufacturers(id)
)
-- using ailases, joins
select m.name as manufacturer,
    am.name as model_name
from manufacturer m
inner join autombile am
    on (m.id = am.manufacturer_id);
-- using cte
with supercloud as(
    select m.name as manufacturer,
            a.vin
    from autombile a
    inner join automobile_model am
        on (am.id=a.model_id)
)
select s.manufacturer
from supercloud s
inner join manufacturer m on m.name = s.manufacturer_name;


-- sql assessment
--
with supercloud as (
    select b.id as book_id,
       b.title as book_title,
       c.book_id,
       c.checked_out_on as checkout_date,
       c.member_id,
       c.returned_on as return_date
from books b
inner join checkout c
    on (b.id = c.book_id)
)

select m.id as member_id,
       m.name as member_name,
       s.book_title,
       s.checkout_date,
       s.member_id,
       s.return_date
from members m
inner join supercloud s
    on (s.member_id = m.id)
where s.return_date is null;

-- abbreviated
SELECT b.title, m.name, co.checked_out_on
FROM book b
JOIN checkout co ON (b.id = co.book_id)
JOIN member m ON (co.member_id = m.id)
WHERE co.returned_on IS NULL;
-- report all books in lib (book title, copies number, checked_out_on, return_on, borrower_name)
select b.title, b.copies, c.checked_out_on, c.returned_on as return_date, m.member_name
from books b
left join checkout as c
    on (b.id=c.book_id)
left join member as m
    on (c.member_id=m.id)
