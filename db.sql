DROP DATABASE IF EXISTS MovieCatalogue;

CREATE DATABASE MovieCatalogue;


USE MovieCatalogue;


CREATE TABLE IF NOT EXISTS Genre (
	GenreID int not null auto_increment,
	GenreName varchar(30) not null,
    PRIMARY KEY (GenreID)
);

CREATE TABLE IF NOT EXISTS Rating (
	RatingID int not null auto_increment,
	RatingName varchar(5) not null,
    PRIMARY KEY (RatingID)
);

CREATE TABLE IF NOT EXISTS Director (
	DirectorID int not null auto_increment,
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	BirthDate date null,
    PRIMARY KEY (DirectorID)
);

CREATE TABLE IF NOT EXISTS Actor (
	ActorID  int not null auto_increment,
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	BirthDate date null,
    PRIMARY KEY (ActorID)
);

CREATE TABLE IF NOT EXISTS Movie (
	MovieID int not null auto_increment,
	GenreID int not null,
	DirectorID int null,
	RatingID int null,
	Title varchar(128) not null,
	ReleaseDate date null,
    PRIMARY KEY (MovieID)
);


ALTER TABLE Movie
 ADD CONSTRAINT fk_MovieGenre FOREIGN KEY (GenreID) REFERENCES Genre
(GenreID) ON DELETE CASCADE;
ALTER TABLE Movie
 ADD CONSTRAINT fk_MovieDirector FOREIGN KEY (DirectorID) REFERENCES Director
(DirectorID) ON DELETE CASCADE;
ALTER TABLE Movie
 ADD CONSTRAINT fk_MovieRating FOREIGN KEY (RatingID) REFERENCES Rating
(RatingID) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS CastMember (
	CastMemberID int not null auto_increment,
	ActorID int not null,
	MovieID int not null,
	Role varchar(50) not null,
    PRIMARY KEY (CastMemberID)
);

ALTER TABLE CastMember
 ADD CONSTRAINT fkCastMemberActor FOREIGN KEY (ActorID) REFERENCES Actor
(ActorID) ON DELETE CASCADE;


ALTER TABLE CastMember
 ADD CONSTRAINT fkCastMemberMovie FOREIGN KEY (MovieID) REFERENCES Movie
(MovieID) ON DELETE CASCADE;

INSERT INTO Actor (FirstName, LastName, BirthDate)
VALUES ('Bill', 'Murray', '1950/09/21'),
('Dan', 'Aykroyd', '1952/07/01'),
('John', 'Candy', '1950/10/31'),
('Steve', 'Martin', NULL),
('Sylvester', 'Stallone', NULL);

INSERT INTO Director (FirstName, LastName, BirthDate)
VALUES ('Ivan', 'Reitman', '1946/10/27'),
('Ted', 'Kotcheff', NULL);

INSERT INTO Rating (RatingName)
VALUES ('G'), ('PG'), ('PG-13'), ('R');

INSERT INTO Genre (GenreName)
VALUES ('Action'), ('Comedy'), ('Drama'), ('Horror');

INSERT INTO Movie (GenreID, DirectorID, RatingID, Title, ReleaseDate) VALUES
(1, 2, 4, 'Rambo:First Blood', '1982/10/22'),
(2, NULL, 4, 'Plannes, Trains & Automobiles', '1987/11/25'),
(2, 1, 2, 'Ghost Busters', NULL),
(2, NULL, 2, 'The Great Outdoors', '1988/06/17');

INSERT INTO CastMember (ActorID, MovieID, Role) VALUES
(5, 1, "John Rambo"),
(4, 2, "Neil Page"),
(3, 2, "Del Griffith"),
(1, 3, "Dr. Peter Venkman"),
(2, 3, "Dr. Raymond Stanz"),
(2, 4, "Roman Craig"),
(3, 4, "Chet Ripley");

UPDATE Movie 
SET 
    Title = 'Ghostbusters (1984)',
    ReleaseDate = '1994/03/04'
WHERE
    Title = 'Ghost Busters';
    
UPDATE Genre
SET 
    GenreName = 'Action/Adventure'
WHERE
    GenreName = 'Action';
    
DELETE FROM Movie WHERE Title = 'Rambo:First Blood';

ALTER TABLE Actor ADD COLUMN DateOfDeath DATE NULL;

UPDATE Actor
SET 
    DateOfDeath = '1994/03/04'
WHERE FirstName = 'John' AND LastName = 'Candy';

