# awk-practice
This repository store 10 complex exercises to resolve using AWK, also contains a fast guide about using AWK

**1)** The input file transactions.csv contains financial transaction records with format: date,type,amount,description. Create a report that shows the running balance for each transaction type, but only for transactions where the description contains at least one uppercase letter followed immediately by a digit. The output should show: transaction_number, type, amount, running_balance_for_that_type. Use the match function to validate descriptions and maintain separate running totals using associative arrays.


**Archivo transactions.csv:**
`2024-01-15,DEBIT,150.50,Payment A1 grocery
2024-01-16,CREDIT,200.00,salary deposit
2024-01-17,DEBIT,75.25,Gas station B2
2024-01-18,CREDIT,50.00,refund item
2024-01-19,DEBIT,300.00,Rent C3 apartment
2024-01-20,CREDIT,25.75,Cashback D4 reward`
