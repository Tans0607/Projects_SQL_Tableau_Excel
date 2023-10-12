SELECT prod_cat Prod_category, AVG(Total_amt) 'Avg Rev > Overll Rev'
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
GROUP BY PROD_CAT
HAVING AVG(TOTAL_AMT)>(SELECT AVG(TOTAL_AMT) FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id)