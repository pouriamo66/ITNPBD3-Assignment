/*-----------------------------------------
----------CREATE DATABASE------------------
-------------------------------------------*/
CREATE DATABASE SALE_PRODUCT;

/*------------------------------------------
-----------------CREATE TABLES-------------
-------------------------------------------*/
/*---1. USERS TABLE-----------*/
CREATE TABLE Users
(
U_Id INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(30) NOT NULL,
Address VARCHAR(200) NOT NULL,
Phone VARCHAR(16) NOT NULL,
Email VARCHAR(45)
);


/*-----2.. ITEMS TABLE-----------*/
CREATE TABLE ITEMS
(
I_Id INT PRIMARY KEY,
Item_Type VARCHAR(20) NOT NULL,
Name VARCHAR(30) NOT NULL,
Item_Describption VARCHAR(500),
Quantity INT NOT NULL,
Price DECIMAL(10,2)
);

/*------3. SALE TABLE-----------*/
CREATE TABLE Sales
(
Sale_NO INT AUTO_INCREMENT PRIMARY KEY,
U_ID INT,
ITEM_ID INT,
Quantity INT NOT NULL,
Price DECIMAL(10,2),
Sale_Date DATE NOT NULL,
FOREIGN KEY (U_Id) REFERENCES Users(U_Id),
FOREIGN KEY (I_Id) REFERENCES ITEMS (I_Id)
);

/*--------4. TRANSACTIONS TABLE-----------*/
CREATE TABLE TRANSACTIONS
(
T_No INT AUTO_INCREMENT PRIMARY KEY,
Seller_ID INT,
Buyer_ID INT,
T_Date DATE NOT NULL,
FOREIGN KEY (Seller_ID) REFERENCES Users(U_Id),
FOREIGN KEY (Buyer_ID ) REFERENCES Users(U_Id)
);

/*-------5. ORDER_ITEMS TABLE-----------*/
CREATE TABLE ORDER_ITEMS
(
S_No INT AUTO_INCREMENT PRIMARY KEY,
T_No INT,
I_Id INT,
Quantity INT NOT NULL,
Price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (T_No) REFERENCES TRANSACTIONS(T_No),
FOREIGN KEY (I_Id) REFERENCES ITEMS (I_Id)
);

/*---------6.. MESSAGES TABLE-----------*/
CREATE TABLE MESSAGES
(
M_No INT AUTO_INCREMENT PRIMARY KEY,
T_No INT,
Date_Time DATETIME NOT NULL,
Message VARCHAR(255) NOT NULL,
FOREIGN KEY (T_No) REFERENCES TRANSACTIONS(T_No)
);

/*--------------------------------------------------------
-------------------------INERT DATA ----------------------
----------------------------------------------------------*/
/*---1. USERS TABLE-----------*/
INSERT INTO USERS(Name, Address, Phone, Email) VALUES
('Robin','US','6787678761','Robin123@gmail.com'),
('Kabin','US','6787678762','Kabin123@gmail.com'),
('Raan','US','6787678763','Raan123@gmail.com'),
('Caan','US','6787678764','Caan123@gmail.com'),
('Yoyo','US','6787678765','Yoyo123@gmail.com');


/*-----2. ITEMS TABLE-----------*/
INSERT INTO ITEMS VALUES
(1,'ABC','PEN','',30,9.10),
(2,'YZ','COPY','',30,50.10),
(3,'BNJ','PENT','',30,500.10),
(4,'IJO','CHAIR','',30,1000.10),
(5,'NJM','TOP','',30,1100.10);

/*------3. SALE TABLE-----------*/
INSERT INTO SALE(U_Id, I_Id, Quantity, Price, SALE_DATE) VALUES 
(3,1,4,5.50,'2010-01-01'),
(4,2,4,10.50,'2010-01-01'),
(3,3,4,400.50,'2010-01-01'),
(4,4,4,500.50,'2010-01-01'),
(5,5,4,600.50,'2010-01-01');

/*--------4. TRANSACTIONS TABLE-----------*/
INSERT INTO TRANSACTIONS (U_Id, TRA_DATE) VALUES
(1, '2010-12-01'),
(2, '2010-12-02'),
(1, '2010-12-03'),
(2, '2010-12-04'),
(1, '2010-12-05');

/*-------5. ORDER_ITEMS TABLE-----------*/
INSERT INTO ORDER_ITEMS (T_No, I_Id, Quantity, Price) VALUES
(1,1,10,20.00),
(2,2,10,60.00),
(3,3,10,1000.00),
(4,4,10,1500.00),
(5,5,10,1500.00);

/*---------6. MESSAGES TABLE-----------*/
INSERT INTO MESSAGES (T_No, DATE_TIME, Message) VALUES 
(1, '2010-12-01 23:59:59','GHJK'),
(2, '2010-12-02 23:59:59','DFGH'),
(3, '2010-12-03 23:59:59','FGHJK'),
(4, '2010-12-04 23:59:59','CVBN'),
(5, '2010-12-05 23:59:59','XCVBN');

/*---------------------------------------------------
---------------------QUERIES-------------------------
-----------------------------------------------------*/
/*select the names of the buyer and the
seller of an example item if the item ID is known*/
SELECT u1.Name AS "CUSTOMER NAME", u2.Name AS "SELLER NAME"
FROM USERS u1, USERS u2, ITEMS, SALE, TRANSACTIONS, ORDER_ITEMS
WHERE u1.USER_ID=TRANSACTIONS.U_Id
AND TRANSACTIONS.T_No=ORDER_ITEMS.T_No
AND ITEMS.I_Id=ORDER_ITEMS.I_Id
AND ITEMS.I_Id=SALE.I_Id
AND u2.U_Id=SALE.U_Id
AND ITEMS.I_Id=1;
