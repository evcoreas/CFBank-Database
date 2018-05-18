
/* View #1 */
CREATE VIEW banker_customers AS 
		SELECT Cust_First_Name, Cust_Last_Name, Customer.Customer_ID, Banker.First_Name, Banker.Last_Name, Branch.Branch_ID, 
					CONCAT(Branch.Address, "  " , Branch.City, "  ", branch.state, "  ", branch.zipcode) AS Branch_Address
					FROM Customer JOIN Banker ON Customer.Customer_ID = Banker.Customer_ID JOIN Branch ON Banker.Branch_ID = Branch.Branch_ID
					ORDER BY (Branch.Branch_ID);

SELECT * FROM CFBank.banker_customers;


/* View #2 */
CREATE VIEW Branch_open_loans AS 
			SELECT Cust_First_Name, Cust_Last_Name, Loan_Number, CONCAT("$", FORMAT(Balance,2)) AS Balance, Amount, Branch.Branch_ID
			FROM Customer JOIN Loan ON Customer.Customer_ID = Loan.Customer_ID JOIN Accounts ON Customer.Customer_ID = Accounts.Customer_ID
			JOIN Branch ON Loan.Branch_ID = Branch.Branch_ID
			ORDER BY (Amount)ASC;

SELECT * FROM CFBank.Branch_open_loans;


/* View #3 */
CREATE VIEW customer_one_saving AS 
			SELECT Cust_First_Name, Cust_Last_Name, Category, Savings.Account_Number, CONCAT("$", FORMAT(Balance,2)) AS Balance, Savings.Interest_Rate, 
            CONCAT("$", FORMAT(Balance *0.035,2)) AS Balance_accrued
			FROM Customer JOIN Accounts ON Customer.Customer_ID = Accounts.Customer_ID JOIN Savings ON Accounts.Account_ID = Savings.Account_ID
			WHERE Accounts.Account_ID = 2;

SELECT * FROM CFBank.customer_one_saving;