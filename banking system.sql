
-- ==========================================
-- BANKING SYSTEM DATABASE PROJECT
-- ==========================================

-- 1. CREATE DATABASE
DROP DATABASE IF EXISTS BANKINGSYSTEMDB;

CREATE DATABASE BANKINGSYSTEMDB;

USE BANKINGSYSTEMDB;
-- ==========================================
-- BANKING SYSTEM DATABASE PROJECT
-- ==========================================

-- 1. CREATE DATABASE
DROP DATABASE IF EXISTS BANKINGSYSTEMDB;

CREATE DATABASE BANKINGSYSTEMDB;

USE BANKINGSYSTEMDB;


-- ==========================================
-- 2. CREATE CUSTOMERS TABLE
-- ==========================================

CREATE TABLE CUSTOMERS (
    CUSTOMERID INT,
    FIRSTNAME VARCHAR(50),
    LASTNAME VARCHAR(50),
    EMAIL VARCHAR(100),
    PHONE VARCHAR(20),
    BIRTHDATE DATE,
    PRIMARY KEY (CUSTOMERID)
);

DESCRIBE CUSTOMERS;

SELECT * FROM CUSTOMERS;


-- ==========================================
-- 3. CREATE BRANCHES TABLE
-- ==========================================

CREATE TABLE BRANCHES (
    BRANCHID INT,
    BRANCHNAME VARCHAR(100),
    BRANCHADDRESS VARCHAR(255),
    BRANCHPHONE VARCHAR(20),
    PRIMARY KEY (BRANCHID)
);

DESCRIBE BRANCHES;

SELECT * FROM BRANCHES;


-- ==========================================
-- 4. CREATE ACCOUNTS TABLE
-- ==========================================

CREATE TABLE ACCOUNTS (
    ACCOUNTID INT,
    ACCOUNTTYPE VARCHAR(20),
    BALANCE DECIMAL(10,2),
    CUSTOMERID INT,
    BRANCHID INT,
    PRIMARY KEY (ACCOUNTID),

    CONSTRAINT FK_CUSTOMER
    FOREIGN KEY (CUSTOMERID)
    REFERENCES CUSTOMERS(CUSTOMERID),

    CONSTRAINT FK_BRANCH
    FOREIGN KEY (BRANCHID)
    REFERENCES BRANCHES(BRANCHID)
);

DESCRIBE ACCOUNTS;

SELECT * FROM ACCOUNTS;


-- ==========================================
-- 5. CREATE TRANSACTIONS TABLE
-- ==========================================

CREATE TABLE TRANSACTIONS (
    TRANSACTIONID INT,
    TRANSACTIONDATE DATE,
    AMOUNT DECIMAL(10,2),
    TRANSACTIONTYPE VARCHAR(20),
    ACCOUNTID INT,
    PRIMARY KEY (TRANSACTIONID),

    CONSTRAINT FK_ACCOUNT
    FOREIGN KEY (ACCOUNTID)
    REFERENCES ACCOUNTS(ACCOUNTID)
);

DESCRIBE TRANSACTIONS;

SELECT * FROM TRANSACTIONS;


-- ==========================================
-- 6. CREATE LOANS TABLE
-- ==========================================

CREATE TABLE LOANS (
    LOANID INT,
    LOANAMOUNT DECIMAL(10,2),
    INTERESTRATE DECIMAL(5,2),
    STARTDATE DATE,
    ENDDATE DATE,
    CUSTOMERID INT,
    PRIMARY KEY (LOANID),

    CONSTRAINT FK_LOAN_CUSTOMER
    FOREIGN KEY (CUSTOMERID)
    REFERENCES CUSTOMERS(CUSTOMERID)
);

DESCRIBE LOANS;

SELECT * FROM LOANS;


-- ==========================================
-- 7. SHOW ALL TABLES
-- ==========================================

SHOW TABLES;


-- ==========================================
-- 8. INSERT CUSTOMERS RECORDS
-- ==========================================

