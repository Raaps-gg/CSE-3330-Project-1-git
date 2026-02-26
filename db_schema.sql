CREATE TABLE BOOKED(
    Passenger_ssn INT PRIMARY KEY,
    Train_Number TINYINT,
    Ticket_Type VARCHAR(),
    Status VARCHAR()
)

CREATE TABLE PASSENGER(
    first_name VARCHAR(),
    last_name VARCHAR(),
    address VARCHAR(),
    city VARCHAR(),
    county VARCHAR(),
    phone2 VARCHAR(),
    SSN INT PRIMARY KEY,
    bdate DATE
)

CREATE TABLE TRAIN(
    TrainNumber INT PRIMARY KEY, 
    TrainName VARCHAR(),
    PremiumFair SMALLINT, 
    GeneralFair SMALLINT, 
    SourceStation VARCHAR(), 
    DestinationStation VARCHAR(), 
    Weekdays VARCHAR()
)

CREATE TABLE TRAIN_STATUS(
    TrainDate DATE, 
    TrainName DATE, 
    PremiumSeatsAvailable, 
    GenSeatsAvailable, 
    PremiumSeatsOccupied, 
    GenSeatsOccupied
)