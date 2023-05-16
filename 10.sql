SELECT TOP 5 
PROD_SUBCAT AS Prod_SubCategory, (SUM(TOTAL_AMT)/(SELECT SUM(TOTAL_AMT) FROM Transactions))*100 AS 'SALES%', 
(COUNT(CASE WHEN QTY< 0 THEN QTY ELSE NULL END)/SUM(QTY))*100 AS 'Return%'
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
GROUP BY PROD_SUBCAT
ORDER BY SUM(TOTAL_AMT) DESC
