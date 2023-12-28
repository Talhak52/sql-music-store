-- senior most employee based on job title
select * from employee
order by levels desc
limit 1;
-- countrie have the most invoices
select count(*), billing_country
from invoice
group by billing_country
order by count(*) desc
limit 1;
-- top 3 unique values of total invoice
select distinct total
from invoice 
order by total desc
limit 3;


















