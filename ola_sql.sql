#1. Retrieve all successful bookings:
Select * from successful_bookings;
#2. Find the average ride distance for each vehicle type:
Create VIEW ride_distance_for_each_vehicle as SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance FROM bookings GROUP BY
Vehicle_Type;
select * from ride_distance_for_each_vehicle;
#3. Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides_by_Customers AS select COUNT(*) from bookings where booking_status='Canceled by Customer';
select * from cancelled_rides_by_Customers;
#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customers AS SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings GROUP BY
Customer_ID ORDER BY total_rides DESC LIMIT 5;
select * from top_5_customers;
#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW  Rides_Canceled_by_Driver_P_C_Issues AS SELECT COUNT(*) from bookings where Canceled_Rides_by_Driver='Personal & Car related issue';
SELECT * from Rides_Canceled_by_Driver_P_C_Issues;
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Driver_Rating AS SELECT MAX(Driver_Ratings) AS Max_Rating,MIN(Driver_Ratings) AS Min_Rating FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
Select * from Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment as SELECT COUNT(*) as upi_rides from bookings where Payment_Method='UPI';
SELECT * from UPI_Payment;
#8. Find the average customer rating per vehicle type:
CREATE VIEW avg_Rating as SELECT Vehicle_Type,AVG(Customer_Rating) as avg_rating from bookings GROUP BY Vehicle_Type;
select * from avg_Rating;
#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_booking_value as SELECT SUM(Booking_Value) as total from bookings where Booking_Status='Success';
select * from total_booking_value;
#10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason as  SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings WHERE Incomplete_Rides ='Yes';
select * from Incomplete_Rides_Reason;