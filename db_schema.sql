PRAGMA foreign_keys = ON;

CREATE TABLE BOOKED (
    booking_id INTEGER PRIMARY KEY AUTOINCREMENT,
    Passenger_ssn INTEGER NOT NULL,
    Train_Number INTEGER NOT NULL,
    Ticket_Type TEXT NOT NULL CHECK(Ticket_Type IN ('Premium','General')),
    Status TEXT NOT NULL CHECK(Status IN ('Booked','Waitlist','Cancelled')),
    FOREIGN KEY (Passenger_ssn) REFERENCES PASSENGER(SSN),
    FOREIGN KEY (Train_Number) REFERENCES TRAIN(TrainNumber) 
);

CREATE TABLE PASSENGER (
    SSN INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    address TEXT,
    city TEXT,
    county TEXT,
    phone2 TEXT,
    bdate TEXT
);

CREATE TABLE TRAIN (
    TrainNumber INTEGER PRIMARY KEY,
    TrainName TEXT NOT NULL UNIQUE,
    PremiumFair INTEGER NOT NULL,
    GeneralFair INTEGER NOT NULL,
    SourceStation TEXT NOT NULL,
    DestinationStation TEXT NOT NULL,
    Weekdays TEXT
);

CREATE TABLE TRAIN_STATUS (
    status_id INTEGER PRIMARY KEY AUTOINCREMENT,
    TrainNumber INTEGER NOT NULL,
    TrainDate TEXT NOT NULL,
    PremiumSeatsAvailable INTEGER CHECK(PremiumSeatsAvailable BETWEEN 0 AND 10),
    GenSeatsAvailable INTEGER CHECK(GenSeatsAvailable BETWEEN 0 AND 10),
    PremiumSeatsOccupied INTEGER CHECK(PremiumSeatsOccupied BETWEEN 0 AND 10),
    GenSeatsOccupied INTEGER CHECK(GenSeatsOccupied BETWEEN 0 AND 10),
    FOREIGN KEY (TrainNumber) REFERENCES TRAIN(TrainNumber)
        ON DELETE CASCADE
);