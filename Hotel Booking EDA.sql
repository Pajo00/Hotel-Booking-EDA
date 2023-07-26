-- Hotel Booking Exploratory Data Analysis

ALTER TABLE data1
ADD COLUMN cost_price AS (Orderqty * unitcost);


ALTER TABLE data1
ADD COLUMN profit AS (salesprice-cost_price);

-- To create the table for the analysis
CREATE TABLE new_data AS 
SELECT *
FROM data1
INNER JOIN data2 ON data1.Salesteamindex = data2."index"
INNER JOIN data3 ON data1.Productindex = data3."Index"
INNER JOIN data4 ON data1.Storeindex = data4.id

-- Question 1
ALTER TABLE data1
ADD COLUMN "salesprice" AS (Orderqty * unitprice)

SELECT SUM(salesprice) AS total_revenue
FROM data1;

-- Question 2
SELECT SalesChannel, ProductName, OrderNumber, SUM(Orderqty) AS total_orders
FROM new_data
WHERE SalesChannel IN ("Distributor", "In-Store")
GROUP BY SalesChannel;

-- Question 3
SELECT SalesTeam,SalesChannel, SUM(Orderqty) AS total_orders
FROM new_data
WHERE SalesTeam = "Nicholas Cunningham"
GROUP BY SalesChannel;

-- Question 4
SELECT *
FROM new_data
WHERE Orderqty > (
	SELECT AVG(Orderqty)
	FROM new_data
);

-- Question 5
SELECT ProductName, SUM (Orderqty) AS total_orders
FROM new_data
GROUP BY Orderqty 
ORDER BY Orderqty DESC
LIMIT 10;

-- Question 6
SELECT state, SUM (Orderqty) AS total_orders
FROM new_data
WHERE state = "Alabama"

-- Question 7
SELECT *
FROM new_data
WHERE OrderNumber = "SO471";

-- Question 8
SELECT Region, AVG(profit) AS avg_profit
FROM new_data
GROUP BY Region
ORDER BY AVG(profit) DESC;

-- Question 9
SELECT ProductCategory, COUNT (OrderNumber) AS total_orders
FROM new_data
GROUP BY ProductCategory
HAVING COUNT (OrderNumber) >= 2000;

-- Question 10 (for expensive products)
SELECT ProductName,unitprice, SUM(Orderqty) AS total_order
FROM new_data
GROUP BY ProductName
ORDER BY unitprice DESC
LIMIT 5;

-- for cheap products
SELECT ProductName,unitprice, SUM(Orderqty) AS total_order
FROM new_data
GROUP BY ProductName
ORDER BY unitprice ASC
LIMIT 5;






