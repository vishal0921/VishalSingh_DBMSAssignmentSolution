-- 1) You are required to create two tables PASSENGER and PRICE with the following attributes and properties 

Create Database if not exists `Passenger` ;
use `Passenger`;

CREATE TABLE PASSENGER (
    Passenger_name VARCHAR(20),
    Category VARCHAR(20),
    Gender VARCHAR(20),
    Boarding_City VARCHAR(20),
    Destination_City VARCHAR(20),
    Distance INT,
    Bus_Type VARCHAR(20)
);


CREATE TABLE PRICE (
    Bus_Type VARCHAR(20),
    Distance INT,
    Price INT
);


-- 2) Insert the following data in the tables
insert into passenger values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into passenger values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into passenger values('Pallavi','AC','F','panaji','Bengaluru',600,'Sleeper');
insert into passenger values('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into passenger values('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
insert into passenger values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into passenger values('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
insert into passenger values('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into passenger values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

SELECT 
    *
FROM
    passenger;

insert into price values('Sleeper',350,770);
insert into price values('Sleeper',500,1100);
insert into price values('Sleeper',600,1320);
insert into price values('Sleeper',700,1540);
insert into price values('Sleeper',1000,2200);
insert into price values('Sleeper',1200,2640);
insert into price values('Sleeper',1500,2700);
insert into price values('Sitting',500,620);
insert into price values('Sitting',600,744);
insert into price values('Sitting',700,868);
insert into price values('Sitting',1000,1240);
insert into price values('Sitting',1200,1488);
insert into price values('Sitting',1500,1860);

SELECT 
    *
FROM
    price;

-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?
 
SELECT 
    Gender, COUNT(Gender)
FROM
    Passenger
WHERE
    Distance >= 600
GROUP BY Gender;
 
 -- 4) Find the minimum ticket price for Sleeper Bus. 
SELECT 
    MIN(Price)
FROM
    Price
WHERE
    Bus_Type = 'Sleeper';

 -- 5) Select passenger names whose names start with character 'S'
SELECT 
    Passenger_Name
FROM
    Passenger
WHERE
    Passenger_Name LIKE 'S%'
ORDER BY Passenger_Name;

 -- 6)Calculate price charged for each passenger displaying Passenger name, Boarding City,Destination City, Bus_Type, Price in the output
SELECT 
    a.Passenger_name,
    a.Boarding_City,
    a.Destination_City,
    a.Bus_type,
    b.Price
FROM
    Passenger a,
    Price b
WHERE
    (a.Bus_Type = b.Bus_Type
        AND a.Distance = b.Distance);

 -- 7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus for a distance of 1000 KM s 
SELECT 
    a.Passenger_name, b.Price
FROM
    Passenger a,
    Price b
WHERE
    (a.Bus_Type = 'Sitting'
        AND b.Bus_Type = 'Sitting'
        AND a.Distance = 700
        AND b.Distance = 700);

 -- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
SELECT 
    Price
FROM
    Price
WHERE
    distance = (SELECT 
            Distance
        FROM
            Passenger
        WHERE
            passenger_name = 'Pallavi');

 -- 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
SELECT DISTINCT
    (Distance)
FROM
    Passenger
ORDER BY distance DESC;

 --  10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables
with total as ( select sum(distance) as total from Passenger)
    select passenger_Name,(distance / total.total)*100 as percentage_travel from Passenger,total ;

 -- 11) Display the distance, price in three categories in table Price
SELECT 
    Distance,
    Price,
    CASE
        WHEN Price > 1000 THEN 'Expensive'
        WHEN Price < 1000 AND Price > 500 THEN 'Average Cost'
        ELSE 'cheap'
    END AS Cost
FROM
    price;
