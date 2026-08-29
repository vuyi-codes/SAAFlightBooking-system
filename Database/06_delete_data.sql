-- 1. BEFORE: confirm the booking exists, and see what's linked to it
SELECT * FROM Bookings WHERE BookingID = 1;

SELECT * FROM BookingPassengers WHERE BookingID = 1;
SELECT * FROM Tickets WHERE BookingID = 1;
SELECT * FROM Payments WHERE BookingID = 1;

-- 2. Attempt the delete (this should FAIL because of foreign key constraints)
DELETE FROM Bookings WHERE BookingID = 1;

-- 3. AFTER: confirm the booking still exists, unchanged
SELECT * FROM Bookings WHERE BookingID = 1;
