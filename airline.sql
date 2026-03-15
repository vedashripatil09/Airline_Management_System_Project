SHOW DATABASES;
CREATE DATABASE airline;
USE airline;
-- passengers table--
CREATE TABLE passengers(
passenger_id INT PRIMARY KEY,
name VARCHAR(100),
age INT,
gender VARCHAR(10),
city VARCHAR(50)
);
-- flights table--
CREATE TABLE flights (
flight_id INT PRIMARY KEY,
airline VARCHAR(50),
source_city VARCHAR(50),
destination_city VARCHAR(50),
departure_hour INT,
duration_hours INT,
total_seats INT
);
-- bookings--
CREATE TABLE bookings (
booking_id INT PRIMARY KEY,
passenger_id INT,
flight_id INT,
seat_number INT,
ticket_price INT,
booking_date DATE
);

-- Passengers by City --
SELECT city,
COUNT(*) AS total_passengers
FROM passengers
GROUP BY city
ORDER BY total_passengers DESC;

-- Total Flights Available --
SELECT ROUND(AVG(age),1) AS average_age
FROM passengers;

-- Total Flights Available --
SELECT COUNT(*) AS total_flights
FROM flights;

-- Flights by Airline --
SELECT airline,
COUNT(*) AS total_flights
FROM flights
GROUP BY airline
ORDER BY total_flights DESC;

-- Flights From Each Source City --
SELECT source_city,
COUNT(*) AS total_flights
FROM flights
GROUP BY source_city
ORDER BY total_flights DESC;

-- Total Revenue --
SELECT SUM(ticket_price) AS total_revenue
FROM bookings;

-- Average Ticket Price --
SELECT AVG(ticket_price) AS avg_ticket_price
FROM bookings;

-- Airline Revenue Analysis --
SELECT f.airline,
SUM(b.ticket_price) AS total_revenue
FROM bookings b
JOIN flights f
ON b.flight_id = f.flight_id
GROUP BY f.airline
ORDER BY total_revenue DESC;

-- Most Popular Routes --
SELECT f.source_city,
f.destination_city,
COUNT(*) AS total_bookings
FROM bookings b
JOIN flights f
ON b.flight_id = f.flight_id
GROUP BY f.source_city, f.destination_city
ORDER BY total_bookings DESC;

-- Passenger Travel History --
SELECT p.name,
f.airline,
f.source_city,
f.destination_city,
b.ticket_price
FROM bookings b
JOIN passengers p
ON b.passenger_id = p.passenger_id
JOIN flights f
ON b.flight_id = f.flight_id
LIMIT 20;

-- Top 5 Most Expensive Tickets --
SELECT *
FROM bookings
ORDER BY ticket_price DESC
LIMIT 5;

-- Bookings Per Airline --
SELECT f.airline,
COUNT(*) AS total_bookings
FROM bookings b
JOIN flights f
ON b.flight_id = f.flight_id
GROUP BY f.airline
ORDER BY total_bookings DESC;

-- Flights With Highest Bookings --
SELECT flight_id,
COUNT(*) AS total_bookings
FROM bookings
GROUP BY flight_id
ORDER BY total_bookings DESC
LIMIT 5;

-- Seat Occupancy Analysis --
SELECT f.flight_id,
f.total_seats,
COUNT(b.booking_id) AS seats_booked
FROM flights f
LEFT JOIN bookings b
ON f.flight_id = b.flight_id
GROUP BY f.flight_id;