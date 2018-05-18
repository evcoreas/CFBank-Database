SELECT Cust_First_Name, Cust_Last_Name, CONCAT(Address, " ", City, " ", State, " ", Zipcode) AS FullAddress FROM Customer;
/*Part2 Query #1 -This query is retreving only the customers first and last name and their full address from the customer table */

SELECT CONCAT(First_Name, " ", Last_Name) AS Bankers_Name, Email_Address from Banker;
/*Part2 Query #2 - This query is retreving all of the bankers names and putting them in a column named bankers name. Also retrieving their email address. All of this data is being retireved from the banker table */

SELECT City, COUNT(Customer_ID) FROM Customer Group by (City);
/*Part2 Query #3 -This query is retreving the amount of customers that resides in each city. */

SELECT Cust_First_Name, Cust_Last_Name, State, CONCAT(Address, " ", City, " " , State, " " , Zipcode) AS Full_Address FROM customer WHERE State = 'NY' OR State = 'FL';
/*Part2 Query #4 -This query is retreving the amount of customers that only lives in ny and fl. */

SELECT * FROM Accounts ORDER BY (Balance) DESC;
/*Part2 Query #5 - This query is retreving all of the accounts from the accounts table and sorting it by the balance column. */

SELECT SUM(Amount) AS Loan_Balance FROM Loan;
/*Part2 Query #6 - This query is retreving the total amount loans due by all of the customer from the loan table and I am quering it as Loan_Balance. */

SELECT Customer_ID, Cust_First_Name, Cust_Last_Name FROM Customer WHERE Cust_Last_Name LIKE ("%son");
/*Part2 Query #7 - This query is retreving all of the customers identification, first name and last name, where the last name has to have the ending SON*/

SELECT Banker_ID, First_Name, Last_Name FROM Banker WHERE First_Name LIKE ("A%");
/*Part2 Query #8 - This query is retreving all of the bankers identification, first name and last name, where the first name has to start with the letter A*/

SELECT * FROM Customer WHERE State NOT IN ("NY");
/*Part2 Query #9- This query is retreving all of the customer that do not live in ny*/

SELECT DATE_FORMAT(Payment_Date, "%m/%d/%y") AS Payment_Date FROM LoanPayments WHERE Payment_Date BETWEEN "2018-04-25" AND "2018-04-29";
/*Part2 Query #10- This query is retreving all the loan payments made from april 25 to april 29th*/

SELECT MIN(Amount) FROM Loan;
/*Part2 Query #11- This query is retreving the loan that has the lowest balance*/

SELECT COUNT(Customer_ID) FROM Customer;
/*Part2 Query #12- This query is retreving the total amount of customers that are in the CFBank database*/

SELECT * FROM Customer WHERE City = "Santa monica" AND State = "CA";
/*Part2 Query #13- his query is retreving the customer that live in santa monica and ca*/
