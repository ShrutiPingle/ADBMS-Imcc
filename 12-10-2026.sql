-- Create database TCL;
use TCL;

CREATE TABLE orders(
order_id int primary key,
cust_name varchar(30),
or_status varchar(30)
);

desc orders;

-- we caanot disable autocommit for DDL commands(create ,etc..)
set autocommit=0;

Begin;

insert into orders values (1,"ABC","pending");
insert into orders values (2,"BBC","pending");

select * from orders;
truncate table orders;

rollback;
select * from orders;
commit;

-- for commit
insert into orders values (3,"cBC","pending");
insert into orders values (4,"dBC","pending");
select * from orders;
commit;
Update orders set cust_name="bheem" where order_id=2;
rollback;


-- for savepoint
-- step 1: insert a few values
insert into orders values (3,"cBC","pending");
insert into orders values (4,"dBC","pending");
savepoint sp1;
select * from orders;

-- step 2: update one order

Update orders set cust_name="bheem" where order_id=2;
savepoint sp2;
select * from orders;

-- step 3: check how and where the rollback works
rollback to savepoint sp1;
select * from orders;

-- step 2: update one order
Update orders set cust_name="bheem" where order_id=2;
savepoint sp2;
select * from orders;

delete from orders where order_id=2;
savepoint sp3;
select * from orders;

rollback to savepoint sp2;
-- rollback everythig till the last commit
rollback;
commit;