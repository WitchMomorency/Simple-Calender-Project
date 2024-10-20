CREATE DATABASE simple_cal;

USE simple_cal;

CREATE TABLE Accounts (
    acc_id INT PRIMARY KEY,
    username VARCHAR(50),
    password_hash VARCHAR(256)
);

CREATE TABLE Schedules (
    sch_id INT PRIMARY KEY,
    title VARCHAR(100),
    date_time DATETIME,
    start_time DATETIME,
    end_time DATETIME,
    notes TEXT,
    acc_id INT,
    FOREIGN KEY (acc_id) REFERENCES Accounts(acc_id)
);

CREATE TABLE Reminders (
    rem_id INT PRIMARY KEY,
    interval_mins INT,
    urgency VARCHAR(50),
    sch_id INT,
    FOREIGN KEY (sch_id) REFERENCES Schedules(sch_id)
);


-- Insert into Accounts
INSERT INTO Accounts (acc_id, username, password_hash) VALUES (1, 'Budi', '95d055f7df6323239f8ac55cfa5fe41911f6a5d5ca42c583f22249adfb21e5c2');
INSERT INTO Accounts (acc_id, username, password_hash) VALUES (2, 'Andi', '310fe2213b816faa65a0e905c30727542875896f9c07fc5f21afe77e660b3979');

-- Insert into Schedules
INSERT INTO Schedules (sch_id, title, date_time, start_time, end_time, notes, acc_id) 
VALUES (1, 'Meeting', '2024-10-20 09:00:00', '2024-10-20 09:00:00', '2024-10-20 10:00:00', 'Team meeting', 1);

INSERT INTO Schedules (sch_id, title, date_time, start_time, end_time, notes, acc_id) 
VALUES (2, 'Workshop', '2024-10-21 14:00:00', '2024-10-21 14:00:00', '2024-10-21 16:00:00', 'Programming workshop', 2);

-- Insert into Reminders
INSERT INTO Reminders (rem_id, interval_mins, urgency, sch_id) 
VALUES (1, 15, 'High', 1);


-- Select all data from Accounts
SELECT * FROM Accounts;

-- Select all schedules and their corresponding account details
SELECT Schedules.*, Accounts.username 
FROM Schedules 
JOIN Accounts ON Schedules.acc_id = Accounts.acc_id;

-- Select all reminders and their corresponding schedule details
SELECT Reminders.*, Schedules.title 
FROM Reminders 
JOIN Schedules ON Reminders.sch_id = Schedules.sch_id;