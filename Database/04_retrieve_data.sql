
-- 1. All passenger information, sorted alphabetically by last name
SELECT
    PassengerID AS "Passenger ID",
    FirstName AS "First Name",
    LastName AS "Last Name",
    Email,
    PhoneNumber AS "Phone Number"
FROM Passengers
ORDER BY LastName ASC;

-- 2. All flight information, sorted by departure time
SELECT
    FlightID AS "Flight ID",
    FlightNumber AS "Flight Number",
    DepartureAirportID AS "Departure Airport ID",
    ArrivalAirportID AS "Arrival Airport ID",
    DepartureDateTime AS "Departure Time",
    ArrivalDateTime AS "Arrival Time"
FROM Flights
ORDER BY DepartureDateTime ASC;

-- 3. All booking information, sorted by most recent booking date first
SELECT
    BookingID AS "Booking ID",
    FlightID AS "Flight ID",
    BookingDate AS "Booking Date",
    BookingStatus AS "Status"
FROM Bookings
ORDER BY BookingDate DESC;

-- 4. All payment information, showing only payments that are still pending
SELECT
    PaymentID AS "Payment ID",
    BookingID AS "Booking ID",
    PaymentAmount AS "Amount",
    PaymentStatus AS "Status",
    PaymentDate AS "Payment Date"
FROM Payments
WHERE PaymentStatus = 'Pending'
ORDER BY PaymentDate ASC;

-- 5. Flights departing from Johannesburg (JNB, AirportID = 1)
SELECT
    FlightID AS "Flight ID",
    FlightNumber AS "Flight Number",
    DepartureDateTime AS "Departure Time",
    ArrivalAirportID AS "Arrival Airport ID"
FROM Flights
WHERE DepartureAirportID = 1
ORDER BY DepartureDateTime ASC;

-- 6. Flights arriving in Cape Town (CPT, AirportID = 2)
SELECT
    FlightID AS "Flight ID",
    FlightNumber AS "Flight Number",
    DepartureAirportID AS "Departure Airport ID",
    ArrivalDateTime AS "Arrival Time"
FROM Flights
WHERE ArrivalAirportID = 2
ORDER BY ArrivalDateTime ASC;
