-- Table 1: Clients
CREATE TABLE Clients (
    ClientCode INT PRIMARY KEY,
    Surname_CL NVARCHAR(50),
	NAME_CL VARCHAR (30),
	OTCH_CL VARCHAR (30),
    BirthYear DATE,
    ExitPermission CHAR(3) CHECK (ExitPermission IN ('Да', 'Нет')),
    PassportNumber INT,
    TripPurpose NVARCHAR(20) CHECK (TripPurpose IN('отдых' , 'работа'))
);


-- Table 3: Trips
CREATE TABLE Trips (
    TripCode INT PRIMARY KEY not null ,
    ClientCode INT FOREIGN KEY  REFERENCES Clients(ClientCode) ON DELETE CASCADE,
    StartDate DATE,
    NumberOfDays INT,
    VisaCost MONEY,
    TransportCost MONEY,
    DailyStayCost MONEY,
);
-- Table 2: Routes
CREATE TABLE Routes (
    RouteCode INT PRIMARY KEY ,
    StartDate DATE,
    NumberOfDays INT,
    TripCode INT  FOREIGN KEY REFERENCES Trips (TripCode) ON DELETE CASCADE,
    DestinationCountry NVARCHAR(MAX),
    Treatment CHAR(3) CHECK (Treatment IN ('Да', 'Нет')), --Лечение
    Excursions CHAR(3) CHECK (Excursions IN ('Да', 'Нет')), --Питание
    Meals CHAR(3) CHECK (Meals IN ('Да', 'Нет')), --Питание
);