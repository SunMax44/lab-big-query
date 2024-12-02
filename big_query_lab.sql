-- Exercise 1: Count the number of trips in January 2021
SELECT COUNT(*)
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
WHERE data_file_month = 1;
-- 1369769

-- Exercise 2: Calculate the total revenue generated by taxi trips in 2021
SELECT SUM(total_amount)
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
-- 608700428.39

-- Exercise 3: Find the most popular pickup location
SELECT pickup_location_id, COUNT (*) AS location_count
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY pickup_location_id
ORDER BY COUNT(pickup_location_id) DESC
LIMIT 1;
-- id 237 with 1553554 counts

-- Exercise 4: Analyze the number of trips per hour of the day
SELECT EXTRACT (HOUR FROM pickup_datetime) AS hour_end, COUNT(*) AS number_of_trip
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY hour_end
ORDER BY COUNT(*) DESC;

-- Exercise 5: Calculate the average trip distance
SELECT AVG(trip_distance) AS average_distance
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`;

-- Exercise 6: Find the longest trip by distance
SELECT MAX(trip_distance) AS longest_strip
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`;

SELECT *
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
WHERE trip_distance = 351613.36;
-- doesnt make sense really

-- Exercise 7: Calculate the total number of passengers by payment type
SELECT SUM(passenger_count) AS total_number_of_passengers, payment_type
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY payment_type
ORDER BY total_number_of_passengers DESC;

-- Exercise 8: Find the most common drop-off location for trips paid by credit card
SELECT COUNT(*) AS count, dropoff_location_id
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
WHERE payment_type = '1'
GROUP BY dropoff_location_id
ORDER BY count DESC
LIMIT 10;

-- Exercise 9: Calculate the total number of trips that had more than 4 passengers
SELECT COUNT(*) AS number_of_trips_that_had_more_than_4_passengers, AVG(passenger_count) AS average_passenger_count
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
WHERE passenger_count > 4;

-- Exercise 10: Subquery - Find the average fare for trips longer than the average trip distance
SELECT AVG(fare_amount) AS avg_fare
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
WHERE trip_distance > (SELECT AVG(trip_distance)
                            FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`);