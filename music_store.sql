-- Q1: senior most employee based on job title
select * from employee
order by levels desc
limit 1;
-- Q2: countrie have the most invoices
select count(*), billing_country
from invoice
group by billing_country
order by count(*) desc
limit 1;
-- Q3: top 3 unique values of total invoice
select distinct total
from invoice 
order by total desc
limit 3;
/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */
select sum(total), billing_city
from invoice
group by billing_city
order by sum(total) desc
limit 1;
/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money*/

select cx.customer_id, cx.first_name, sum(iv.total) as total
from customer cx
join invoice iv
on iv.customer_id=cx.customer_id
group by cx.customer_id, cx.first_name
order by total desc
limit 1;



















