create database contact_managment;
use contact_managment;
show tables;

create table company(CompanyId int auto_increment primary key, CompanyName varchar(45), Street varchar(45), City varchar(45), State varchar(2), Zip varchar(10));
INSERT INTO company (CompanyId, CompanyName, Street, City, State, Zip) VALUES
(1, 'Tech Innovators', '123 Innovation Dr', 'San Francisco', 'CA', '94105'),
(2, 'Global Solutions', '456 Market St', 'New York', 'NY', '10001'),
(3, 'Urban Outfitters, Inc.', '789 Elm St', 'Austin', 'TX', '73301'),
(4, 'Green Energy', '101 Greenway Blvd', 'Portland', 'OR', '97204'),
(5, 'Digital Edge', '202 Digital Ln', 'Seattle', 'WA', '98101'),
(6, 'NextGen Systems', '55 Tech Park', 'Boston', 'MA', '02108'),
(7, 'Cloud Networks', '77 Cloud St', 'Chicago', 'IL', '60601'),
(8, 'DataStream Inc.', '89 Data Ave', 'Los Angeles', 'CA', '90001'),
(9, 'AI Dynamics', '120 Future Rd', 'Denver', 'CO', '80202'),
(10, 'Quantum Solutions', '15 Quantum Blvd', 'Miami', 'FL', '33101');

-- Q1
create table contact(ContactId int auto_increment primary key, CompanyId int , foreign key (CompanyId) references company(CompanyId), FirstName varchar(45), LastName varchar(45), Street varchar(45), City varchar(45), State varchar(2), Zip 
varchar(10), IsMain boolean, Email varchar(45), Phone varchar(12));
INSERT INTO contact (CompanyId, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone) VALUES
(1, 'John', 'Doe', '456 Market St', 'San Francisco', 'CA', '94105', TRUE, 'john.doe@techinnovators.com', '415-555-1234'),
(1, 'Jane', 'Smith', '789 Pine St', 'San Francisco', 'CA', '94107', FALSE, 'jane.smith@techinnovators.com', '415-555-5678'),
(2, 'Michael', 'Brown', '12 Broadway', 'New York', 'NY', '10001', TRUE, 'michael.brown@globalsolutions.com', '212-555-7890'),
(2, 'Emily', 'Davis', '34 Wall St', 'New York', 'NY', '10005', FALSE, 'emily.davis@globalsolutions.com', '212-555-2345'),
(3, 'Chris', 'Taylor', '56 Congress Ave', 'Austin', 'TX', '73301', TRUE, 'chris.taylor@brightfuture.com', '512-555-6789'),
(4, 'Anna', 'Wilson', '789 Forest Ln', 'Portland', 'OR', '97204', TRUE, 'anna.wilson@greenenergy.com', '503-555-4567'),
(5, 'David', 'Moore', '1010 Digital Blvd', 'Seattle', 'WA', '98101', TRUE, 'david.moore@digitaledge.com', '206-555-3456'),
(6, 'Sophia', 'White', '44 Tech Park', 'Boston', 'MA', '02108', TRUE, 'sophia.white@nextgensystems.com', '617-555-9012'),
(7, 'Daniel', 'Martinez', '77 Cloud Ave', 'Chicago', 'IL', '60601', TRUE, 'daniel.martinez@cloudnetworks.com', '312-555-5678'),
(8, 'Olivia', 'Garcia', '89 Data Blvd', 'Los Angeles', 'CA', '90001', TRUE, 'olivia.garcia@datastream.com', '323-555-1234');

