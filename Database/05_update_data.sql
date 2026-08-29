-- ===== UPDATE 1: Passenger email address =====

-- Before: check the current email for passenger 1 (Thabo Mokoena)
SELECT PassengerID, FirstName, LastName, Email FROM Passengers WHERE PassengerID = 1;

-- Perform the update
UPDATE Passengers
SET Email = 'thabo.mokoena.updated@email.com'
WHERE PassengerID = 1;

-- After: confirm the change
SELECT PassengerID, FirstName, LastName, Email FROM Passengers WHERE PassengerID = 1;


-- ===== UPDATE 2: Booking status =====

-- Before: check booking 3's current status
SELECT BookingID, FlightID, BookingDate, BookingStatus FROM Bookings WHERE BookingID = 3;

-- Perform the update (Booking 3 was "Pending" — confirm it now that payment has cleared)
UPDATE Bookings
SET BookingStatus = 'Confirmed'
WHERE BookingID = 3;

-- After: confirm the change
SELECT BookingID, FlightID, BookingDate, BookingStatus FROM Bookings WHERE BookingID = 3;


-- ===== UPDATE 3: Payment status =====

-- Before: check payment for booking 3
SELECT PaymentID, BookingID, PaymentAmount, PaymentStatus FROM Payments WHERE BookingID = 3;

-- Perform the update
UPDATE Payments
SET PaymentStatus = 'Paid'
WHERE BookingID = 3;

-- After: confirm the change
SELECT PaymentID, BookingID, PaymentAmount, PaymentStatus FROM Payments WHERE BookingID = 3;
