/*Create the database*/
CREATE DATABASE[TimeTableGenerator]
GO

/*Use the database*/
USE [TimeTableGenerator]
GO

/*Tables for the database*/

CREATE TABLE Gender(
	GenderID int IDENTITY (1,1) PRIMARY KEY NOT NULL,)
GO

CREATE TABLE Lecturer(
	LecturerID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Firstname varchar(50) NOT NULL,
	Surname varchar(50) NOT NULL,
	BirthDay datetime NOT NULL,
	DateOfEmployment datetime NOT NULL,
	Address varchar(50) NOT NULL,
	Username varchar(25) NOT NULL,
	LecturerPassword varchar(25) NOT NULL,
	GenderID int FOREIGN KEY REFERENCES Gender(GenderID))
GO

CREATE TABLE Venue(
	VenueID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
	SpecialFacilities varchar(50) NOT NULL,
	StudentCapacity int NOT NULL)
GO

CREATE TABLE Program(
	ProgramID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	CourseID varchar(10) NOT NULL,
	SubjectID varchar(10) NOT NULL,
	SubjectDuration varchar(10) NOT NULL,
	SpecialRequirments varchar(10) NOT NULL,			/*//remove///specail association table// program id, special facil*/
	LecurerID int FOREIGN KEY REFERENCES Lecturer(LecturerID))
GO

/*Gender Stored Procedures*/

CREATE PROCEDURE GetGender
	@GenderID int
AS
	SELECT * FROM dbo.Gender
	WHERE Gender.GenderID = @GenderID
GO

CREATE PROCEDURE InsertGender
	@GenderID int
AS
	INSERT INTO dbo.Gender(
		GenderID)
	VALUES
		(@GenderID)
GO
	
CREATE PROCEDURE UpdateGender
	@GenderID int
AS
	UPDATE dbo.Gender
	SET
	GenderID=@GenderID
	WHERE GenderID=@GenderID
GO

CREATE PROCEDURE DeleteGender
	@GenderID int
 AS
	DELETE FROM dbo.Gender
	WHERE GenderID=@GenderID
GO


/*Lecturer Stored Procedures*/

CREATE PROCEDURE GetLecturer
	@LecutererID int
AS
	SELECT * FROM dbo.Lecturer
	WHERE Lecturer.LecturerID = @LecutererID
GO

CREATE PROCEDURE InsertLecturer
	@LecturerID int,
	@Firstname varchar(50),
	@Surname varchar(50),
	@GenderID int,
	@Birthday datetime,
	@DateOfEmployment datetime,
	@Address varchar(50),
	@Username varchar(25),
	@LecturerPassword varchar(25)
AS
	INSERT INTO dbo.Lecturer(
		LecturerID,
		Firstname,
		Surname,
		Gender,
		BirthDay,
		DateOfEmployment,
		Address,
		Username,
		LecturerPassword)
	VALUES
		(@LecturerID, @Firstname, @Surname, @GenderID, @Birthday, @DateOfEmployment, @Address, @Username, @LecturerPassword)
GO

CREATE PROCEDURE UpdateLecturer
	@LecturerID int,
	@Firtname varchar(50),
	@Surname varchar(50),
	@GenderID int,
	@Birthday datetime,
	@DateOfEmployment datetime,
	@Address varchar(50),
	@Username varchar(25),
	@LecturerPassword varchar(25)
AS
	UPDATE dbo.Lecturer
	SET
		Firstname=@Firtname,
		Surname=@Surname,
		Gender=@GenderID,
		BirthDay=@Birthday,
		DateOfEmployment=@DateOfEmployment,
		Address=@Address,
		Username=@Username,
		LecturerPassword=@LecturerPassword
	WHERE LecturerID=@LecturerID
GO

CREATE PROCEDURE DeleteLecturer
	@LecturerID int
AS
	DELETE FROM dbo.Lecturer
	WHERE LecturerID=@LecturerID
GO
	
/*Venue Stored Procedures*/

CREATE PROCEDURE GetVenue
	@VenueID int
AS
	SELECT * FROM dbo.Venue
	WHERE Venue.VenueID = @VenueID
GO

CREATE PROCEDURE InsertVenue
	@VenueID int,
	@SpecialFacilities varchar(50),
	@StudentCapacity int

AS
	INSERT INTO dbo.Venue(
		VenueID,
		SpecialFacilities,
		StudentCapacity)
	VALUES
		(@VenueID, @SpecialFacilities, @StudentCapacity)
GO

CREATE PROCEDURE UpdateVenue
	@VenueID int,
	@SpecialFacilities varchar(50),
	@StudentCapacity int
AS
	UPDATE dbo.Venue
	SET
		SpecialFacilities=@SpecialFacilities,
		StudentCapacity=@StudentCapacity
	WHERE VenueID=@VenueID
GO

CREATE PROCEDURE DeleteVenue
	@VenueID int
AS
	DELETE FROM dbo.Venue
	WHERE VenueID=@VenueID
GO
	

/* Program Stored Procedures*/

CREATE PROCEDURE GetProgram
	@ProgramID int
AS
	SELECT * FROM dbo.Program
	WHERE Program.ProgramID = @ProgramID
GO

CREATE PROCEDURE InsertProgram
	@ProgramID INT,
	@CourseID varchar(10),
	@SubjectID varchar(10),
	@SubjectDuration varchar(10),
	@SpecialRequirments varchar(10),
	@LecurerID int

AS
	INSERT INTO dbo.Program(
		ProgramID,
		CourseID,
		SubjectID,
		SubjectDuration,
		SpecialRequirments,
		LecurerID)
	VALUES
		(@ProgramID, @CourseID, @SubjectID, @SubjectDuration, @SpecialRequirments, @LecurerID)
GO

CREATE PROCEDURE UpdateProgram
	@CourseID varchar(10),
	@SubjectID varchar(10),
	@SubjectDuration varchar(10),
	@SpecialRequirments varchar(10),
	@LecurerID int
AS
	UPDATE dbo.Program
	SET
		CourseID=@CourseID,
		SubjectID=@SubjectID,
		SubjectDuration=@SubjectDuration,
		SpecialRequirments=@SpecialRequirments
	WHERE CourseID=@CourseID
GO

CREATE PROCEDURE DeleteProgram
	@ProgramID int
AS
	DELETE FROM dbo.Program
	WHERE ProgramID=@ProgramID
GO