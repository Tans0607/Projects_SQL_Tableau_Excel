SELECT prod_subcat AS Product,SUM(total_amt) AS Total_Revenue,Gender
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
WHERE PROD_CAT = 'Electronics' AND GENDER = 'M' AND total_amt > 0
GROUP BY prod_subcat,total_amt,Gender