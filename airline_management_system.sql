CREATE TABLE employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    JobTitle VARCHAR(255),
    NumOfFlights INT,
    TotalFlights INT
);

CREATE TABLE flights (
    FlightID VARCHAR(255) PRIMARY KEY,
    FlightDuration INT,
    OccupancyRatE INT,
    FlightTime DECIMAL(4, 2)
);

CREATE TABLE attends (
    FlightID VARCHAR(255),
    EmployeeID INT,
    FOREIGN KEY (FlightID) REFERENCES flights (FlightID),
    FOREIGN KEY (EmployeeID) REFERENCES employee (EmployeeID)
);

CREATE TABLE arrival_airport (
    FlightID VARCHAR(255),
    AirportName VARCHAR(255),
    FOREIGN KEY (FlightID) REFERENCES flights (FlightID)
);

CREATE TABLE airport_info (
    AirportName VARCHAR(255),
    City VARCHAR(255),
    Country VARCHAR(255),
    AircraftCapacity INT
);

CREATE TABLE plane (
    AircraftID INT PRIMARY KEY,
    AircraftType VARCHAR(255)
);

CREATE TABLE passanger (
    PassangerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Surname VARCHAR(255),
    Gender VARCHAR(255),
    Age INT
);

CREATE TABLE have (
    PassangerID INT,
    FlightID VARCHAR(255),
    TicketID VARCHAR(255),
    FOREIGN KEY (PassangerID) REFERENCES passanger (PassangerID),
    FOREIGN KEY (FlightID) REFERENCES flights (FlightID)
);

CREATE TABLE departure_airport (
    FlightID VARCHAR(255),
    AirportName VARCHAR(255),
    FOREIGN KEY (FlightID) REFERENCES flights (FlightID)
);

INSERT INTO
    employee (
        EmployeeID,
        EmployeeName,
        JobTitle,
        NumOfFlights,
        TotalFlights
    )
VALUES
    ('14555', 'Jake', 'Copilot', 167, 225),
    ('47997', 'George', 'Hostess', 147, 190),
    ('68347', 'Jessica', 'Pilot', 210, 360),
    ('36485', 'Angel', 'Hostess', 213, 512),
    ('76195', 'Joe', 'Copilot', 146, 323);

INSERT into
    flights (
        FlightID,
        FlightDuration,
        OccupancyRatE,
        FlightTime
    )
VALUES
    ('62345234', 100, 30, 20.30),
    ('623462341', 95, 40, 15.40),
    ('62347124124', 70, 50, 16.20),
    ('62349008', 80, 65, 23.50),
    ('623421', 88, 25, 05.05);

INSERT into
    attends (FlightID, EmployeeID)
VALUES
    ('62345234', '14555'),
    ('623462341', '47997'),
    ('62347124124', '68347'),
    ('62349008', '36485'),
    ('623421', '76195');

INSERT into
    arrival_airport (FlightID, AirportName)
VALUES
    ('62345234', 'Luton'),
    ('623462341', 'Heathrow'),
    ('62347124124', 'Gatwick'),
    ('62349008', 'London City'),
    ('623421', 'Manchester');

INSERT into
    airport_info (AirportName, City, Country, AircraftCapacity)
VALUES
    ('Luton', 'Luton', 'England', 22),
    ('Heathrow', 'London', 'England', 56),
    ('Gatwick', 'West Sussex', 'England', 77),
    ('London City', 'London', 'England', 45),
    ('Manchester', 'Manchester', 'England', 11);

INSERT into
    plane (AircraftID, AircraftType)
VALUES
    ('12361', 'Boeing 737 -800'),
    ('12362', 'Airbus A320'),
    ('12363', 'Airbus A321'),
    ('12364', 'Boeing 737 -900'),
    ('12365', 'Airbus A320neo');

INSERT into
    passanger (PassangerID, Name, Surname, Gender, Age)
VALUES
    ('12345', 'Cleo', 'Bright', 'Male', 40),
    (
        '12346',
        'Diana',
        'Hernandez',
        'Female',
        25
    ),
    ('12347', 'Alana', 'Hurst', 'Female', 30),
    ('12348', 'Dan', 'Kemp', 'Male', 35),
    ('12349', 'Elaine', 'Huber', 'Female', 45);

INSERT INTO
    have (PassangerID, FlightID, TicketID)
VALUES
    (
        '12347',
        '62345234',
        '12654654'
    ),
    (
        '12348',
        '62345234',
        '13245697'
    ),
    (
        '12349',
        '623462341',
        '22333987'
    ),
    (
        '12345',
        '62347124124',
        '44646584'
    ),
    (
        '12346',
        '62349008',
        '45641218'
    );

INSERT into
    departure_airport (FlightID, AirportName)
VALUES
    ('62345234', 'Luton'),
    ('623462341', 'Heathrow'),
    ('62347124124', 'Gatwick'),
    ('62349008', 'London City'),
    ('62347124124', 'Manchester');