CREATE database Campus;
use Campus;
CREATE TABLE Modules (
  ID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Duration INT NOT NULL
);

CREATE TABLE Courses (
  ID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Capacity INT NOT NULL
);

CREATE TABLE Students (
  ID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Shift INT,
  FOREIGN KEY (Shift) REFERENCES Shifts(ID)
);

CREATE TABLE Teachers (
  ID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Skill VARCHAR(255) NOT NULL
);

CREATE TABLE Classrooms (
  ID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Capacity INT NOT NULL
);

CREATE TABLE Shifts (
  ID INT PRIMARY KEY,
  Start_time TIME NOT NULL,
  End_time TIME NOT NULL
);

CREATE TABLE Company (
  ID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
);

CREATE TABLE Roadmap (
  ID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Company_ID INT,
  FOREIGN KEY (Company_ID) REFERENCES Company(ID)
);

CREATE TABLE Module_Course (
  Module_ID INT,
  Course_ID INT,
  PRIMARY KEY (Module_ID, Course_ID),
  FOREIGN KEY (Module_ID) REFERENCES Modules(ID),
  FOREIGN KEY (Course_ID) REFERENCES Courses(ID)
);

CREATE TABLE Student_Course (
  Student_ID INT,
  Course_ID INT,
  PRIMARY KEY (Student_ID, Course_ID),
  FOREIGN KEY (Student_ID) REFERENCES Students(ID),
  FOREIGN KEY (Course_ID) REFERENCES Courses(ID)
);

CREATE TABLE Teacher_Course (
  Teacher_ID INT,
  Course_ID INT,
  PRIMARY KEY (Teacher_ID, Course_ID),
  FOREIGN KEY (Teacher_ID) REFERENCES Teachers(ID),
  FOREIGN KEY (Course_ID) REFERENCES Courses(ID)
);

CREATE TABLE Course_Classroom (
  Course_ID INT,
  Classroom_ID INT,
  PRIMARY KEY (Course_ID, Classroom_ID),
  FOREIGN KEY (Course_ID) REFERENCES Courses(ID),
  FOREIGN KEY (Classroom_ID) REFERENCES Classrooms(ID)
);

INSERT INTO Modules (ID, Name, Duration) VALUES
(1, 'Python Programming', 40),
(2, 'Web Development', 60),
(3, 'Data Science', 80);

INSERT INTO Courses (ID, Name, Capacity) VALUES
(101, 'Introduction to Programming', 30),
(102, 'Advanced Programming', 25),
(103, 'Web Design', 20),
(104, 'Data Analysis', 25);

INSERT INTO Shifts (ID, Start_time, End_time) VALUES
(1, '08:00:00', '16:00:00'),
(2, '16:00:00', '24:00:00'),
(3, '00:00:00', '08:00:00');

SELECT * FROM Shifts;
