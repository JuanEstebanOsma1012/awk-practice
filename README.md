# awk-practice
This repository store 10 complex exercises to resolve using AWK, also contains a fast guide about using AWK

**1)** The input file transactions.csv contains financial transaction records with format: date,type,amount,description. Create a report that shows the running balance for each transaction type, but only for transactions where the description contains at least one uppercase letter followed immediately by a digit. The output should show: transaction_number, type, amount, running_balance_for_that_type. Use the match function to validate descriptions and maintain separate running totals using associative arrays.


**Archivo transactions.csv:**

2024-01-15,DEBIT,150.50,Payment A1 grocery
2024-01-16,CREDIT,200.00,salary deposit
2024-01-17,DEBIT,75.25,Gas station B2
2024-01-18,CREDIT,50.00,refund item
2024-01-19,DEBIT,300.00,Rent C3 apartment
2024-01-20,CREDIT,25.75,Cashback D4 reward


**2)** The input file server_logs.txt contains web server access logs. Extract all IP addresses that appear in lines containing HTTP status codes 4xx or 5xx, then create a frequency count of these problematic IPs. However, exclude any IP that matches a pattern passed via the -v option as exclude_pattern. The output should be sorted by frequency (highest first) and show: IP_address:frequency. Use PROCINFO["sorted_in"] for sorting and process the exclusion pattern using regex matching.


**Archivo server_logs.txt:**

192.168.1.100 - - [15/Jan/2024:10:30:45] "GET /index.html HTTP/1.1" 200 1234
10.0.0.5 - - [15/Jan/2024:10:31:12] "POST /login HTTP/1.1" 401 567
192.168.1.100 - - [15/Jan/2024:10:32:30] "GET /admin HTTP/1.1" 403 890
203.0.113.45 - - [15/Jan/2024:10:33:15] "GET /missing HTTP/1.1" 404 234
198.51.100.20 - - [15/Jan/2024:10:34:20] "GET /error HTTP/1.1" 500 1122
10.0.0.5 - - [15/Jan/2024:10:35:45] "GET /timeout HTTP/1.1" 504 445
