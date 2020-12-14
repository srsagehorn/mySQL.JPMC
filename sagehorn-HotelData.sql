INSERT INTO Amenities (HasMicrowave, HasOven, HasJacuzzi, HasRefrigerator) VALUES
	(TRUE, FALSE, FALSE, FALSE), -- 1 M
	(FALSE, TRUE, FALSE, FALSE), -- 2 O
	(FALSE, FALSE, TRUE, FALSE), -- 3 J
	(FALSE, FALSE, FALSE, TRUE), -- 4 R
	(TRUE, TRUE, FALSE, FALSE), -- 5 MO
	(FALSE, TRUE, TRUE, FALSE), -- 6 OJ
	(FALSE, FALSE, TRUE, TRUE), -- 7 JR
	(TRUE, FALSE, FALSE, TRUE), -- 8 MR
	(FALSE, TRUE, FALSE, TRUE), -- 9 OR
	(TRUE, FALSE, TRUE, FALSE),  -- 10 MJ
	(FALSE, TRUE, TRUE, TRUE), -- 11 OJR
	(TRUE, FALSE, TRUE, TRUE), -- 12 MJR
	(TRUE, TRUE, FALSE, TRUE), -- 13 MOR
	(TRUE, TRUE, TRUE, FALSE), -- 14 MOJ
	(TRUE, TRUE, TRUE, TRUE), -- 15 MOJR
	(FALSE, FALSE, FALSE, FALSE); -- 16 
    
INSERT INTO Guests (FirstName, LastName, Address, City, State, ZipCode, PhoneNumber) VALUES
    ('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291) 553-0508'),
    ('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '(478) 277-9632'),
    ('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308) 494-0198'),
    ('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '(214) 730-0298'),
    ('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377) 507-0974'),
    ('Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814) 485-2615'),
    ('Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '(279) 491-0960'),
    ('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '(446) 396-6785'),
    ('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834) 727-1001'),
    ('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446) 351-6860'),
    ('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026', '(231) 893-2755'),
    ('Shannon', 'Sagehorn', '2000 S Michigan Ave', 'Chicago', 'IL', '60616', '(314) 974-8036');
    
INSERT INTO Rooms (RoomNumber, RoomType, AmenitiesId, ADAAccessible, StandardOccupancy, MaxOccupancy, BasePrice, ExtraPersonCost) VALUES 
    (201, 'Double', 10, FALSE, 2, 4, 199.99, 10),
    (202, 'Double', 4, TRUE, 2, 4, 174.99, 10),
    (203, 'Double', 10, FALSE, 2, 4, 199.99, 10),
    (204, 'Double', 4, TRUE, 2, 4, 174.99, 10),
    (205, 'Single', 12, FALSE, 2, 2, 174.99, 0),
    (206, 'Single', 8, TRUE, 2, 2, 149.99, 0),
    (207, 'Single', 12, FALSE, 2, 2, 174.99, 0),
    (208, 'Single', 8, TRUE, 2, 2, 149.99, 0),
    (301, 'Double', 10, FALSE, 2, 4, 199.99, 10),
    (302, 'Double', 4, TRUE, 2, 4, 174.99, 10),
    (303, 'Double', 10, FALSE, 2, 4, 199.99, 10),
    (304, 'Double', 4, TRUE, 2, 4, 174.99, 10),
    (305, 'Single', 12, FALSE, 2, 2, 174.99, 0),
    (306, 'Single', 8, TRUE, 2, 2, 149.99, 0),
    (307, 'Single', 12, FALSE, 2, 2, 174.99, 0),
    (308, 'Single', 8, TRUE, 2, 2, 149.99, 0),
    (401, 'Suite', 13, TRUE, 3, 8, 399.99, 20),
    (402, 'Suite', 13, TRUE, 3, 8, 399.99, 20);
    
INSERT INTO Reservations (RoomNumber, GuestId, Adults, Children, StartDate, EndDate) VALUES
	(308, 1, 1, 0, '2023-02-02', '2023-02-04'),
	(203, 2, 2, 1, '2023-02-05', '2023-02-10'),
	(305, 3, 2, 0, '2023-02-22', '2023-02-24'),
	(201, 4, 2, 2, '2023-03-06', '2023-03-07'),
	(307, 12, 1, 1, '2023-03-17', '2023-03-20'),
	(302, 5, 3, 0, '2023-03-18', '2023-03-23'),
	(202, 6, 2, 2, '2023-03-29', '2023-03-31'),
	(304, 7, 2, 0, '2023-03-31', '2023-04-05'),
	(301, 8, 1, 0, '2023-04-09', '2023-04-13'),
	(207, 9, 1, 1, '2023-04-23', '2023-04-24'),
	(401, 10, 2, 4, '2023-05-30', '2023-06-02'),
	(206, 11, 2, 0, '2023-06-10', '2023-06-14'),
	(208, 11, 1, 0, '2023-06-10', '2023-06-14'),
	(304, 4, 3, 0, '2023-06-17', '2023-06-18'),
	(205, 12, 2, 0, '2023-06-28', '2023-07-02'),
	(204, 8, 3, 1, '2023-07-13', '2023-07-14'),
	(401, 9, 4, 2, '2023-07-18', '2023-07-29'),
	(303, 2, 2, 1, '2023-07-28', '2023-07-29'),
	(305, 2, 1, 0, '2023-08-30', '2023-09-01'),
	(208, 1, 2, 0, '2023-09-16', '2023-09-17'),
	(203, 4, 2, 2, '2023-09-13', '2023-09-15'),
	(401, 3, 2, 2, '2023-11-22', '2023-11-25'),
	(206, 1, 2, 0, '2023-11-22', '2023-11-25'),
	(301, 1, 2, 2, '2023-11-22', '2023-11-25'),
	(302, 10, 2, 0, '2023-12-24', '2023-12-28');