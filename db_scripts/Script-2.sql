CREATE database minAmbiente,
use minAmbiente

CREATE TABLE Department (
    ID_Department INT PRIMARY KEY,
    Name_Department VARCHAR(255) NOT NULL
);

CREATE TABLE Entity_Responsible (
    ID_Entity_Responsible INT PRIMARY KEY,
    Name_Entity VARCHAR(255) NOT NULL
);

CREATE TABLE Park_Natural (
    ID_Park_Natural INT PRIMARY KEY,
    Name_Park VARCHAR(255) NOT NULL,
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Department(ID_Department)
);

CREATE TABLE Area (
    ID_Area INT PRIMARY KEY,
    Name_Area VARCHAR(255) NOT NULL,
    Park_Natural_ID INT NOT NULL,
    FOREIGN KEY (Park_Natural_ID) REFERENCES Park_Natural(ID_Park_Natural)
);

CREATE TABLE Species (
    ID_Species INT PRIMARY KEY,
    Scientific_Name VARCHAR(255) NOT NULL,
    Common_Name VARCHAR(255) NOT NULL,
    Inventory_Number_Individuals INT NOT NULL,
    Area_ID INT NOT NULL,
    FOREIGN KEY (Area_ID) REFERENCES Area(ID_Area)
);

CREATE TABLE Staff (
    ID_Staff INT PRIMARY KEY,
    Full_Name VARCHAR(255) NOT NULL,
    Staff_Type ENUM('Management_Staff', 'Surveillance_Staff', 'Conservation_Staff', 'Research_Staff') NOT NULL,
    Park_Natural_ID INT NOT NULL,
    FOREIGN KEY (Park_Natural_ID) REFERENCES Park_Natural(ID_Park_Natural)
);

CREATE TABLE Research_Project (
    ID_Project INT PRIMARY KEY,
    Project_Name VARCHAR(255) NOT NULL,
    Budget DECIMAL(10,2) NOT NULL,
    Implementation_Period VARCHAR(255) NOT NULL,
    Research_Staff_ID INT NOT NULL,
    FOREIGN KEY (Research_Staff_ID) REFERENCES Staff(ID_Staff)
);

CREATE TABLE Visitor (
    ID_Visitor INT PRIMARY KEY,
    Full_Name VARCHAR(255) NOT NULL,
    Accommodation_ID INT NOT NULL,
    FOREIGN KEY (Accommodation_ID) REFERENCES Accommodation(ID_Accommodation)
);

CREATE TABLE Accommodation (
    ID_Accommodation INT PRIMARY KEY,
    Accommodation_Type ENUM('Camping', 'Refuge', 'Hotel') NOT NULL,
    Park_Natural_ID INT NOT NULL,
    FOREIGN KEY (Park_Natural_ID) REFERENCES Park_Natural(ID_Park_Natural)
);

CREATE TABLE Department_Entity_Responsible (
    Department_ID INT NOT NULL,
    Entity_Responsible_ID INT NOT NULL,
    PRIMARY KEY (Department_ID, Entity_Responsible_ID),
    FOREIGN KEY (Department_ID) REFERENCES Department(ID_Department),
    FOREIGN KEY (Entity_Responsible_ID) REFERENCES Entity_Responsible(ID_Entity_Responsible)
);

CREATE TABLE Park_Natural_Department (
    Park_Natural_ID INT NOT NULL,
    Department_ID INT NOT NULL,
    PRIMARY KEY (Park_Natural_ID, Department_ID),
    FOREIGN KEY (Park_Natural_ID) REFERENCES Park_Natural(ID_Park_Natural),
    FOREIGN KEY (Department_ID) REFERENCES Department(ID_Department)
);
