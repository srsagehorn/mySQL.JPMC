-- Please write INSERT queries to populate the tables as follows:

-- Actor Table
-- ActorID	FirstName	LastName	BirthDate
-- 1	Bill	Murray	9/21/1950
-- 2	Dan	Aykroyd	7/1/1952
-- 3	John	Candy	10/31/1950
-- 4	Steve	Martin	NULL
-- 5	Sylvester	Stallone	NULL

INSERT INTO Actor (FirstName, LastName, BirthDate)
VALUES ('Bill', 'Murray', '1950/09/21'),
('Dan', 'Aykroyd', '1952/07/01'),
('John', 'Candy', '1950/10/31'),
('Steve', 'Martin', NULL),
('Sylvester', 'Stallone', NULL);

-- SELECT * FROM Actor;
 

-- Director Table
-- DirectorID	FirstName	LastName	BirthDate
-- 1	Ivan	Reitman	10/27/1946
-- 2	Ted	Kotcheff	NULL

INSERT INTO Director (FirstName, LastName, BirthDate)
VALUES ('Ivan', 'Reitman', '1946/10/27'),
('Ted', 'Kotcheff', NULL);

-- SELECT * FROM Director;
 

-- Rating Table
-- RatingID	RatingName
-- 1	G
-- 2	PG
-- 3	PG-13
-- 4	R

INSERT INTO Rating (RatingName)
VALUES ('G'), ('PG'), ('PG-13'), ('R');

-- SELECT * FROM Rating;
 

-- Genre Table
-- GenreID	GenreName
-- 1	Action
-- 2	Comedy
-- 3	Drama
-- 4	Horror

INSERT INTO Genre (GenreName)
VALUES ('Action'), ('Comedy'), ('Drama'), ('Horror');

-- SELECT * FROM Genre;
 

-- Movie Table
-- MovieID	GenreID	DirectorID	RatingID	Title	ReleaseDate
-- 1	1	2	4	Rambo: First Blood	10/22/1982
-- 2	2	NULL	4	Planes, Trains & Automobiles	11/25/1987
-- 3	2	1	2	Ghostbusters	NULL
-- 4	2	NULL	2	The Great Outdoors	6/17/1988

INSERT INTO Movie (GenreID, DirectorID, RatingID, Title, ReleaseDate) VALUES
(1, 2, 4, 'Rambo:First Blood', '1982/10/22'),
(2, NULL, 4, 'Plannes, Trains & Automobiles', '1987/11/25'),
(2, 1, 2, 'Ghost Busters', NULL),
(2, NULL, 2, 'The Great Outdoors', '1988/06/17');


-- SELECT * FROM Movie;
 

-- CastMember Table
-- CastMemberID	ActorID	MovieID	Role
-- 1	5	1	John Rambo
-- 2	4	2	Neil Page
-- 3	3	2	Del Griffith
-- 4	1	3	Dr. Peter Venkman
-- 5	2	3	Dr. Raymond Stanz
-- 6	2	4	Roman Craig
-- 7	3	4	Chet Ripley

INSERT INTO CastMember (ActorID, MovieID, Role) VALUES
(5, 1, "John Rambo"),
(4, 2, "Neil Page"),
(3, 2, "Del Griffith"),
(1, 3, "Dr. Peter Venkman"),
(2, 3, "Dr. Raymond Stanz"),
(2, 4, "Roman Craig"),
(3, 4, "Chet Ripley");

-- SELECT * FROM CastMember;


-- Update Queries
-- Please write the following UPDATE queries:

-- Change the title of Ghostbusters to Ghostbusters (1984) and the release date to 6/8/1984.

UPDATE Movie 
SET 
    Title = 'Ghostbusters (1984)',
    ReleaseDate = '1994/03/04'
WHERE
    Title = 'Ghost Busters';
    
SELECT * FROM Movie;

-- Change the Action genre to Action/Adventure.

UPDATE Genre
SET 
    GenreName = 'Action/Adventure'
WHERE
    GenreName = 'Action';
-- SELECT * FROM Genre;

-- Delete Queries
-- Delete the movie Rambo: First Blood.

DELETE FROM Movie WHERE Title = 'Rambo:First Blood';
-- SELECT * FROM Movie;

-- Altering Tables
-- Alter the Actor table to add a column DateOfDeath. Set John Candy's record to be 3/4/1994.

ALTER TABLE Actor ADD COLUMN DateOfDeath DATE NULL;

UPDATE Actor
SET 
    DateOfDeath = '1994/03/04'
WHERE FirstName = 'John' AND LastName = 'Candy';
-- SELECT * FROM Actor;