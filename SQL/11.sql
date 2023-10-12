SELECT CUST_ID,SUM(TOTAL_AMT) AS Total_Revenue FROM Transactions
WHERE CUST_ID IN 
	(SELECT CUSTOMER_ID
	 FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
     WHERE DATEDIFF(YEAR,CONVERT(DATE,DOB,103),GETDATE()) BETWEEN 25 AND 35)
     AND CONVERT(DATE,tran_date,103) BETWEEN DATEADD(DAY,-30,(SELECT MAX(CONVERT(DATE,tran_date,103)) FROM Transactions)) 
	 AND (SELECT MAX(CONVERT(DATE,tran_date,103)) FROM Transactions)
GROUP BY CUST_ID








--FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
