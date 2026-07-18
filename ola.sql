create database Ola_dataset;
use ola_dataset;

create table ola (
Booking_id int auto_increment primary key,
Customer_id varchar(50),
Booking_date date,
Booking_time time,
Booking_status varchar(100),
Vehicle_type varchar(50),
Pickup_location	varchar(50),
Drop_location	varchar(50),
Vehicle_arrival_Time int,
Customer_Wait_Time int,
Customer_cancellation varchar(50),
Driver_cancellation	varchar(50),
Incomplete_Ride	varchar(50),
Incomplete_Ride_Reason	varchar(50),
Booking_value int,
Payment_method varchar(50),	
Ride_Distance int,
Driver_rating int,
Customer_rating int
);

select * from ola;

-- 1. Retrieve all successful bookings.
select count(*) as Total_succesful_ride from ola 
where booking_status = "success"; 

-- 2. Find the average ride distance for each vahicle type.
select  vehicle_type as Vehicle ,avg(ride_distance) as Avg_Ride_Distance from ola 
group by vehicle_type
order by Avg_Ride_Distance desc;

-- 3. Get the total number of cancelled rides by customers.
select count(*) as Cancelled_Rides from ola
where booking_status <> "success";

-- 4. List the top 5 customes who booked the highest number of rides.
select Customer_id ,
count(booking_id) as Total_Booking 
from ola
group by customer_id
order by Total_Booking desc limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal & car-releted issues.
Select count(*) as Driver_Cancellations from ola
where Driver_cancellation = 'Personal & Car related issue' ;

-- 6. Find the maximum and minimum driver rating fro Prime Sedan booking.
select vehicle_type as Vahicle,
	   max(Driver_rating) as Max_Driver_rating,
	   min(Driver_rating) as Min_Driver_rating 
from ola
where vehicle_type = "prime sedan";

-- 7. Retrieve all rides where payment was made using UPI.
select count(*) as Total_ride from ola
where payment_method = "UPI";

-- 8. Find the average customer rating per vehicle type.
select vehicle_type as vehicle, 
	avg(customer_rating) as Avg_Cx_Rating
from ola 
where booking_status = "success"
group by vehicle_type
order by Avg_Cx_Rating desc;

-- 9. Calculate the total booking value of rides completed succesfully.
select sum(booking_value) as Total_Booking_Value
from ola
where Booking_status = "success";

-- 10. List all incompleted rides along with the reason.
select Customer_id, Incomplete_Ride_Reason
from ola
where Incomplete_Ride = "Yes";