-- Q2
create table employee(EmployeeId int primary key, FirstName varchar(45), LastName varchar(45), Salary decimal(10,2), HireDate date, JobTitle varchar(25), Email varchar(45), Phone varchar(12));
INSERT INTO employee (EmployeeId, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone) VALUES
(1, 'John', 'Doe', 65000.00, '2015-06-15', 'Software Engineer', 'john.doe@company.com', '555-123-4567'),
(2, 'Jane', 'Smith', 72000.00, '2017-08-22', 'Data Analyst', 'jane.smith@company.com', '555-234-5678'),
(3, 'Michael', 'Johnson', 85000.00, '2013-03-12', 'Project Manager', 'michael.johnson@company.com', '555-345-6789'),
(4, 'Emily', 'Davis', 95000.00, '2019-09-18', 'HR Manager', 'emily.davis@company.com', '555-456-7890'),
(5, 'Lesely', 'Blend', 88000.00, '2016-04-24', 'Business Analyst', 'lesely.blend@company.com', '555-567-8901'),
(6, 'Jack', 'Lee', 79000.00, '2014-11-11', 'Marketing Specialist', 'jack.lee@company.com', '555-678-9012'),
(7, 'David', 'Moore', 63000.00, '2020-02-05', 'Sales Associate', 'david.moore@company.com', '555-789-0123'),
(8, 'Dianne', 'Connor', 73000.00, '2018-07-30', 'Graphic Designer', 'dianne.connor@company.com', '555-890-1234'),
(9, 'Daniel', 'Martinez', 81000.00, '2012-05-21', 'Accountant', 'daniel.martinez@company.com', '555-901-2345'),
(10, 'Olivia', 'Garcia', 92000.00, '2021-10-02', 'Operations Manager', 'olivia.garcia@company.com', '555-012-3456');

-- Q3
create table contactemployee(ContactEmployeeId int auto_increment primary key, ContactId int, foreign key (ContactId) references contact(ContactId), EmployeeId int, foreign key (EmployeeId) references employee(EmployeeId), ContactDate
date, Description varchar(100));
INSERT INTO contactemployee (ContactId, EmployeeId, ContactDate, Description) VALUES
(1, 1, '2022-01-15', 'Discussed software project requirements'),
(2, 3, '2022-02-10', 'Meeting to finalize project plan'),
(3, 5, '2022-03-05', 'Reviewed data analysis results'),
(4, 7, '2022-04-22', 'Presented business analysis'),
(5, 2, '2022-05-17', 'Meeting on marketing strategy'),
(6, 4, '2022-06-12', 'HR policy discussion'),
(7, 6, '2022-07-09', 'Sales presentation for new client'),
(6, 8, '2022-08-03', 'Graphics design update meeting'),
(9, 10, '2022-09-28', 'Operations management strategy meeting'),
(10, 9, '2022-10-20', 'Accounting discussion on annual report');

select * from employee;

-- Q4
update employee set Phone = '215-555-8800' where EmployeeId = 5;

-- Q5
update company set CompanyName = 'Urban Outfitters' where CommpanyId = 3;

-- Q6 
DELETE FROM ContactEmployee
WHERE contactId = (
    SELECT contactId
    FROM Contact
    WHERE FirstName = 'Alice' AND lastname = 'Brown' AND companyId = 1
)
AND Employeeid = (
    SELECT Employeeid
    FROM Employee
    WHERE Firstname = 'John' AND lastname = 'Doe'
);

-- Q7 Instead of toll brothers I have taken john doe
SELECT e.FirstName, e.LastName
FROM contact c
JOIN contactemployee ce ON c.ContactId = ce.ContactId
JOIN employee e ON ce.EmployeeId = e.EmployeeId
WHERE c.CompanyId = (
    SELECT CompanyId 
    FROM company 
    WHERE CompanyName = 'Cloud Networks'
);

-- Q8 What is the significance of “%” and “_” operators in the LIKE statement? 
-- the 	% and _ operators are wilcards in like statment. % represents multiple charecters while _ represent a singlr charecter.

-- Q9 Explain normalization in the context of databases.
-- Normalizaton in context of database means process of organizing data to eliminate duplicacy of data and dividing the data into smaller data sets.

-- Q10 What does a join in MySQL mean?
-- Join in mysql is a finction that allows you to merge two rows from two different tables.

-- Q11 What do you understand about DDL, DCL, and DML in MySQL? 
-- DDL executes functions like create, drop, alter & truncate
-- DML executes functions like Insert, update & delete.
-- DCL executes functions like grant & revoke.

-- Q12 What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
--  Join in mysql is a finction that allows you to merge two rows from two different tables. different joins are - 
-- 1)Inner join
-- 2)Left Join
-- 3)Right Join
-- 4)Full Join
-- 5)Equi Join
-- 6)Self Join