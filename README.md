# Airline Management Data Analysis Project

## Project Overview
This project analyzes airline booking data using **MySQL and Python** to identify trends in airline performance, booking patterns, revenue generation, and popular travel routes.

The analysis combines **SQL queries with Python-based data visualization** to generate meaningful insights from airline booking data.

---

## Technologies Used

- MySQL
- Python
- Pandas
- Matplotlib
- Seaborn
- Jupyter Notebook

---

## Database Structure

The project database contains three main tables:

### Passengers
Stores passenger details.

- passenger_id
- name
- age
- gender
- city

### Flights
Stores flight information.

- flight_id
- airline
- source_city
- destination_city
- departure_hour
- duration_hours
- total_seats

### Bookings
Stores booking transaction data.

- booking_id
- passenger_id
- flight_id
- seat_number
- ticket_price
- booking_date

---

## Example SQL Query

```sql
SELECT f.airline,
SUM(b.ticket_price) AS total_revenue
FROM bookings b
JOIN flights f
ON b.flight_id = f.flight_id
GROUP BY f.airline
ORDER BY total_revenue DESC;