INSERT INTO CUSTOMERS
(CUSTOMERID, FIRSTNAME, LASTNAME, EMAIL, PHONE, BIRTHDATE)
VALUES
(101,'Rahul','Sharma','rahul.sharma@gmail.com','9767983712','1995-04-12'),
(102,'Veena','Kutty','veena.kutty@gmail.com','1234567890','1997-09-10'),
(103,'Dominic','Dom','dominic.dom@gmail.com',NULL,'1996-06-03'),
(104,'Alex',NULL,'alex@gmail.com','3232323232','2000-12-12'),
(105,'Alice','George',NULL,'9090909090','2003-08-10');

SELECT * FROM CUSTOMERS;


-- ==========================================
-- 9. INSERT BRANCHES RECORDS
-- ==========================================

INSERT INTO BRANCHES
(BRANCHID, BRANCHNAME, BRANCHADDRESS, BRANCHPHONE)
VALUES
(1,'Mumbai Main Branch','Andheri East, Mumbai','0220100201'),
(2,'Pune Central Branch','Shivaji Nagar, Pune','0220100202'),
(3,'Bangalore Branch','MG Road, Bangalore','0880100801'),
(4,'Delhi Branch','Connaught Place, Delhi',NULL),
(5,'Hyderabad Branch',NULL,'0440100401');

SELECT * FROM BRANCHES;


-- ==========================================
-- 10. INSERT ACCOUNTS RECORDS
-- ==========================================

INSERT INTO ACCOUNTS
(ACCOUNTID, ACCOUNTTYPE, BALANCE, CUSTOMERID, BRANCHID)
VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',85000.50,102,2),
(1003,'Savings',12500.75,103,1),
(1004,'Salary',45000,104,3),
(1005,'Savings',7800.25,105,2),
(1006,'Savings',42000,101,2),
(1007,'Current',NULL,103,3),
(1008,'Savings',27500,105,4);

SELECT * FROM ACCOUNTS;


-- ==========================================
-- 11. INSERT TRANSACTIONS RECORDS
-- ==========================================

INSERT INTO TRANSACTIONS
(TRANSACTIONID, TRANSACTIONDATE, AMOUNT, TRANSACTIONTYPE, ACCOUNTID)
VALUES
(5001,'2026-01-05',10000,'Deposit',1001),
(5002,'2026-01-10',2500,'Withdrawal',1001),
(5003,'2026-01-15',5000,'Transfer',1002),
(5004,'2026-01-20',15000,'Deposit',1003),
(5005,'2026-01-25',3000,'Withdrawal',1004),
(5006,'2026-02-02',7500,'Deposit',1005),
(5007,'2026-02-05',1200,'Payment',1006),
(5008,'2026-02-10',NULL,'Deposit',1007),
(5009,'2026-02-15',8500,'Withdrawal',1008),
(5010,NULL,100,'Payment',1003),
(5011,'2026-02-20',20000,'Transfer',1006),
(5012,'2026-03-01',5000,'Deposit',1002),
(5013,'2026-03-05',10000,'Withdrawal',1007),
(5014,'2026-03-15',1500,'Deposit',1008),
(5015,'2026-03-20',25000,'Transfer',1005);

SELECT * FROM TRANSACTIONS;


-- ==========================================
-- 12. INSERT LOANS RECORDS
-- ==========================================

INSERT INTO LOANS
(LOANID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE, CUSTOMERID)
VALUES
(9001,500000,8.50,'2025-01-15','2030-01-15',101),
(9002,250000,9.25,'2025-03-10','2028-03-10',103),
(9003,NULL,9.00,'2026-03-01',NULL,105),
(9004,750000,7.90,'2024-06-20','2031-06-20',102),
(9005,1000000,7.25,'2024-11-15','2034-11-15',104),
(9006,300000,10.50,'2025-07-01','2029-07-01',101);

SELECT * FROM LOANS;


-- ==========================================
-- 13. CHECKING ALL TABLE DATA
-- ==========================================

SELECT * FROM CUSTOMERS;

SELECT * FROM BRANCHES;

SELECT * FROM ACCOUNTS;

SELECT * FROM TRANSACTIONS;

