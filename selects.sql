--Given a passenger’s last name and first name and retrieve all trains they are booked on.
SELECT b.Train_Number AS TrainNumber, t.TrainName AS TrainName
FROM BOOKED AS b, PASSENGER AS p, TRAIN AS t
WHERE b.Passenger_ssn = p.SSN
  AND b.Train_Number = t.TrainNumber
  AND p.first_name = 'James'
  AND p.last_name = 'Butt';

--Given a day list the passengers traveling on that day with confirmed tickets. 
SELECT CONCAT(p.first_name," ",p.last_name) AS Name,b.Ticket_Type AS TicketType, t.TrainName AS TrainName
FROM BOOKED AS b, PASSENGER AS p, TRAIN_STATUS AS ts, TRAIN AS t
WHERE b.Passenger_ssn = p.SSN
  AND b.Train_Number = t.TrainNumber
  AND t.TrainNumber = ts.TrainNumber
  AND ts.TrainDate = 'Sunday'
  AND b.Status = 'Booked';

--Display the train information (Train Number, Train Name, Source and Destination) and passenger information 
--(Name, Address, Category, ticket status) of passengers who are between the ages of 50 to 60. 
SELECT t.TrainNumber AS TrainNumber, t.TrainName AS TrainName,
       t.SourceStation AS Source, t.DestinationStation AS Destination,
       CONCAT(p.first_name," ",p.last_name) AS Name,
       CONCAT(p.address,", ",p.county,", ",p.city) AS Address, b.Ticket_Type AS TicketType, b.Status AS TicketStatus, p.bdate
FROM PASSENGER AS p, BOOKED AS b, TRAIN AS t
WHERE b.Passenger_ssn = p.SSN
  AND b.Train_Number = t.TrainNumber
  AND CAST(substr(p.bdate,-2,2) AS INTEGER) BETWEEN 66 AND 76;

--List train name, day and number of passenger on that train. 
SELECT t.TrainName AS TrainName,
       ts.TrainDate AS Day,
       (SELECT COUNT(*)
        FROM BOOKED b
        WHERE b.Train_Number = t.TrainNumber) AS NumPassengers
FROM TRAIN t, TRAIN_STATUS ts
WHERE t.TrainNumber = ts.TrainNumber;

--Enter a train name and retrieve all the passengers with confirmed status traveling on that train.
SELECT CONCAT(p.first_name," ",p.last_name) AS Name, b.Ticket_Type AS Category, b.Status AS TicketStatus
FROM PASSENGER AS p, BOOKED AS b, TRAIN AS t
WHERE b.Passenger_ssn = p.SSN
  AND b.Train_Number = t.TrainNumber
  AND t.TrainName = 'Golden Chariot'
  AND b.Status = 'Booked';

--List passengers that are waitlisted including the name of the train.
SELECT CONCAT(p.first_name," ",p.last_name) AS Name, t.TrainName AS TrainName
FROM PASSENGER AS p, BOOKED AS b, TRAIN AS t
WHERE b.Passenger_ssn = p.SSN
  AND b.Train_Number = t.TrainNumber
  AND b.Status = 'Waitlist';

--List passenger names in descending order that have '605' phone area code.
SELECT CONCAT(p.first_name," ",p.last_name) AS Name
FROM PASSENGER AS p
WHERE p.phone2 LIKE '605%'
ORDER BY Name DESC;

--List name of passengers that are traveling on Thursdays in ascending order.
SELECT CONCAT(p.first_name," ",p.last_name) AS Name
FROM PASSENGER AS p, BOOKED AS b, TRAIN AS t
WHERE b.Passenger_ssn = p.SSN
  AND b.Train_Number = t.TrainNumber
  AND t.Weekdays LIKE '%Thursday%'
ORDER BY Name ASC;