use emp_db;

create table cust (
custid int primary key,
cust_name varchar(20),
cust_city varchar(20),
product varchar(20),
price int
);

insert into cust values(1,'lala','pune','mobile',15000);
insert into cust values(2,'bala','dune','laptop',80000);
insert into cust values(3,'gala','fune','computer',25000);
insert into cust values(4,'nala','pune','laptop',115000,'padani');


select * from cust;
create table cloneTable as select * from cust;
select* from cloneTable;
drop table cloneTable;

select cust_name,cust_city from cust;
select cust_name,cust_city from cust where custid=1;

select cust_name,product,price from cust where price>25000;
select * from cust where price<=25000;
select cust_name,product,price from cust where price<25000;

select * from cust where custid=1;

select * from cust where cust_city like "p%";

-- sorting--
select* from cust order by price;
select* from cust order by price desc;

select* from cust order by custid;
select* from cust order by custid desc;

select* from cust order by cust_city asc;

-- sorting data order by multiple columm
/* which ever column name comes firt its gives sorting priotity to it */
select* from cust order by cust_city,price;
select* from cust order by price,cust_city;

select* from cust order by cust_city desc, price asc;

-- single row functions
-- case conversion functions

select lower(cust_name),upper(product) from cust 
where custid<3; /*upper and lower case functons*/

alter table cust add column lastname varchar(20);
select*from cust;

set sql_safe_updates=0;
update cust set lastname="adani";

-- concat 2 columns
select concat (cust_name,lastname) from cust;
select concat (cust_name," ",lastname) from cust;

select concat (cust_name," ",lastname) as fullname from cust; -- column name

-- use of substring and instring functions
select *from cust;
select substr(cust_name,1,3) as short from cust;

select concat (substr(cust_name,1,2) ," ",substr(lastname,2,1))from cust;

select instr(cust_name,'l') as position   from cust;
