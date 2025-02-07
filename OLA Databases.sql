create database ola;
use ola;

create view Successful_Bookings as
select * from bookings
where Booking_Status = 'Success';

select * from Successful_Bookings;

create View ride_distance_for_each_vehicle As
Select Vehicle_Type, Avg(Ride_Distance)
as avg_distance from bookings
Group by Vehicle_Type;

Select*from ride_distance_for_each_vehicle;

create view canceled as
select count(*) from bookings
where Booking_Status ='Canceled by Customer';

select * from canceled;

create view top5 as
select customer_id, count(Booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc limit 5;

select * from top5;

create view rides_canceled as
select count(*) from bookings
where canceled_rides_by_driver = 'Personal & car related issue';
select * from rides_canceled;

create view max_min as
select max(driver_ratings) as max_rating,
min(driver_ratings) as min_rating
from bookings where vehicle_type = 'prime sedan';

select * from max_min;

create view upi as
select * from bookings
where payment_method = 'UPI';

select * from upi;

create view vehicle_type as
select vehicle_type, avg(customer_rating) as avg_customer_rating
from bookings
group by vehicle_Type;

select * from vehicle_type;

create view bs as
select sum(booking_value) as total_successful_value
from bookings
where booking_status = 'Success';

select * from bs;

select booking_id, Incomplete_rides_reason From bookings Where Incomplete_rides = 'yes';