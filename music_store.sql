/*	Question Set 1 - Easy */

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

/* Question Set 2 - Moderate */

/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

SELECT DISTINCT email AS Email,first_name AS FirstName, last_name AS LastName, genre.name AS Name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email;

/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands.*/

select ar.artist_id, ar.name, count(ar.artist_id) as number_of_songs
from artist ar
join album al on al.artist_id = ar.artist_id
join track tr on tr.album_id = al.album_id
join genre gn on gn.genre_id = tr.genre_id
where gn.name like 'rock' 
group by ar.artist_id, ar.name
order by number_of_songs desc;



























