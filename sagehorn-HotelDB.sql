DROP DATABASE IF EXISTS HotelDB;

CREATE DATABASE HotelDB;
USE HotelDB;

CREATE TABLE Amenities(
	AmenitiesId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    HasMicrowave BOOLEAN NOT NULL,
    HasOven BOOLEAN NOT NULL,
    HasJacuzzi BOOLEAN NOT NULL,
    HasRefrigerator BOOLEAN NOT NULL
);

CREATE TABLE Guests(
	GuestId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Address VARCHAR(60) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State VARCHAR(2) NOT NULL,
    ZipCode VARCHAR(5) NOT NULL,
    PhoneNumber VARCHAR(30) NOT NULL
    
);

CREATE TABLE Rooms(
	RoomNumber INT PRIMARY KEY NOT NULL,
    RoomType VARCHAR(20) NOT NULL,
    AmenitiesId INT NOT NULL,
    FOREIGN KEY (AmenitiesId) 
		REFERENCES Amenities(AmenitiesId) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    ADAAccessible BOOLEAN NOT NULL,
    StandardOccupancy INT NOT NULL,
    MaxOccupancy INT NOT NULL,
    BasePrice INT NOT NULL,
    ExtraPersonCost INT NOT NULL
);

CREATE TABLE Reservations(
	ReservationId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    RoomNumber INT NOT NULL,
    FOREIGN KEY (RoomNumber)
		REFERENCES Rooms(RoomNumber)
        ON UPDATE CASCADE 
		ON DELETE CASCADE,
	GuestId INT NOT NULL,
    FOREIGN KEY GuestId(GuestId)
		REFERENCES Guests(GuestId)
        ON UPDATE CASCADE 
		ON DELETE CASCADE,
    Adults INT NOT NULL,
    Children INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);