SELECT * FROM LOANS;


-- ==========================================
-- 14. UPDATE RECORDS
-- ==========================================

-- Update customer phone number

UPDATE CUSTOMERS
SET PHONE = '4588452371'
WHERE CUSTOMERID = 103;


-- Update account balance

UPDATE ACCOUNTS
SET BALANCE = 35750
WHERE ACCOUNTID = 1007;


-- Update transaction account ID
-- Example: Change transaction 5013 to account 1003

UPDATE TRANSACTIONS
SET ACCOUNTID = 1003
WHERE TRANSACTIONID = 5013;


-- Check updated records

SELECT * FROM CUSTOMERS;

SELECT * FROM ACCOUNTS;

SELECT * FROM TRANSACTIONS;


-- ==========================================
-- 15. DELETE RECORDS
-- ==========================================

DELETE FROM TRANSACTIONS
WHERE TRANSACTIONID = 5008;


-- Verify deleted record

SELECT * FROM TRANSACTIONS;


-- ==========================================
-- 16. FINAL DATABASE VERIFICATION
-- ==========================================

SHOW TABLES;

DESCRIBE CUSTOMERS;

DESCRIBE BRANCHES;

DESCRIBE ACCOUNTS;

DESCRIBE TRANSACTIONS;

DESCRIBE LOANS;

Select *
From CUSTOMERS
WHERE CUSTOMERID = 105; -- CALLING SPECIFIC DATA 

Select *
FROM CUSTOMERS
WHERE CUSTOMERID = 102 OR CUSTOMERID = 104; -- CALLING MULTIPLE ID's

SELECT * -- CALLING DATA IN RANGE 
FROM CUSTOMERS; 
WHERE BIRTHDATE >= '1995-01-01' AND BIRTHDATE <= '2000-12-31';

-- CUSTOMER ANALYSIS 
-- HOW MANY COUSTOMERS ARE THERE?

SELECT COUNT(*) AS TOTAL_COUSTOMER
FROM COUSTOMERS;

SELECT COUSTOMERID, FIRSTNAME AS NAME 
FROM CUSTOMERS
WHERE LASTNAME IS NULL OR EMAIL IS NULL;

-- WHO ARE THE YOUNGEST/OLDEST CUSTOMERS?
SELECT MAX(BIRTHDATE) AS YONGEST_CUSTOMER,
MIN(BIRTHDATE) AS OLDEST_CUSTOMER
FROM CUSTOMERS;

-- HOW MANY CUSTOMERS WERE BORN BEFORE/AFTER A PARTICULAR YEAR?
SELECT * 
FROM CUSTOMERS 
WHERE YEAR(BIRTHDATE) <=2000;

SELECT * 
FROM CUSTOMERS
WHERE YEAR(BIRTHDATE) >=2000;

-- which customers have multiple accounts? 
select customerid, count(*) as total_account
from accounts
GROUP BY customerid
HAVING total_account >1 ;

-- account analysis

-- how many savings, current and salary accounts exist?

select accounttype,count(*) as total_accounts 
from accounts
group  by accounttype;

-- what is the total balance?

select sum(balance) total_balance
from accounts;

-- what is the average account balance?
select avg(balance) total_average
from accounts;

-- which customers have the highest balances?

select customerid, balance highest_balance
from accounts 
order by balance desc limit 1;


-- ==========================================
-- 2. CREATE CUSTOMERS TABLE
-- ==========================================

CREATE TABLE CUSTOMERS (
    CUSTOMERID INT,
    FIRSTNAME VARCHAR(50),
    LASTNAME VARCHAR(50),
    EMAIL VARCHAR(100),
    PHONE VARCHAR(20),
    BIRTHDATE DATE,
    PRIMARY KEY (CUSTOMERID)
);

DESCRIBE CUSTOMERS;

SELECT * FROM CUSTOMERS;


-- ==========================================
-- 3. CREATE BRANCHES TABLE
-- ==========================================

