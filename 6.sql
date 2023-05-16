SELECT prod_cat AS 'Products', SUM(total_amt) AS 'Individual_Revenues'
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
WHERE PROD_CAT IN ('BOOKS' , 'ELECTRONICS')
GROUP BY prod_cat


SELECT SUM(TOTAL_AMT) AS 'Total Revenue'
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id 
WHERE PROD_CAT IN ('BOOKS' , 'ELECTRONICS')
