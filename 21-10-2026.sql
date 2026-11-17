use emp_db;
select * from cust;

select count(*)from cust;

select count(custid)from cust where price>=25000;
select count(custid)from cust where cust_city="pune";

select min(price) from cust;
select max(price) from cust;
select sum(price) from cust;

select avg(price)as price_avg from cust ;

-- the group by clause is used with aggregate functions
select cust_city,count(custid)from cust group by cust_city;

-- having clause(where for group by)-> each group produced by the group by clause is evaluated by having clause
select cust_city, sum(price)as price_city from cust group by cust_city
having price_city>15000 and price_city<=80000;

select product, sum(price)as price_city from cust group by product
having price_city>15000;

-- having clause and sort the data
select product, count(custid) from cust group by product
having count(custid)>=2 order by count(custid) DESC;