CREATE TABLE BRANCHES (
    BRANCHID INT,
    BRANCHNAME VARCHAR(100),
    BRANCHADDRESS VARCHAR(255),
    BRANCHPHONE VARCHAR(20),
    PRIMARY KEY (BRANCHID)
);

DESCRIBE BRANCHES;

SELECT * FROM BRANCHES;


-- ==========================================
-- 4. CREATE ACCOUNTS TABLE
-- ==========================================

CREATE TABLE ACCOUNTS (
    ACCOUNTID INT,
    ACCOUNTTYPE VARCHAR(20),
    BALANCE DECIMAL(10,2),
    CUSTOMERID INT,
    BRANCHID INT,
    PRIMARY KEY (ACCOUNTID),

    CONSTRAINT FK_CUSTOMER
    FOREIGN KEY (CUSTOMERID)
    REFERENCES CUSTOMERS(CUSTOMERID),

    CONSTRAINT FK_BRANCH
    FOREIGN KEY (BRANCHID)
    REFERENCES BRANCHES(BRANCHID)
);

DESCRIBE ACCOUNTS;

SELECT * FROM ACCOUNTS;


-- ==========================================
-- 5. CREATE TRANSACTIONS TABLE
-- ==========================================

CREATE TABLE TRANSACTIONS (
    TRANSACTIONID INT,
    TRANSACTIONDATE DATE,
    AMOUNT DECIMAL(10,2),
    TRANSACTIONTYPE VARCHAR(20),
    ACCOUNTID INT,
    PRIMARY KEY (TRANSACTIONID),

    CONSTRAINT FK_ACCOUNT
    FOREIGN KEY (ACCOUNTID)
    REFERENCES ACCOUNTS(ACCOUNTID)
);

DESCRIBE TRANSACTIONS;

SELECT * FROM TRANSACTIONS;


-- ==========================================
-- 6. CREATE LOANS TABLE
-- ==========================================

CREATE TABLE LOANS (
    LOANID INT,
    LOANAMOUNT DECIMAL(10,2),
    INTERESTRATE DECIMAL(5,2),
    STARTDATE DATE,
    ENDDATE DATE,
    CUSTOMERID INT,
    PRIMARY KEY (LOANID),

    CONSTRAINT FK_LOAN_CUSTOMER
    FOREIGN KEY (CUSTOMERID)
    REFERENCES CUSTOMERS(CUSTOMERID)
);

DESCRIBE LOANS;

SELECT * FROM LOANS;


-- ==========================================
-- 7. SHOW ALL TABLES
-- ==========================================

SHOW TABLES;


-- ==========================================
-- 8. INSERT CUSTOMERS RECORDS
-- ==========================================

INSERT INTO CUSTOMERS
(CUSTOMERID, FIRSTNAME, LASTNAME, EMAIL, PHONE, BIRTHDATE)
VALUES
(101,'Rahul','Sharma','rahul.sharma@gmail.com','9767983712','1995-04-12'),
(102,'Veena','Kutty','veena.kutty@gmail.com','1234567890','1997-09-10'),
(103,'Dominic','Dom','dominic.dom@gmail.com',NULL,'1996-06-03'),
(104,'Alex',NULL,'alex@gmail.com','3232323232','2000-12-12'),
(105,'Alice','George',NULL,'9090909090','2003-08-10');

SELECT * FROM CUSTOMERS;


-- ==========================================
-- 9. INSERT BRANCHES RECORDS
-- ==========================================

INSERT INTO BRANCHES
(BRANCHID, BRANCHNAME, BRANCHADDRESS, BRANCHPHONE)
VALUES
(1,'Mumbai Main Branch','Andheri East, Mumbai','0220100201'),
(2,'Pune Central Branch','Shivaji Nagar, Pune','0220100202'),
(3,'Bangalore Branch','MG Road, Bangalore','0880100801'),
(4,'Delhi Branch','Connaught Place, Delhi',NULL),
(5,'Hyderabad Branch',NULL,'0440100401');

SELECT * FROM BRANCHES;


-- ==========================================
-- 10. INSERT ACCOUNTS RECORDS
-- ==========================================

