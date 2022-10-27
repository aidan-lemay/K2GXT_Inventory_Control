DROP DATABASE IF EXISTS k2_inventory;
CREATE DATABASE IF NOT EXISTS k2_inventory;
USE k2_inventory;

CREATE USER IF NOT EXISTS 'k2_control'@'localhost' IDENTIFIED BY 'K2GXT@2019';
GRANT SELECT, UPDATE, CREATE, INSERT ON database.table TO 'k2_control'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS UserTypes (
    userType INT NOT NULL,
    userDef VARCHAR(255) NOT NULL,
    PRIMARY KEY (userType)
);

CREATE TABLE IF NOT EXISTS Users (
    UID INT NOT NULL,
    userType INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    meetingCount INT NOT NULL DEFAULT 0,
    PRIMARY KEY (UID),
    FOREIGN KEY (userType) REFERENCES UserTypes(userType)
);

CREATE TABLE IF NOT EXISTS StatusCodes (
    statusCode INT NOT NULL,
    statusDef VARCHAR(255) NOT NULL,
    PRIMARY KEY (statusCode)
);

CREATE TABLE IF NOT EXISTS Inventory (
    barcode INT NOT NULL,
    serialNo VARCHAR(255) NOT NULL,
    statusCode INT NOT NULL,
    checked BOOL NOT NULL DEFAULT False,
    dueDate DATETIME DEFAULT NULL,
    borrower INT DEFAULT NULL,
    PRIMARY KEY (barcode),
    FOREIGN KEY (borrower) REFERENCES Users(UID),
    FOREIGN KEY (statusCode) REFERENCES StatusCodes(statusCode)
);

-- UserTypes Table Insert
INSERT INTO UserTypes (userType, userDef) VALUES (1, "Admin");
INSERT INTO UserTypes (userType, userDef) VALUES (2, "General Member");

-- Users Table Insert
INSERT INTO Users (UID, userType, name, email, meetingCount) VALUES (123456, 1, "John Doe", "testAdmin@rit.edu", 12);
INSERT INTO Users (UID, userType, name, email, meetingCount) VALUES (789101, 2, "James Doe", "testMember@rit.edu", 12);

-- StatusCodes Table Insert
-- 100 Codes

INSERT INTO StatusCodes (statusCode, statusDef) VALUES (111, "Available, General Member Access, In-Service");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (112, "Available, General Member Access, Needs Repair / Damaged");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (113, "Available, General Member Access, Retired");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (114, "Available, General Member Access, Missing");

INSERT INTO StatusCodes (statusCode, statusDef) VALUES (121, "Available, Needs Admin Approval, In-Service");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (122, "Available, Needs Admin Approval, Needs Repair / Damaged");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (123, "Available, Needs Admin Approval, Retired");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (124, "Available, Needs Admin Approval, Missing");

INSERT INTO StatusCodes (statusCode, statusDef) VALUES (131, "Available, Admin Checkout Only, In-Service");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (132, "Available, Admin Checkout Only, Needs Repair / Damaged");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (133, "Available, Admin Checkout Only, Retired");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (134, "Available, Admin Checkout Only, Missing");

INSERT INTO StatusCodes (statusCode, statusDef) VALUES (141, "Available, Unavailable for Borrow / Fixture, In-Service");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (142, "Available, Unavailable for Borrow / Fixture, Needs Repair / Damaged");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (143, "Available, Unavailable for Borrow / Fixture, Retired");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (144, "Available, Unavailable for Borrow / Fixture, Missing");

-- 200 Codes

INSERT INTO StatusCodes (statusCode, statusDef) VALUES (211, "Unavailable, General Member Access, In-Service");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (212, "Unavailable, General Member Access, Needs Repair / Damaged");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (213, "Unavailable, General Member Access, Retired");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (214, "Unavailable, General Member Access, Missing");

INSERT INTO StatusCodes (statusCode, statusDef) VALUES (221, "Unavailable, Needs Admin Approval, In-Service");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (222, "Unavailable, Needs Admin Approval, Needs Repair / Damaged");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (223, "Unavailable, Needs Admin Approval, Retired");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (224, "Unavailable, Needs Admin Approval, Missing");

INSERT INTO StatusCodes (statusCode, statusDef) VALUES (231, "Unavailable, Admin Checkout Only, In-Service");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (232, "Unavailable, Admin Checkout Only, Needs Repair / Damaged");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (233, "Unavailable, Admin Checkout Only, Retired");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (234, "Unavailable, Admin Checkout Only, Missing");

INSERT INTO StatusCodes (statusCode, statusDef) VALUES (241, "Unavailable, Unavailable for Borrow / Fixture, In-Service");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (242, "Unavailable, Unavailable for Borrow / Fixture, Needs Repair / Damaged");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (243, "Unavailable, Unavailable for Borrow / Fixture, Retired");
INSERT INTO StatusCodes (statusCode, statusDef) VALUES (244, "Unavailable, Unavailable for Borrow / Fixture, Missing");

-- Inventory Table Insert
INSERT INTO Inventory (barcode, serialNo, statusCode, checked, dueDate, borrower) VALUES (159415189, "18d5a1ds561a65", 111, False, NULL, NULL);
INSERT INTO Inventory (barcode, serialNo, statusCode, checked, dueDate, borrower) VALUES (151579815, "4a8r4389wg14d8", 211, True, "2023-01-01 10:10:10", 123456);