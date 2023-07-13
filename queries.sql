--For all employee who attends some flight ,find their EmployeeID and the FlightID of the flight.
SELECT * FROM employee NATURAL JOIN flights; 

--Find number of pilots.
SELECT COUNT(*) FROM employee WHERE jobtitle = 'Pilot';
  
--Find the passangers whose age under 40.
SELECT passangerID, name, surname, age FROM Passanger WHERE age < 40;

--List the female passanger name descending order.
SELECT name FROM passanger WHERE gender = 'Female' ORDER BY name DESC;

--List all the Flight and Employee informations.
SELECT * FROM flights FULL OUTER JOIN Employee ON flights.flightID = Employee.employeeID; 

--Show names of passangers and employees.
SELECT passangerid, name FROM passanger UNION SELECT employeeid, employeename FROM employee;

--Creating a object view.
CREATE VIEW objView AS SELECT * FROM flights, employee; 

--List the flight Id which is its flight duration between 50 and 90.
SELECT flightid FROM flights WHERE flightduration between 50 AND 90;

--Print number of employees.
SELECT COUNT (DISTINCT EmployeeId) AS "Number of employees" FROM Employee; 
     
--Find intersect names of arrival airports and departure airports WHERE flightID is not null.
SELECT airportname, flightID FROM arrival_airport INTERSECT SELECT airportname, flightID FROM departure_airport WHERE flightID IS NOT NULL;

--Find the names of all instructors whose name includes the substring “j”.
SELECT EmployeeName FROM Employee WHERE employeename LIKE '%j%';
 
--Lists the number of airports in each country. Only include countries with more than 5 airport.
SELECT COUNT(airportname), Country FROM airportinfo GROUP BY Country HAVING COUNT(airportname) - 5;

--Find employees not gaving totalFlight 650 or 700.
SELECT * FROM Employee WHERE totalflights NOT IN (650, 700);

--SQL will order the customers by employeename. However, if employeename is NULL, then ORDER BY jobtitle.
SELECT employeename, jobtitle FROM objView ORDER BY
(
     CASE
          WHEN employeename IS NULL THEN jobtitle
          ELSE employeename
     END
);

--Name of the employees whose total flight is more than the average total flight.
SELECT EmployeeName, totalflights FROM Employee WHERE
totalflights - (
     SELECT
          AVG (totalflights)
     FROM
          Employee
)
ORDER BY
     EmployeeName;

--The longest duration flight.
SELECT MAX(FlightDuration) AS maxduration FROM Flights;

--The shortest duration flight.
SELECT MIN(FlightDuration) AS minduration FROM Flights;

--Creating a object view.
CREATE VIEW objView2 AS SELECT * FROM ticket, airportinfo;