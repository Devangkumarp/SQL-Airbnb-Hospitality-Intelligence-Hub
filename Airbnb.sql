create database air;

use air;

show databases;

show tables;

select * from booking b;

select * from listing;

create table listing
(
id int(8),
name varchar(1000),
host_id int(8),
host_name varchar(100),
neighbourhood_group varchar(100),
neighbourhood varchar(100),
room_type varchar(50)
);


#Q1 Import Data from both the .CSV files to create tables, Listings and Booking Details show tables.

select * from Booking b;

select * from listing l;

#Q2 Write a query to show names from Listings table select name from Listings;

select name from listing l;

#Q3 Write a query to fetch total listings from the listings table.

select count(id) from listing;

select count(*) from listing l;

#Q4 Write a query to fetch total listing_id from the booking_details table.

select count(listing_id) as Total_ID from Booking b;

#Q5 Write a query to fetch host ids from listings table.

select host_id from listing l;

#Q6 Write a query to fetch all unique host name from listings table.

select distinct host_name as unique_hostname from listing l;

#Q7 Write a query to show all unique neighbourhood_group from listings table.

select distinct neighbourhood_group from listing l;

#Q8 Write a query to show all unique neighbourhood from listings table.

select distinct neighbourhood from listing l;

#Q9 Write a query to fetch unique room_type from listings tables.

select distinct room_type from listing l;

#Q10 Write a query to show all values of Brooklyn & Manhattan from listings tables.

select * from listing l where neighbourhood_group in("Brooklyn","Manhattan");

#Q11 Write a query to show maximum price from booking_details table.

select max(price) from Booking b;

#Q12 Write a query to show minimum price fron booking_details table.

select min(price) from Booking b;

#Q13 Write a query to show average price from booking_details table.

select round(avg(price),2) as Avg_price from Booking b;

#Q14 Write a query to show minimum value of minimum_nights from booking_details table.

select min(minimum_nights) from Booking b;

#Q15 Write a query to show maximum value of minimum_nights from booking_details table.

select max(minimum_nights) from Booking b;

#Q16 Write a query to show average availability_365.

select round(avg(availability_365),2) as avg_availablity from Booking b;

#Q17 Write a query to show id , availability_365 and all availability_365 values greater than 300.

select listing_id,availability_365 from Booking b where availability_365>300;

#Q18 Write a query to show count of id where price is in between 300 to 400.

select count(*) as Total from Booking b where price between 300 and 400;

#Q19 Write a query to show count of id  where minimum_nights spend is less than 5.

select count(listing_id) from Booking b where minimum_nights<5;

#Q20 Write a query to show count where minimum_nights spend is greater than 100.

select count(minimum_nights) from Booking b where minimum_nights>100;

select count(listing_id) from Booking b where minimum_nights>100; 

#Q21 Write a query to show all data of listings & booking_details.

select * from listing as l 
inner join
booking as b
on l.id=b.listing_id;

#Q22 Write a query to show host name and price.

select l.host_name,b.price from listing as l
inner join
booking as b
on l.id=b.listing_id;

#Q23 Write a query to show room_type and price.

select l.room_type ,b.price from listing as l
inner join
booking as b
on l.id=b.listing_id;

#Q24 Write a query to show neighbourhood_group & minimum_nights spend.

select l.neighbourhood_group ,b.minimum_nights from listing as l
inner join
booking as b
on l.id=b.listing_id;

#Q25 Write a query to show neighbourhood & availability_365.

select l.neighbourhood,b.availability_365 from listing l
inner join
booking b
on l.id=b.listing_id;

#Q26 Write a query to show total price by neighbourhood_group.

select l.neighbourhood_group,sum(b.price) from 
listing as l
inner join
booking as b 
on
l.id=b.listing_id
group by l.neighbourhood_group;

#Q27 Write a query to show maximum price by neighbourhood_group.
select l.neighbourhood_group,sum(b.price) as total_price from 
listing as l
inner join
booking as b 
on
l.id=b.listing_id
group by l.neighbourhood_group
order by total_price desc limit 1;

#Q28 Write a query to show maximum night spend by neighbourhood_group.

select l.neighbourhood_group,max(b.minimum_nights) as max_nights from listing l 
inner join booking b 
on l.id=b.listing_id 
group by l.neighbourhood_group
order by max_nights desc;

#Q29 Write a query to show maximum reviews_per_month spend by neighbourhood.

select l.neighbourhood_group,max(b.number_of_reviews) as max_reviews from listing l 
inner join booking b 
on l.id=b.listing_id 
group by l.neighbourhood_group
order by max_reviews desc;

#Q30 Write a query to show maximum price by room type.

