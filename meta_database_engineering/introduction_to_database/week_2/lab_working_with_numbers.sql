-- Scenario
-- Mr. Carl Merkel owns a business named CM Mobiles.
-- He wants to create a database to store key information about mobile devices. 
-- The information includes:
--  The device ID or number,
--  The device name,
--  The price of the device
CREATE DATABASE cm_devices;
USE cm_devices;

CREATE TABLE devices (
    `Device ID` INT PRIMARY KEY,
    `Device name` VARCHAR(50) NOT NULL,
    `Price` DECIMAL(7,2)
);
SHOW TABLES;
SHOW COLUMNS FROM devices;

CREATE TABLE stocks (
    `Stock ID` INT PRIMARY KEY,
    `Device ID` INT,
    `Quantity` INT NOT NULL,
    `Total price` DECIMAL(7,2),
    FOREIGN KEY (`Device ID`) REFERENCES devices(`Device ID`)
);

DELIMITER //
CREATE PROCEDURE UpdateTotalPrice()
BEGIN 
    UPDATE stocks
    SET `Total price` = `Quantity` * (
        SELECT Price
        FROM devices
        WHERE `Device ID` = stocks.`Device ID`
        );
END //
DELIMITER ;
CALL UpdateTotalPrice();