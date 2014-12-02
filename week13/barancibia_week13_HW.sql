--Ben Arancibia
--Week 13 Assignment
--December 1, 2014

--Question 1

/*Write a moderately complex JOIN query against two or more tables in the flights database. Measure
the performance of the JOIN (at least twice to factor in caching issues). Next, create at least one index that
should improve the performance of the join. Measure the performance of the join again.
*/

CREATE TABLE flights
(
	flight INT,
	airline VARCHAR(32),
	depart VARCHAR(6),
	arrive VARCHAR(6),
	capacity INT,
	takeoff INT,
	landing INT
);

CREATE TABLE airports
(
	label VARCHAR(6),
	city VARCHAR(32),
	state VARCHAR(32)
);

--DROP TABLE airports;

CREATE TABLE airlines
(
	id serial PRIMARY KEY,
	name VARCHAR(32),
	UNIQUE(name)
);

--DROP TABLE airlines;

CREATE TABLE airports_new
(
	id serial primary key,
	label VARCHAR(6),
	city VARCHAR(32),
	state VARCHAR(32),
	UNIQUE(label)
);

CREATE TABLE flights_new
(
	id serial PRIMARY KEY,
	flightnum INT,
	airlineid INT,
	depart_airportid INT,
	arrive_airportid INT,
	capacity INT,
	takeoff INT,
	landing INT,

	CONSTRAINT flight_airline FOREIGN KEY (airlineid) REFERENCES airlines(id),
	CONSTRAINT depart_airport FOREIGN KEY (depart_airportid) REFERENCES airports(id),
	CONSTRAINT arrive_airport FOREIGN KEY (arrive_airportid) REFERENCES airports(id)
);

--insert statments
INSERT INTO airlines (name) SELECT DISTINCT airline FROM flights
INSERT INTO airports_new (label, city, state) SELECT DISTINCT label, city, state FROM airports;
INSERT INTO flights_new (flightnum, airlineid, depart_airportid, arrive_airportid, capacity, takeoff, landing)
	SELECT flight, a.id, d.id, o.id, capacity, takeoff, landing
		FROM flights f
			INNER JOIN airlines a ON a.name = f.airline
			INNER JOIN airports d ON d.label = f.depart
			INNER JOIN airports o ON o.label = f.arrive;




--performance test

SELECT a.name AS AirlineName, d.city AS Departed,  o.city AS Arrived, f.* FROM flights_new f
	INNER JOIN airlines a ON a.id = f.airlineid
	INNER JOIN airports_new d ON d.id = f.depart_airportid
	INNER JOIN airports_new o ON o.id = f.arrive_airportid;


-- execution time

1-32 ms
2-32 ms
3-31 ms
4-31 ms
5-31 ms

--Question 2
/*
Write code that generates a new SQL table that includes information from at least two base tables, one new
calculated column, and one “pre-stored aggregation.” Can you do the same thing with a SQL view? What
are the advantages and disadvantages of the table vs. the view?
*/


--Table creation view total capcity of flights
--Used the same data as flight


CREATE TABLE capacity AS
SELECT 
      Depart,
      SUM(Capacity) TotCapacity
FROM
      flight
WHERE 
      EXISTS (
SELECT
      airports_new.*,
      flights_new.Flight,
      flights_new.Airline,
      flights_new.Depart,
      flights_new.capacity,
      flights_new.takeoff
FROM
      airports_new
INNER JOIN flights_new ON airports_new.Label = flights_new.depart
)
GROUP BY
      Depart
;

--execution time: 
--303 ms

--Repeat the above in a view


CREATE VIEW capacity_view AS
SELECT 
      Depart,
      SUM(Capacity) TotCapacity
FROM
      flight
WHERE 
      EXISTS (
SELECT
      airports_new.*,
	  flights_new.Flight,
      flights_new.Airline,
      flights_new.Depart,
      flights_new.capacity,
      flights_new.takeoff
FROM
      airports_new
INNER JOIN flights_new ON airport.Label = flight.depart
)
GROUP BY
      Depart
;

--execution time:
--74 ms

/*
The advantages and disadvantages of a table vs a view are as follows:
PostgreSQL doesn’t support calculated columns they are implemented as TRIGGERs on INSERT or UPDATE. A calculation is a snapshot based on the last 
INSERT or UPDATE rather than a currently calculated value. A view allows the calculated column to be recalculated during a query and has the effect
of a realtime calculation.
*/



