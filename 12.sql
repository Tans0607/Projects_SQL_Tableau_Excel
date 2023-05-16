SELECT --TOP 1 
PROD_CAT Product_Category, SUM(TOTAL_AMT) Total_Returns FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
WHERE TOTAL_AMT < 0 AND CONVERT(date, TRAN_DATE, 103) BETWEEN DATEADD(MONTH,-3,(SELECT MAX(CONVERT(DATE,tran_date,103)) FROM Transactions)) 
AND (SELECT MAX(CONVERT(DATE,tran_date,103)) FROM Transactions)
GROUP BY PROD_CAT
ORDER BY 2 DESC
