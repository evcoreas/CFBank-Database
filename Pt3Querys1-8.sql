SELECT Cust_First_Name, Cust_Last_Name, CONCAT(Address, " " , City, " " , State, " ", Zipcode) AS FullAddress, Loan.Loan_number, CONCAT("$", FORMAT(Balance,2)) AS Balance
			FROM Customer JOIN Loan ON Customer.Customer_ID = Loan.customer_ID JOIN Accounts ON Customer.Customer_ID = Accounts.Customer_ID GROUP BY(Balance) ASC;
 /*Pt 3 Query #1 This query is to connect the customer table and the loan table together to see the customers information and loan balance */
 
 
SELECT Customer.Customer_ID, Cust_First_Name, Cust_Last_Name, Accounts.Balance, CONCAT("$", Format(Amount,2)) AS Amount 
			FROM customer join loan ON customer.customer_ID = loan.customer_ID JOIN Accounts ON Customer.Customer_ID = Accounts.Customer_ID
			WHERE Amount >15000 AND Amount < 100000;
 /*Pt 3 Query #2 This query is to connect the customer table and the loan table together as well but here we only want to see the customers that owe  an amount that exceeds $15000 but is below $100000*/
 
 
SELECT Cust_First_Name, Cust_Last_Name, Account_Number, Category
			FROM Customer JOIN Accounts ON Customer.Customer_ID = Accounts.Customer_ID
			WHERE Category = "Checking";
/*Pt 3 Query #3 This query is to connect the customer table and the account table because want to see the customers who has a checking account only at CF Bank.*/

SELECT CONCAT(Cust_First_Name, " " ,Cust_Last_Name) AS Full_Name, Account_Number, Category, CONCAT("$", FORMAT(Balance,2)) AS Balance
			FROM Customer JOIN Accounts ON Customer.Customer_ID = Accounts.Customer_ID
			WHERE Category = "Saving" AND Balance BETWEEN 1 AND 1000;
/*Pt 3 Query #4 This query is to connect the customer table and the account table because  we want to see which customers has a savings balance is from $1 to $1000*/

SELECT Customer.Customer_ID, Cust_First_Name, Cust_Last_Name, CONCAT(Address, " " , City, " " , State, " " , Zipcode) AS Full_Address,
			CONCAT("$", Format(Amount,2)) AS Amount, CONCAT("$", FORMAT(Balance *0.15,2)) AS New_Interest_Amount
			FROM Customer JOIN Accounts ON Customer.Customer_ID = Accounts.Customer_ID
			JOIN Loan ON Customer.Customer_ID = Loan.Customer_ID;
/*Pt 3 Query #5 for this I had to use concat to get the full name of the customer in one column and the full address of the customer in one column as well as getting the dollarsign formated to the amounts and balance. */

SELECT Branch.Branch_ID, First_Name, Last_Name, Email_Address, CONCAT(Address, "  ", City, " " , State, " " , Zipcode) AS Full_Branch_Address
			FROM Branch JOIN Banker ON Branch.Branch_ID = Banker.Branch_ID ORDER BY (Branch_ID);
/*Pt 3 Query #6 for this query we are connecting the Branch and Banker tables together to see which bank they work for*/

SELECT Branch.Branch_ID, Amount FROM Branch JOIN Loan ON Branch.Branch_ID = Loan.Branch_ID
			ORDER BY Branch_ID, Amount;
/*Pt 3 Query #7 for this query we are also connecting the branch and banker tables together to see the amount of the loans a particular branch gave.*/

SELECT Customer.Customer_ID, Cust_First_Name, Cust_Last_Name, Loan.Loan_Number, CONCAT("$", format(amount,2)) AS amount, CONCAT("$", format(balance,2)) AS balance,
			CONCAT("$", format(payment_amount,2)) AS payment_amount, CONCAT("$", format(balance-payment_amount,2)) AS balance_after_payment
			FROM customer JOIN Loan ON Customer.Customer_ID = Loan.Customer_ID JOIN Accounts ON Customer.Customer_ID = Accounts.Customer_ID
			JOIN LoanPayments ON Loan.Loan_Number = LoanPayments.Loan_Number
			ORDER BY (Customer_ID);
/*Pt 3 Query #8 For this query we want to see the loan number and amount and how much they paid as well as the balance after they made a payment to there account.*/