INSERT INTO ACCOUNTS
(ACCOUNTID, ACCOUNTTYPE, BALANCE, CUSTOMERID, BRANCHID)
VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',85000.50,102,2),
(1003,'Savings',12500.75,103,1),
(1004,'Salary',45000,104,3),
(1005,'Savings',7800.25,105,2),
(1006,'Savings',42000,101,2),
(1007,'Current',NULL,103,3),
(1008,'Savings',27500,105,4);

SELECT * FROM ACCOUNTS;


-- ==========================================
-- 11. INSERT TRANSACTIONS RECORDS
-- ==========================================

INSERT INTO TRANSACTIONS
(TRANSACTIONID, TRANSACTIONDATE, AMOUNT, TRANSACTIONTYPE, ACCOUNTID)
VALUES
(5001,'2026-01-05',10000,'Deposit',1001),
(5002,'2026-01-10',2500,'Withdrawal',1001),
(5003,'2026-01-15',5000,'Transfer',1002),
(5004,'2026-01-20',15000,'Deposit',1003),
(5005,'2026-01-25',3000,'Withdrawal',1004),
(5006,'2026-02-02',7500,'Deposit',1005),
(5007,'2026-02-05',1200,'Payment',1006),
(5008,'2026-02-10',NULL,'Deposit',1007),
(5009,'2026-02-15',8500,'Withdrawal',1008),
(5010,NULL,100,'Payment',1003),
(5011,'2026-02-20',20000,'Transfer',1006),
(5012,'2026-03-01',5000,'Deposit',1002),
(5013,'2026-03-05',10000,'Withdrawal',1007),
(5014,'2026-03-15',1500,'Deposit',1008),
(5015,'2026-03-20',25000,'Transfer',1005);

SELECT * FROM TRANSACTIONS;


-- ==========================================
-- 12. INSERT LOANS RECORDS
-- ==========================================

INSERT INTO LOANS
(LOANID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE, CUSTOMERID)
VALUES
(9001,500000,8.50,'2025-01-15','2030-01-15',101),
(9002,250000,9.25,'2025-03-10','2028-03-10',103),
(9003,NULL,9.00,'2026-03-01',NULL,105),
(9004,750000,7.90,'2024-06-20','2031-06-20',102),
(9005,1000000,7.25,'2024-11-15','2034-11-15',104),
(9006,300000,10.50,'2025-07-01','2029-07-01',101);

SELECT * FROM LOANS;


-- ==========================================
-- 13. CHECKING ALL TABLE DATA
-- ==========================================

SELECT * FROM CUSTOMERS;

SELECT * FROM BRANCHES;

SELECT * FROM ACCOUNTS;

SELECT * FROM TRANSACTIONS;

SELECT * FROM LOANS;


-- ==========================================
-- 14. UPDATE RECORDS
-- ==========================================

-- Update customer phone number

UPDATE CUSTOMERS
SET PHONE = '4588452371'
WHERE CUSTOMERID = 103;


-- Update account balance

UPDATE ACCOUNTS
SET BALANCE = 35750
WHERE ACCOUNTID = 1007;


-- Update transaction account ID
-- Example: Change transaction 5013 to account 1003

UPDATE TRANSACTIONS
SET ACCOUNTID = 1003
WHERE TRANSACTIONID = 5013;


-- Check updated records

SELECT * FROM CUSTOMERS;

SELECT * FROM ACCOUNTS;

SELECT * FROM TRANSACTIONS;


-- ==========================================
-- 15. DELETE RECORDS
-- ==========================================

DELETE FROM TRANSACTIONS
WHERE TRANSACTIONID = 5008;


-- Verify deleted record

SELECT * FROM TRANSACTIONS;


-- ==========================================
-- 16. FINAL DATABASE VERIFICATION
-- ==========================================

SHOW TABLES;

DESCRIBE CUSTOMERS;

DESCRIBE BRANCHES;

DESCRIBE ACCOUNTS;

DESCRIBE TRANSACTIONS;

DESCRIBE LOANS;

