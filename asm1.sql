USE master
GO
IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'Attendance'
)
CREATE DATABASE Attendance;
GO

USE Attendance;
GO

IF OBJECT_ID(N'Users', N'U') is NULL
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Username VARCHAR(100) NULL,
    Password INT NULL,
    Role VARCHAR(50) NULL,
    Gender VARCHAR(50) NULL,
    Phone INT NULL,
    FirstName VARCHAR(100) NULL,
    LastName VARCHAR(100) NULL,
    DateOfBirth DATE NULL
);
GO

IF OBJECT_ID(N'Courses', N'U') is NULL
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY NOT NULL,
    TeacherID INT NULL,
    CourseName VARCHAR(50) NULL,
    StartDay DATE NULL,
    EndDay DATE NULL,
	FOREIGN KEY (TeacherID) REFERENCES Users(UserID)
);
GO

IF OBJECT_ID(N'Attendance', N'U') is NULL
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY NOT NULL,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Date DATE,
    Status VARCHAR(10),
	ClassID INT NOT NULL,
	Note VARCHAR(50),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
	FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
	FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

GO
IF OBJECT_ID(N'Enrollment', N'U') is NULL
CREATE TABLE Enrollment (
	EnrollmentID INT PRIMARY KEY NOT NULL,
    StudentID INT NOT NULL, -- Foreign Key
    CourseID INT NOT NULL, -- Foreign Key
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
	FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);
GO

IF OBJECT_ID(N'Class', N'U') is NULL
CREATE TABLE Class (
    ClassID INT PRIMARY KEY NOT NULL,
    ClassName VARCHAR(50) NULL,
    Schedule DATE NULL,
);
GO