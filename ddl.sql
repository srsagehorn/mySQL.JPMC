-- The database should keep track of movies we are interested in. Create a .sql script file to create a database named MovieCatalogue that contains the following tables:

-- Movie
-- MovieID - Primary key, Identity
-- GenreID - Foreign key, Genre table, Required
-- DirectorID - Foreign key, Director table, Not required
-- RatingID - Foreign key, Rating table, Not required
-- Title - Required, Extended character set, Length: 128
-- ReleaseDate - Not required
-- Genre
-- GenreID - Primary key, Identity
-- GenreName - Required, Extended character set, Length: 30
-- Directo
-- DirectorID - Primary key, Identity
-- FirstName - Required, Extended character set, Length: 30
-- LastName - Required, Extended character set, Length: 30
-- BirthDate - Not required
-- Rating
-- RatingID - Primary key, Identity
-- RatingName - Required, Standard character set, Length: 5
-- Actor
-- ActorID - Primary key, Identity
-- FirstName - Required, Extended character set, Length: 30
-- LastName - Required, Extended character set, Length: 30
-- BirthDate - Not required
-- CastMembers
-- CastMemberID - Primary key, Identity
-- ActorID - Foreign key, Actor table, Required
-- MovieID - Foreign key, Movie table, Required
-- Role - Required, Extended character set, Length: 50

DROP DATABASE IF EXISTS MovieCatalogue;

CREATE DATABASE MovieCatalogue;
USE MovieCatalogue;

CREATE TABLE Genre (
	GenreId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    GenreName VARCHAR(30) NOT NULL
);
CREATE TABLE Director (
	DirectorId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
    BirthDate DATE NULL
);
CREATE TABLE Rating (
	RatingId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    RatingName VARCHAR(5) NOT NULL
);
CREATE TABLE Actor (
	ActorId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
    BirthDate DATE NULL
    );
CREATE TABLE Movie (
	MovieId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CONSTRAINT GenreId FOREIGN KEY (GenreId) REFERENCES Genre(GenreId) ON UPDATE CASCADE,
    CONSTRAINT DirectorId FOREIGN KEY (DirectorId) REFERENCES Director(DirectorId) ON UPDATE CASCADE,
    CONSTRAINT RatingId FOREIGN KEY (RatingId) REFERENCES Rating(RatingId) ON UPDATE CASCADE,
--     FOREIGN KEY (GenreId) REFERENCES Genre(GenreId) ON UPDATE CASCADE,  
--     FOREIGN KEY (DirectorId) REFERENCES Director(DirectorId) ON  UPDATE CASCADE, 
--     FOREIGN KEY (RatingId) REFERENCES Rating(RatingId) ON  UPDATE CASCADE, 
    Title VARCHAR(128),
    ReleaseDate DATE
);
CREATE TABLE CastMembers (
	CastMemberId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CONSTRAINT ActorId FOREIGN KEY (ActorId) REFERENCES Actor(ActorId) ON UPDATE CASCADE,
    FOREIGN KEY ActorId(ActorId) REFERENCES Actor(ActorId) ON DELETE SET NULL ,
    FOREIGN KEY MovieId(MovieId) REFERENCES Movie(MovieId) ON DELETE SET NULL ,
    Role VARCHAR(50) NOT NULL);