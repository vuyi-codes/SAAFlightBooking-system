-- Create the database (run this first, then connect to it before running the rest)
--CREATE DATABASE saa_flight_booking;

-- Airports table
CREATE TABLE Airports (
    AirportID SERIAL PRIMARY KEY,
    AirportCode VARCHAR(10) NOT NULL UNIQUE,
    AirportName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL
);

-- Flights table (references Airports twice: departure and arrival)
CREATE TABLE Flights (
    FlightID SERIAL PRIMARY KEY,
    DepartureAirportID INT NOT NULL,
    ArrivalAirportID INT NOT NULL,
    FlightNumber VARCHAR(10) NOT NULL UNIQUE,
    DepartureDateTime TIMESTAMP NOT NULL,
    ArrivalDateTime TIMESTAMP NOT NULL,
    CONSTRAINT fk_departure_airport FOREIGN KEY (DepartureAirportID) REFERENCES Airports(AirportID),
    CONSTRAINT fk_arrival_airport FOREIGN KEY (ArrivalAirportID) REFERENCES Airports(AirportID)
);

-- Passengers table
CREATE TABLE Passengers (
    PassengerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(20) NOT NULL
);

-- Bookings table
CREATE TABLE Bookings (
    BookingID SERIAL PRIMARY KEY,
    FlightID INT NOT NULL,
    BookingDate DATE NOT NULL,
    BookingStatus VARCHAR(20) NOT NULL,
    CONSTRAINT fk_booking_flight FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

-- BookingPassengers table (associative table for the many to many relationship)
CREATE TABLE BookingPassengers (
    BookingID INT NOT NULL,
    PassengerID INT NOT NULL,
    PRIMARY KEY (BookingID, PassengerID),
    CONSTRAINT fk_bp_booking FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    CONSTRAINT fk_bp_passenger FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);

-- Tickets table
CREATE TABLE Tickets (
    TicketID SERIAL PRIMARY KEY,
    BookingID INT NOT NULL,
    PassengerID INT NOT NULL,
    TicketNumber VARCHAR(20) NOT NULL UNIQUE,
    TicketStatus VARCHAR(20) NOT NULL,
    CONSTRAINT fk_ticket_booking FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    CONSTRAINT fk_ticket_passenger FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);

-- Payments table
CREATE TABLE Payments (
    PaymentID SERIAL PRIMARY KEY,
    BookingID INT NOT NULL,
    PaymentAmount NUMERIC(10,2) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL,
    PaymentDate DATE NOT NULL,
    CONSTRAINT fk_payment_booking FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
