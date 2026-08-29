-- Insert order matters: parent tables first, then the tables that reference them

-- 1. Airports (3 airports, minimum required)
INSERT INTO Airports (AirportCode, AirportName, City) VALUES
('JNB', 'OR Tambo International Airport', 'Johannesburg'),
('CPT', 'Cape Town International Airport', 'Cape Town'),
('DUR', 'King Shaka International Airport', 'Durban');

-- 2. Flights (5 flights, references Airports by AirportID)
-- Since Airports were just inserted, JNB=1, CPT=2, DUR=3
INSERT INTO Flights (DepartureAirportID, ArrivalAirportID, FlightNumber, DepartureDateTime, ArrivalDateTime) VALUES
(1, 2, 'SA100', '2026-09-10 08:00', '2026-09-10 10:00'), -- Johannesburg to Cape Town
(2, 1, 'SA101', '2026-09-10 12:00', '2026-09-10 14:00'), -- Cape Town to Johannesburg
(1, 3, 'SA202', '2026-09-11 09:00', '2026-09-11 10:15'), -- Johannesburg to Durban
(3, 2, 'SA303', '2026-09-11 15:00', '2026-09-11 17:00'), -- Durban to Cape Town
(1, 2, 'SA404', '2026-09-12 06:30', '2026-09-12 08:30'); -- Johannesburg to Cape Town

-- 3. Passengers (5 passengers)
INSERT INTO Passengers (FirstName, LastName, Email, PhoneNumber) VALUES
('Thabo', 'Mokoena', 'thabo.mokoena@email.com', '0821234567'),
('Naledi', 'Dlamini', 'naledi.dlamini@email.com', '0827654321'),
('Sipho', 'Nkosi', 'sipho.nkosi@email.com', '0731122334'),
('Amahle', 'Zulu', 'amahle.zulu@email.com', '0845566778'),
('Johan', 'van der Merwe', 'johan.vdm@email.com', '0619988776');

-- 4. Bookings (3 bookings, references Flights by FlightID)
INSERT INTO Bookings (FlightID, BookingDate, BookingStatus) VALUES
(1, '2026-09-01', 'Confirmed'), -- Booking for SA100
(3, '2026-09-02', 'Confirmed'), -- Booking for SA202
(4, '2026-09-03', 'Pending');   -- Booking for SA303

-- 5. BookingPassengers (links bookings to passengers - the many to many table)
INSERT INTO BookingPassengers (BookingID, PassengerID) VALUES
(1, 1), -- Thabo on Booking 1
(1, 2), -- Naledi also on Booking 1 (group booking)
(2, 3), -- Sipho on Booking 2
(3, 4), -- Amahle on Booking 3
(3, 5); -- Johan also on Booking 3 (group booking)

-- 6. Tickets (one ticket per booking-passenger pair)
INSERT INTO Tickets (BookingID, PassengerID, TicketNumber, TicketStatus) VALUES
(1, 1, 'TK1001', 'Issued'),
(1, 2, 'TK1002', 'Issued'),
(2, 3, 'TK1003', 'Issued'),
(3, 4, 'TK1004', 'Pending'),
(3, 5, 'TK1005', 'Pending');

-- 7. Payments (one payment per booking)
INSERT INTO Payments (BookingID, PaymentAmount, PaymentStatus, PaymentDate) VALUES
(1, 3200.00, 'Paid', '2026-09-01'),
(2, 1800.00, 'Paid', '2026-09-02'),
(3, 4100.00, 'Pending', '2026-09-03');
