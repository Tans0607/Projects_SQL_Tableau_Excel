SELECT customer_Id AS Customer_ID,COUNT(cust_id) AS Count_of_Transactions
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
WHERE Qty >= 0
GROUP BY customer_Id
HAVING COUNT(customer_Id) > 10