Select *
From CUSTOMERS
WHERE CUSTOMERID = 105; -- CALLING SPECIFIC DATA 

Select *
FROM CUSTOMERS
WHERE CUSTOMERID = 102 OR CUSTOMERID = 104; -- CALLING MULTIPLE ID's

SELECT * -- CALLING DATA IN RANGE 
FROM CUSTOMERS; 
WHERE BIRTHDATE >= '1995-01-01' AND BIRTHDATE <= '2000-12-31';

-- CUSTOMER ANALYSIS 
-- HOW MANY COUSTOMERS ARE THERE?

SELECT COUNT(*) AS TOTAL_COUSTOMER
FROM COUSTOMERS;

SELECT COUSTOMERID, FIRSTNAME AS NAME 
FROM CUSTOMERS
WHERE LASTNAME IS NULL OR EMAIL IS NULL;

-- WHO ARE THE YOUNGEST/OLDEST CUSTOMERS?
SELECT MAX(BIRTHDATE) AS YONGEST_CUSTOMER,
MIN(BIRTHDATE) AS OLDEST_CUSTOMER
FROM CUSTOMERS;

-- HOW MANY CUSTOMERS WERE BORN BEFORE/AFTER A PARTICULAR YEAR?
SELECT * 
FROM CUSTOMERS 
WHERE YEAR(BIRTHDATE) <=2000;

SELECT * 
FROM CUSTOMERS
WHERE YEAR(BIRTHDATE) >=2000;

-- which customers have multiple accounts? 
select customerid, count(*) as total_account
from accounts
GROUP BY customerid
HAVING total_account >1 ;

-- account analysis

-- how many savings, current and salary accounts exist?

select accounttype,count(*) as total_accounts 
from accounts
group  by accounttype;

-- what is the total balance?

select sum(balance) total_balance
from accounts;

-- what is the average account balance?
select avg(balance) total_average
from accounts;

-- which customers have the highest balances?

select customerid, balance highest_balance
from accounts 
order by balance desc limit 1;

-- which accounts have null balance?

select *
from accounts
where balance=null;

-- which branch manages the most accounts?

select branchid,count(*) total_accounts
from accounts 
group by branchid 
order by total_accounts desc limit 1;

-- transaction analysis

-- what is the total transaction amount?
select sum(amount) total_transaction_amount
from transactions;

-- how many deposits/withdrawals/transfers are there?

select * from customers;

select transactiontype, count(*) total_transactions
from transactions
where transactiontype in ('deposit','withdrawal','transfer')
group by transactiontype;

-- which transaction type has the highest vloume?

select transactiontype,sum(amount) as total_amount -- as ek naya column 
from transactions
group by transactiontype
order by total_amount desc  limit 1;

-- which account has the highest transaction activity? 

select accountid, count(*) as transaction
from transactions 
group by accountid 
order by transaction desc limit 1;

-- what is the average transaction amount?
select avg(amount) as avg_amount 
from transactions;

-- which transactions have missing dates/amounts?
select *
from transactions 
where transactiondate is null or amount is null;

-- loan analysis

-- what is the total loan amount?
select sum(loanamount)as total_loans
from loans;

-- which customer has the largest loan?
select customerid, sum(loanamount) as total_loans
from loans
group by customerid
order by total_loans desc limit 1;

-- which loan has the highest interest rate?
select max(interestrate)as highest_interestrate 
from loans;

-- which loans are still active?
select *
from loans;

select * 
from loans where enddate>='2026-11-17';

select * 
from loans 
where enddate>= now();

-- which customers have multiple loans?
select customerid, count(*) total_loans
from loans
group by customerid
having total_loans>1;

-- what is the average loan amount?
select avg(loanamount) as avaerage_loan_amount
from loans;

-- branch analysis 

-- which branch has the most coustomers/accounts ?

-- branch with most accounts 

select branchid,count(*) as total_accounts
from accounts
group by branchid
order by total_accounts desc limit 1;

-- branch with most customers

select branchid,count(customerid) as total_customers 
from accounts
group by branchid
order by total_customers desc limit 1;

