-- 1. Confirm every foreign key constraint that exists in the database
SELECT
    tc.table_name AS child_table,
    kcu.column_name AS fk_column,
    ccu.table_name AS parent_table,
    ccu.column_name AS parent_column
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
    ON tc.constraint_name = ccu.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
ORDER BY child_table;

-- 2. Prove referential integrity: try to insert a Flight with an Airport that does not exist
-- This should FAIL, which is the point of the test
INSERT INTO Flights (DepartureAirportID, ArrivalAirportID, FlightNumber, DepartureDateTime, ArrivalDateTime)
VALUES (999, 998, 'TEST123', '2026-09-01 10:00', '2026-09-01 12:00');

-- 3. Prove the many-to-many relationship: try to link a Booking and Passenger that don't exist
-- This should also FAIL
INSERT INTO BookingPassengers (BookingID, PassengerID)
VALUES (999, 999);
