create database travels_services;
use travels_services;

-- USER table
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(20),
    lname VARCHAR(20),
    email VARCHAR(30),
    password VARCHAR(30),
    contact_number CHAR(10)
);


-- TRAVEL AGENCY table
CREATE TABLE travel_agency (
    agency_id CHAR(5) PRIMARY KEY,
    agency_name VARCHAR(30),
    location VARCHAR(30),
    email VARCHAR(30),
    contact_number CHAR(10)
);

INSERT INTO travel_agency (agency_id, agency_name, location, email, contact_number)
VALUES 
('BEN56', 'Global Tours and Travels', 'Bengaluru', 'golbaltours@yahoo.com', '9804999557'),
('BEN59', 'VRS Tours and Travels', 'Bengaluru', 'vrs@yahoo.com', '9515927239'),
('HYD45', 'Yatra.com', 'Hyderabad', 'yatra@yahoo.com', '9158125736'),
('KOD44', 'Kaveri Tours', 'Kodagu', 'kaveritours@yahoo.com', '9837425667'),
('NEW37', 'MakeMyTrip.com', 'New Delhi', 'makemytrip@yahoo.com', '8492018694');


-- BUS table
CREATE TABLE bus (
    bus_number CHAR(6) PRIMARY KEY,
    source VARCHAR(20),
    departure_time TIME,
    destination VARCHAR(20),
    arrival_time TIME,
    duration TIME GENERATED ALWAYS AS (TIMEDIFF(arrival_time, departure_time)) VIRTUAL,
    fare INT,
    agency_id CHAR(5),
    seats_available INT,
    FOREIGN KEY (agency_id) REFERENCES travel_agency(agency_id)
);

INSERT INTO bus (bus_number, source, departure_time, destination, arrival_time, fare, agency_id, seats_available)
VALUES 
('BEN601', 'Hyderabad', '08:00:00', 'Mysore', '16:30:00', 570, 'BEN56', 40),
('BEN632', 'Bengaluru', '01:00:00', 'Mysore', '12:00:00', 545, 'BEN56', 30),
('HYD573', 'Hyderabad', '09:30:00', 'Mysore', '16:45:00', 775, 'HYD45', 36),
('KOD672', 'Kodagu', '08:00:00', 'Bengaluru', '14:00:00', 450, 'KOD44', 38),
('NEW354', 'New Delhi', '05:00:00', 'Ahmedabad', '23:30:00', 1250, 'NEW37', 30),
('NEW418', 'New Delhi', '05:00:00', 'Ahmedabad', '23:30:00', 1050, 'NEW37', 32);


-- TOURS table
CREATE TABLE tours (
    tour_id CHAR(6) PRIMARY KEY,
    source VARCHAR(30),
    description TEXT,
    images VARCHAR(50),
    no_of_days INT,
    no_of_nights INT,
    price INT,
    seats_available INT,
    start_date DATE
);

INSERT INTO tours (tour_id, source, description, images, no_of_days, no_of_nights, price, seats_available, start_date)
VALUES
('TOU001', 'Tirupathi', 'A trip to the holy place of Tirupathi and Tirumala. Darshana included.', 'tirupathi.jpg', 3, 2, 2579, 21, '2020-12-24'),
('TOU002', 'Goa', 'Weekend Break in Goa. The organizers come with service assurance packages for exclusive assistance.', 'goa.jpg', 5, 6, 5680, 16, '2020-12-27'),
('TOU003', 'Ooty', 'Situated in the state of Tamil Nadu, Ooty stands approximately 7300 feet above sea level. Enjoy your holidays in the sky!!', 'ooty.jpg', 3, 4, 5320, 18, '2021-01-15');


-- TOUR_LOCATIONS table
CREATE TABLE tour_locations (
    tour_id CHAR(6),
    locations VARCHAR(30),
    PRIMARY KEY (tour_id, locations),
    FOREIGN KEY (tour_id) REFERENCES tours(tour_id)
);

INSERT INTO tour_locations (tour_id, locations)
VALUES
('TOU001', 'Tirupathi'),
('TOU001', 'Tirumala'),
('TOU002', 'Goa'),
('TOU003', 'Ooty');


-- TICKETS table
CREATE TABLE tickets (
    ticket_id CHAR(8) PRIMARY KEY,
    user_id INT,
    date_of_booking DATE,
    bus_number CHAR(6),
    tour_id CHAR(6),
    no_of_people INT,
    total_price INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (bus_number) REFERENCES bus(bus_number),
    FOREIGN KEY (tour_id) REFERENCES tours(tour_id)
);
select * from user;
select * from travel_agency;
select * from bus;
select * from tours;
select * from tour_locations;