select l.room_type,max(b.price) from listing l
inner join
booking b
on l.id=b.listing_id
group by l.room_type;

#Q31 Write a query to show average number_of_reviews by room_type.

select l.room_type,avg(b.number_of_reviews) as Average_reviews from listing l
inner join
booking b 
on l.id=b.listing_id
group by l.room_type
order by Average_reviews;

#Q32 Write a query to show average price by room type.

select l.room_type,avg(b.price) as Avg_Price from listing l
inner join
booking b 
on l.id=b.listing_id
group by l.room_type;

#Q33 Write a query to show average night spend by room type.

select l.room_type,avg(b.minimum_nights) from listing l
inner join 
booking b
on l.id=b.listing_id
group by l.room_type;

#Q34 Write a query to show average price by room type but average price is less than 100.

select l.room_type,avg(b.price) as avg_price from listing l
inner join
booking b
on l.id=b.listing_id
group by l.room_type having avg_price<100;

#Q35 Write a query to show average night by neighbourhood and average_nights is greater than 5.

select l.neighbourhood,avg(b.minimum_nights) as avg_night from listing l
inner join 
booking b 
on l.id=b.listing_id 
group by l.neighbourhood
having avg_night>5;

#Q36 Write a query to show all data from listings where price is greater than 200 using sub-query..

select * from listing l where id in (select id from booking b where Price  > 200);

#Q37 Write a query to show all values from booking_details table where host id is 314941 using sub-query.

select * from booking b where listing_id in(select listing_id from listing l where host_id=314941);

#Q38 Find all pairs of id having the same host id, each pair coming once only.

select distinct l1.id , l1.host_id from listing l1, listing l2
where  l1.host_id = l2.host_id and l1.id  <> l2.id  order by host_id;

select l1.id as id1,l2.id as id2,l1.host_id from listing as l1
join
listing as l2 on l1.host_id=l2.host_id and l1.id < l2.id;

#Q39 Write an sql query to show fetch all records that have the term cozy in name.

select * from listing l where name like '%cozy%';

#Q40 Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group.

select b.price,l.host_id,l.neighbourhood_group from listing l
inner join 
booking b 
on l.id=b.listing_id having l.neighbourhood_group="Manhattan";

#Q41 Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, 
#also make sure price is greater than 100.

select l.id,l.host_name,b.price,l.neighbourhood from listing l
inner join 
booking b 
on l.id=b.listing_id
where l.neighbourhood in ("Upper West Side","Williamsburg neighbourhood")
having b.price > 100;

#Q42 Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant.

select l.id,l.host_name,l.neighbourhood,b.price from listing l 
inner join
booking b
on l.id=b.listing_id
where l.host_name="Elise" and l.neighbourhood="Bedford-Stuyvesant";

#Q43 Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights.

select l.host_name,b.availability_365,b.minimum_nights from listing l 
inner join
booking b 
on l.id=b.listing_id 
where b.availability_365 > 100 and b.minimum_nights >100;

#Q44 Write a query to show to fetch id , host_name , number_of_reviews, 
#and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+

select l.id,l.host_name,b.number_of_reviews,b.reviews_per_month from listing l
inner join
booking b 
on l.id=b.listing_id
where b.number_of_reviews > 500 and b.reviews_per_month > 5;

#Q45 Write a query to show neighbourhood_group which have  most  total number of review. 

select l.neighbourhood_group,sum(b.number_of_reviews) as Total_Review from listing l 
inner join
booking b
on l.id=b.listing_id
group by l.neighbourhood_group
order by Total_Review desc limit 1;

#Q46 Write a query to show host name which have most cheaper total price.

select l.host_name, sum(b.price) as Total_price from listing l 
inner join
booking b
on l.id=b.listing_id
group by l.host_name
order by Total_price asc limit 1;

#Q47 Write a query to show host name which have most costly total price.

select l.host_name,sum(b.price) as Total_price from listing l
inner join
booking b
on l.id=b.listing_id
group by l.host_name 
order by Total_price desc limit 1;

#Q48 Write a query to show host name which have max price using sub-query.

select l.host_name,b.price from listing l
inner join booking b	
on l.id=b.listing_id
where b.price in (select max(price) from booking);

#Q49 Write a query to show neighbourhood_group where price is less than 100.

select l.neighbourhood_group,b.price from listing l 
inner join
booking b 
on l.id=b.listing_id
where l.id in (select listing_id from booking	where price < 100);

#Q50 Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.

select l.room_type,max(b.price) as Max_price, avg(b.availability_365) as Avg_avaiblity from listing l 
inner join
booking b 
on l.id=b.listing_id
group by l.room_type 
order by Max_price asc;