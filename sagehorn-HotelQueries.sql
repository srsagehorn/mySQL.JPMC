-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

SELECT r.RoomNumber, r.StartDate, r.EndDate, CONCAT(g.FirstName, ' ',g.LastName) AS Name
    FROM Reservations r
INNER JOIN Guests g
	ON r.GuestId = g.GuestId
WHERE r.EndDate BETWEEN  '2023-07-01' AND '2023-07-31';

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

SELECT r.RoomNumber, r.StartDate, r.EndDate, CONCAT(g.FirstName, ' ', g.LastName) AS Name
    FROM Reservations r
INNER JOIN Guests g
    ON r.GuestId = g.GuestId
INNER JOIN Rooms m
    ON m.RoomNumber = r.RoomNumber
INNER JOIN Amenities a
    ON a.AmenitiesId = m.AmenitiesId
WHERE a.HasJacuzzi = TRUE; 

-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT r.RoomNumber, r.StartDate, CONCAT(g.FirstName, ' ', g.LastName) AS Name, (r.Adults + r.Children) AS TotalPeople
    FROM Reservations r
INNER JOIN Guests g
    ON r.GuestId = g.GuestId
WHERE CONCAT(g.FirstName, ' ',g.LastName) = 'Mack Simmer';


-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.
-- 306 and 402

-- decimal rounding issue

SELECT m.RoomNumber, r.ReservationId, 
    CASE
        WHEN (r.Adults + r.Children - m.StandardOccupancy) > 0
            THEN (m.BasePrice + 10.95 * (r.Adults + r.Children - m.StandardOccupancy)* DATEDIFF(r.EndDate, r.StartDate))
        WHEN (r.Adults + r.Children - m.StandardOccupancy) <= 0
            THEN (BasePrice* DATEDIFF(EndDate, StartDate))
        ELSE NULL
    END AS TotalCost
	FROM Rooms m
LEFT JOIN Reservations r
    ON m.RoomNumber = r.RoomNumber
LEFT JOIN Guests g
    ON r.GuestId = g.GuestId
    ORDER BY m.RoomNumber;

-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.

-- Isnt catching rooms with less than 3 occupancy

SELECT r.RoomNumber, r.StartDate, r.EndDate, m.MaxOccupancy, CONCAT(g.FirstName, ' ', g.LastName) AS Name
    FROM Reservations r
INNER JOIN Guests g
	ON r.GuestId = g.GuestId
INNER JOIN Rooms m
	ON m.RoomNumber = r.RoomNumber
WHERE m.MaxOccupancy >= 3
    AND r.StartDate BETWEEN '2023-04-01' AND '2023-04-30'
	OR r.EndDate BETWEEN '2023-04-01' AND '2023-04-30'
    OR r.StartDate < '2023-04-01' AND r.EndDate > '2023-04-30'
ORDER BY r.RoomNumber ASC;


-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.

-- Needs to have last name sorting

SELECT g.Name, COUNT(r.ReservationId) AS TotalReservations
	FROM Guests g
INNER JOIN Reservations r
	ON g.GuestId = r.GuestId
GROUP BY g.Name
ORDER BY TotalReservations DESC;

-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
-- For each query, include:

-- The request from this assignment as a comment above the query, including the number
-- The query itself
-- The results of the query in a comment under the query

-- (314) -974-8036

SELECT Name, Address, City, ZipCode, PhoneNumber FROM Guests WHERE PhoneNumber = '(314) 974-8036';

-- Results :
-- Shannon Sagehorn    2000 S Michigan Ave     Chicago     60616   (314) -974-8036

-- Can this really be this easy????