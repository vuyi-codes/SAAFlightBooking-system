-- 1. Passenger bookings: which flight is each passenger booked on (INNER JOIN)
SELECT
    p.FirstName || ' ' || p.LastName AS "Passenger Name",
    b.BookingID AS "Booking ID",
    f.FlightNumber AS "Flight Number",
    b.BookingStatus AS "Booking Status"
FROM Passengers p
INNER JOIN BookingPassengers bp ON p.PassengerID = bp.PassengerID
INNER JOIN Bookings b ON bp.BookingID = b.BookingID
INNER JOIN Flights f ON b.FlightID = f.FlightID
ORDER BY p.LastName;

-- 2. Flight manifest: every flight and who (if anyone) is booked on it (LEFT JOIN)
SELECT
    f.FlightNumber AS "Flight Number",
    f.DepartureDateTime AS "Departure",
    p.FirstName || ' ' || p.LastName AS "Passenger Name"
FROM Flights f
LEFT JOIN Bookings b ON f.FlightID = b.FlightID
LEFT JOIN BookingPassengers bp ON b.BookingID = bp.BookingID
LEFT JOIN Passengers p ON bp.PassengerID = p.PassengerID
ORDER BY f.FlightNumber;

-- 3. Revenue generated per flight (INNER JOIN + GROUP BY + SUM)
SELECT
    f.FlightNumber AS "Flight Number",
    SUM(pay.PaymentAmount) AS "Total Revenue"
FROM Flights f
INNER JOIN Bookings b ON f.FlightID = b.FlightID
INNER JOIN Payments pay ON b.BookingID = pay.BookingID
GROUP BY f.FlightNumber
ORDER BY "Total Revenue" DESC;

-- 4. Tickets issued per flight (INNER JOIN + GROUP BY + COUNT)
SELECT
    f.FlightNumber AS "Flight Number",
    COUNT(t.TicketID) AS "Tickets Issued"
FROM Flights f
INNER JOIN Bookings b ON f.FlightID = b.FlightID
INNER JOIN Tickets t ON b.BookingID = t.BookingID
GROUP BY f.FlightNumber
ORDER BY f.FlightNumber;

-- 5. Overall booking summary: bookings and revenue by status (LEFT JOIN + GROUP BY + COUNT + SUM)
SELECT
    b.BookingStatus AS "Status",
    COUNT(b.BookingID) AS "Number of Bookings",
    SUM(pay.PaymentAmount) AS "Total Amount"
FROM Bookings b
LEFT JOIN Payments pay ON b.BookingID = pay.BookingID
GROUP BY b.BookingStatus
ORDER BY b.BookingStatus;
