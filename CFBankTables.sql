CREATE DATABASE if not exists CFBank;

USE CFBank;

CREATE TABLE Customer (Customer_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, Cust_First_Name VARCHAR(45) NOT NULL, Cust_Last_Name VARCHAR(45) NOT NULL, 
							Address VARCHAR(255) NOT NULL, City VARCHAR(45) NOT NULL, State CHAR(2) NOT NULL, Zipcode INT NOT NULL, Email_Address VARCHAR(255) NULL, Cell_Phone_Number VARCHAR(13) NOT NULL);

CREATE TABLE Accounts (Account_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, Account_Number VARCHAR(20) NOT NULL, 
						Balance DECIMAL(15,2) NOT NULL, Customer_ID INT NOT NULL, Category CHAR(10) NOT NULL, 
                        FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Branch (Branch_ID VARCHAR(3) NOT NULL PRIMARY KEY, Branch_Name CHAR(7) NOT NULL, 
							Address VARCHAR(45) NOT NULL, City VARCHAR(15) NOT NULL, State CHAR(2) NOT NULL, Zipcode INT NOT NULL, Office_Number VARCHAR(12) NOT NULL);
                            
CREATE TABLE Loan (Loan_Number VARCHAR(20) NOT NULL PRIMARY KEY, Amount INT NOT NULL, Customer_ID INT NOT NULL, Branch_ID VARCHAR(3) NOT NULL, 
							FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE, 
							FOREIGN KEY (Branch_ID) REFERENCES Branch (Branch_ID) ON DELETE CASCADE ON UPDATE CASCADE); 
                            
CREATE TABLE LoanPayments (Loan_Number VARCHAR(20) NOT NULL, Payment_Date DATE NOT NULL, Payment_Number INT NOT NULL, Payment_Amount DECIMAL(6,2) NOT NULL,
							FOREIGN KEY (Loan_Number) REFERENCES Loan (Loan_Number) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Banker (Banker_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, First_Name VARCHAR(45) NOT NULL, Last_Name VARCHAR(45) NOT NULL, 
							Email_Address VARCHAR(45) NOT NULL, Customer_ID INT NOT NULL, Branch_ID VARCHAR(3) NOT NULL, 
                            FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE, 
                            FOREIGN KEY (Branch_ID) REFERENCES Branch (Branch_ID) ON DELETE CASCADE ON UPDATE CASCADE);
                            
CREATE TABLE Checking (Account_Number VARCHAR(19) NOT NULL, Over_Draft_Fee INT NOT NULL, Account_ID INT NOT NULL, 
							FOREIGN KEY (Account_ID) REFERENCES Accounts (Account_ID) ON DELETE CASCADE ON UPDATE CASCADE);
                            
CREATE TABLE Savings (Account_Number VARCHAR(19) NOT NULL, Interest_Rate DECIMAL(5,4) NOT NULL, Account_ID INT NOT NULL, 
                            FOREIGN KEY (Account_ID) REFERENCES Accounts (Account_ID) ON DELETE CASCADE ON UPDATE CASCADE);
                            
INSERT INTO Customer (Cust_First_Name, Cust_Last_Name, Address, City, State, Zipcode, Email_Address, Cell_Phone_Number)
     VALUES('Eric', 'Carrtman', '210 East 10th st', 'South Park', 'CO', '80440', 'mj@yahoo.com', '719-362-5886'),
					('Kenny', 'McCormick', '220 East 10th st', 'South Park', 'CO', '80440', 'kcc@gmail.com', '719-855-9632'),
					('Kyle', 'Broflosky', '230 East 10th St', 'Sount Park', 'CO', '80440', 'kb@gmail.com', '719-369-2544'),
					('Stan', 'Marsh', '200 East 10th St', 'South Park', 'CO', '80440', 'sm@yahoo.com', '719-477-8955'),
					('Token', 'Black', '175 E Spring St', 'South Park', 'CO', '80440', 'tb@yahoo.com', '719-655-9877'),
					('Wendy', 'Testaburger', '236 E Spring St', 'South Park', 'CO', '80440', 'wt@gmail.com', '719-125-4566'),
					('Peter', 'Griffen', '10 River St', 'Yonkers', 'NY', '10701', 'pg@outlook.com', '914-445-2111'),
					('Meg', 'Griffen', '10 River St', 'Yonkers', 'NY', '10701', 'mg@outlook.com', '914-586-3347'),
					('Linda', 'Belcher', '10 West Palm Beach', 'Miami', 'FL', '33132', 'lb@aol.com', '305-999-0122'),
					('Galye', 'Frond', '2550 West Palm Beach', 'Miami', 'FL', '33132', '' , '786-789-4561'),
					('Bart', 'Simpson', '1500 Broadway', 'Yonkers', 'NY', '10702', 'bb@gmail.com', '718-584-6933'),
					('Lisa', 'Simpson', '1500 Broadway', 'Yonkers', 'NY', '10702', 'jazzlife@gmail.com', '917-684-6003'),
					('Tami', 'Larson', '1500 Halaliva', 'Miami', 'FL', '33132', 'tami1@gmail.com', '305-184-6933'),
					('Dr', 'Yap', '2590 West Palm Beach', 'Miami', 'FL', '33132', 'yaptrap@aol.com', '786-254-6322'),
					('Mickey', 'Slammer', '1500 Long View', 'Miami', 'FL', '33402', 'robbank@aol.com', '786-104-9822'),
					('Kim', 'Possible', '10 Maple Drive', 'Santa Monica', 'CA', '90211', 'kimp@gmail.com', '973-774-1022'),
					('Ron', 'Ton', '1470 Maple Drive', 'Santa Monica', 'CA', '90211', 'ronton@gmail.com', '973-810-7802'),
					('Ron', 'Jeremy', '10 Maple Drive', 'Santa Monica', 'CA', '90211', 'ronjery@gmail.com', '973-580-3655'),
					('Dr', 'Evil', '10 Maple Drive', 'Santa Monica', 'CA', '90211', 'evildr@gmail.com', '973-810-7802')
                    ;  
                    
 INSERT INTO Accounts (Account_Number, Balance, Customer_ID, Category)
	VALUES ('9104-3652-1244-3666', '5000', '1', 'Checking'),
					('9104-3652-1244-3670', '10000', '1', 'Saving'),
					('9104-3652-1244-3667', '400', '2', 'Checking'),
					('9105-0366-9855-6214', '500', '3', 'Checking'),
					('9104-3652-1244-3672', '15000', '3', 'Saving'),
					('9106-1566-1423-3698', '300', '4', 'Checking'),
					('9110-1234-5678-0909', ' 6000', '5', 'Checking'),
					('9111-4578-3695-5430', '12500', '9', 'Saving'),
					('9111-4578-3695-5419', '900.5', '10', 'Checking'),
					('9110-1234-5678-0911', '250000', '7', 'Checking'),
					('9111-4578-3695-5422', '200', '8', 'Checking'),
					('9111-4578-3695-5418', '1500', '8', 'Saving'),
					('9001-1478-2536-9031', '450000', '13', 'Checking'),
					('9002-5846-2513-5845', '15', '13', 'Saving'),
					('9002-5846-2513-5033', '15.35', '10', 'Saving'),
					('9111-4578-3695-5417', '800', '9', 'Checking'),
					('9111-4578-3695-5412', '1000', '12', 'Checking'),
					('9111-4578-3695-5413', '250', '11', 'Saving'),
					('9111-4578-3695-5414', '8000', '6', 'Checking')
					;
				
INSERT INTO Branch (Branch_ID, Branch_Name, Address, City, State, Zipcode, Office_Number)
    VALUES ('CA1', 'CF Bank', '10 River', 'Santa Monica', 'CA', '90201', '973-258-5866'),
					('CO1', 'CF Bank', '1500 alma Junction', 'South Park', 'CO', '80040', '719-658-0000'),
					('MI1', 'CF Bank', '10 West Palm beach', 'Miami', 'FL', '33132', '305-444-4477'),
					('NY1', 'CF Bank', '30 Broadway', 'New York', 'NY', '10003', '914-358-4755'),
					('NY2', 'CF Bank', '100 River Ave', 'Yonkers', 'NY', '10701', '718-333-5000')
					;

INSERT INTO Banker (First_Name, Last_Name, Email_Address, Customer_ID, Branch_ID)
    VALUES ('Francine', 'Smith', 'fs@cfbank.com', 9, 'NY1'), 
					('Stan', 'Smith', 'ss@cfbank.com', 1, 'CO1'),
					('Avery', 'Bullock', 'av@cfbank.com', 8, 'NY2'), 
					('Klaus', 'Helser', 'kh@cfbank.com', 5, 'NY1'), 
					('Homer', 'Simpson', 'hs@cfbank.com', 2, 'CO1'), 
					('Ned', 'Flanders', 'nf@cfbank.com', 3, 'CO1'), 
					('Louis', 'Belcher', 'lb@cfbank.com', 7, 'MI1'), 
					('Andy', 'Pesto', 'ap@cfbank.com', 10, 'MI1'), 
					('Timmy', 'Tim', 'tt@cfbank.com', 4, 'CO1'), 
					('Crusty', 'Clown', 'cc@cfbank.com', 6,'NY1')
					;

INSERT INTO Loan (Loan_Number, Amount, Customer_ID, Branch_ID)
    VALUES ('191-250-456-331-2100', 25000, 7, 'MI1'), 
					('191-250-456-331-4446', 5000,7, 'MI1'), 
					('191-458-459-331-2102', 100000, 9, 'NY2'), 
					('191-458-459-321-0112', 1500, 4, 'CO1'), 
					('191-458-459-321-6899', 5000, 8, 'NY2'), 
					('191-458-459-621-4569', 1000, 3, 'CO1'), 
					('191-458-459-721-1000', 15000, 2, 'CO1'), 
					('191-458-459-999-6900', 5000, 10, 'NY2'), 
					('456-191-457-400-5555', 45000, 10, 'MI1'), 
					('456-191-457-401-7777', 1000000, 1, 'CO1')
					;

INSERT INTO LoanPayments (Loan_Number, Payment_Date, Payment_Number, Payment_Amount)
    VALUES ('191-250-456-331-2100', '2018-04-15', '123', '175'), 
					('191-250-456-331-4446', '2018-04-15', '124', '100.5'),
					('191-458-459-331-2102', '2018-04-25', '130', '1000'), 
					('191-458-459-621-4569', '2018-04-27', '131', '50.25'), 
					('191-458-459-721-1000', '2018-04-27', '132', '100'), 
					('191-458-459-999-6900', '2018-04-30', '143', '150'), 
					('456-191-457-400-5555', '2018-04-30', '144', '2500'), 
					('456-191-457-401-7777', '2018-04-30', '145', '5000')
					;
                    

                    
INSERT INTO Checking (Account_Number, Over_Draft_Fee, Account_ID)
    VALUES('9104-3652-1244-3666', 35, 1), 
				('9104-3652-1244-3667', 35, 3), 
				('9105-0366-9855-6214', 35, 4), 
				('9106-1566-1423-3698', 35, 6), 
				('9110-1234-5678-0909', 35, 7), 
				('9111-4578-3695-5419', 35, 9), 
				('9110-1234-5678-0911', 35, 10), 
				('9111-4578-3695-5422', 35, 11), 
				('9001-1478-2536-9031', 35, 13), 
				('9111-4578-3695-5417', 35, 16), 
				('9111-4578-3695-5412', 35, 17), 
				('9111-4578-3695-5414', 35, 19)
				;

INSERT INTO Savings (Account_Number, Interest_rate, Account_ID)
    VALUES('9104-3652-1244-3670', 0.035, 2), 
					('9104-3652-1244-3672', 0.035, 5), 
					('9111-4578-3695-5413', 0.035, 8), 
					('9111-4578-3695-5418', 0.045, 12), 
					('9002-5846-2513-5845', 0.045, 14), 
					('9002-5846-2513-5033', 0.05, 15), 
					('9111-4578-3695-5413', 0.05, 18)
					;

CREATE INDEX Cell_Phone_Number ON Customer(Cell_Phone_Number);

CREATE INDEX Email_Address ON Banker(Email_Address);

CREATE INDEX Office_Number ON Branch(Office_Number);




                            



