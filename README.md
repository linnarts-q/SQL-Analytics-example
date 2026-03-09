# SQL Analytics example (Python + SQL)

This project demonstrates practical SQL techniques for data analysis using a small e-commerce style database.  
All analytical logic is implemented in SQL queries, while Python is used to execute them and display results.


## Tech Stack

- Python
- SQLite
- SQL

---

## SQL Techniques

### 1. Joins
Returns full order details by joining customers, orders and products tables.

### 2. Aggregations
Finds customers who placed more than one order.

### 3. Subqueries
Selects products priced above the average price of their category.

### 4. Window Functions
Returns the top 2 most expensive products in each category.

### 5. LAG
Calculates monthly revenue and compares it with the previous month.

### 6. ROW_NUMBER
Finds the first order made by each customer.

### 7. CTE (Common Table Expressions)
Implements a customer segmentation funnel.

### 8. Best Customer
Identifies the top spending customer in each product category