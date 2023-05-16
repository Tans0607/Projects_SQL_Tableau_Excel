--SQL Advance Case Study


--Q1--BEGIN 
	
SELECT DISTINCT State FROM dbo.DIM_LOCATION
DIM_LOCATION inner join FACT_TRANSACTIONS on DIM_LOCATION.IDLocation = FACT_TRANSACTIONS.IDLocation inner join DIM_DATE on DIM_DATE.DATE = FACT_TRANSACTIONS.DATE
WHERE DIM_DATE.YEAR >=2005


--Q1--END

--Q2--BEGIN

SELECT TOP 1 State,COUNT (State) As 'State with most Samsung order'
FROM dbo.DIM_LOCATION inner join FACT_TRANSACTIONS on DIM_LOCATION.IDLocation = FACT_TRANSACTIONS.IDLocation inner join DIM_MODEL on DIM_MODEL.IDModel = FACT_TRANSACTIONS.IDModel inner join DIM_MANUFACTURER on DIM_MANUFACTURER.IDManufacturer = DIM_MODEL.IDManufacturer
WHERE Manufacturer_Name = 'Samsung'
GROUP BY State
ORDER BY [State with most Samsung order] DESC	


--Q2--END

--Q3--BEGIN      

SELECT Model_Name, ZipCode, State, Count (DIM_LOCATION.IDLocation) As 'NumofTransactions'
FROM dbo.DIM_MODEL inner join FACT_TRANSACTIONS on DIM_MODEL.IDModel = FACT_TRANSACTIONS.IDModel inner join DIM_LOCATION on DIM_LOCATION.IDLocation = FACT_TRANSACTIONS.IDLocation
GROUP BY Model_Name, ZipCode, State
ORDER BY NumofTransactions DESC 	


--Q3--END

--Q4--BEGIN

SELECT TOP 1 
Model_Name, Unit_Price FROM dbo.DIM_MODEL
ORDER BY Unit_Price

--Q4--END

--Q5--BEGIN

SELECT
Manufacturer_Name,
AVG(TOTALPRICE) Avg_Price, SUM(QUANTITY)  Sales_Q
FROM FACT_TRANSACTIONS inner join DIM_MODEL ON FACT_TRANSACTIONS.IDModel=DIM_MODEL.IDModel inner join DIM_MANUFACTURER
ON DIM_MODEL.IDManufacturer=DIM_MANUFACTURER.IDManufacturer                      
GROUP BY Manufacturer_Name
ORDER BY Sales_Q DESC  


--Q5--END

--Q6--BEGIN

SELECT Customer_Name, AVG(FACT_TRANSACTIONS.TotalPrice) As 'Amt_Spent', DIM_DATE.YEAR
FROM FACT_TRANSACTIONS inner join DIM_CUSTOMER on FACT_TRANSACTIONS.IDCustomer =  DIM_CUSTOMER.IDCustomer inner join DIM_DATE on DIM_DATE.DATE = FACT_TRANSACTIONS.DATE
WHERE Year = '2009'   
GROUP BY  Customer_Name, DIM_DATE.YEAR
HAVING AVG(FACT_TRANSACTIONS.TotalPrice) > 500
ORDER BY AVG(FACT_TRANSACTIONS.TotalPrice) DESC 


--Q6--END
	
--Q7--BEGIN  

SELECT TOP 5
Model_Name, DIM_DATE.YEAR, SUM(FACT_TRANSACTIONS.Quantity) As Total_Qty
FROM FACT_TRANSACTIONS inner join DIM_MODEL ON FACT_TRANSACTIONS.IDModel=DIM_MODEL.IDModel inner join DIM_DATE on FACT_TRANSACTIONS.DATE = DIM_DATE.DATE
WHERE Year = '2008' OR Year = '2009' OR Year = '2010'
GROUP BY Model_Name, DIM_DATE.YEAR
ORDER BY SUM(FACT_TRANSACTIONS.Quantity) DESC	
	
--Q7--END	

--Q8--BEGIN

SELECT TOP 2 Manufacturer_Name, SUM(TotalPrice) AS Sales, Year
FROM DIM_MODEL inner join FACT_TRANSACTIONS on DIM_MODEL.IDMODEL = FACT_TRANSACTIONS.IDMODEL inner join DIM_MANUFACTURER on DIM_MANUFACTURER.IDManufacturer = DIM_MODEL.IDManufacturer inner join DIM_DATE on DIM_DATE.DATE = FACT_TRANSACTIONS.DATE
WHERE Year = '2009' OR Year = '2010'
GROUP BY Manufacturer_Name, Year
ORDER BY SUM(TotalPrice) DESC


--Q8--END

--Q9--BEGIN
	
SELECT Manufacturer_Name, Year
FROM DIM_MANUFACTURER inner join DIM_MODEL on DIM_MANUFACTURER.IDManufacturer = DIM_MODEL.IDManufacturer inner join FACT_TRANSACTIONS on FACT_TRANSACTIONS.IDMODEL = DIM_MODEL.IDMODEL inner join DIM_DATE on DIM_DATE.DATE = FACT_TRANSACTIONS.DATE
WHERE Year = '2010'
EXCEPT 
SELECT Manufacturer_Name, Year
FROM DIM_MANUFACTURER inner join DIM_MODEL on DIM_MANUFACTURER.IDManufacturer = DIM_MODEL.IDManufacturer inner join FACT_TRANSACTIONS on FACT_TRANSACTIONS.IDMODEL = DIM_MODEL.IDMODEL inner join DIM_DATE on DIM_DATE.DATE = FACT_TRANSACTIONS.DATE
WHERE Year = '2009'


--Q9--END

--Q10--BEGIN

SELECT TOP 100
    T1.Customer_Name, T1.Year, T1.Avg_Price,T1.Avg_Qty,
    CASE
        WHEN T2.Year IS NOT NULL
        THEN FORMAT(CONVERT(DECIMAL(8,2),(T1.Avg_Price-T2.Avg_Price))/CONVERT(DECIMAL(8,2),T2.Avg_Price),'p') ELSE NULL 
        END AS 'YEARLY_%_CHANGE'
    FROM
        (SELECT t2.Customer_Name, YEAR(t1.DATE) AS YEAR, AVG(t1.TotalPrice) AS Avg_Price, AVG(t1.Quantity) AS Avg_Qty FROM FACT_TRANSACTIONS AS t1 
        left join DIM_CUSTOMER as t2 ON t1.IDCustomer=t2.IDCustomer
        where t1.IDCustomer in (select top 10 IDCustomer from FACT_TRANSACTIONS group by IDCustomer order by SUM(TotalPrice) desc)
        group by t2.Customer_Name, YEAR(t1.Date)
        )T1
    left join
        (SELECT t2.Customer_Name, YEAR(t1.DATE) AS YEAR, AVG(t1.TotalPrice) AS Avg_Price, AVG(t1.Quantity) AS Avg_Qty FROM FACT_TRANSACTIONS AS t1 
        left join DIM_CUSTOMER as t2 ON t1.IDCustomer=t2.IDCustomer
        where t1.IDCustomer in (select top 10 IDCustomer from FACT_TRANSACTIONS group by IDCustomer order by SUM(TotalPrice) desc)
        group by t2.Customer_Name, YEAR(t1.Date)
        )T2
        on T1.Customer_Name=T2.Customer_Name and T2.YEAR=T1.YEAR-1
	

--Q10--END
	