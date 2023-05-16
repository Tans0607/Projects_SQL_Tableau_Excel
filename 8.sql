--To Check individual revenue of electronics and Clothing
SELECT prod_cat AS Product_ID,SUM(total_amt) AS Total_Amount_of_Transactions,Store_type--,COUNT(cust_id) AS Count_of_Transactions
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
WHERE prod_cat = 'Electronics' OR prod_cat = 'Clothing'
GROUP BY prod_cat,Store_type
HAVING (Store_type) = 'Flagship store'

--Actual answer as Total revenue

SELECT SUM(total_amt) As Combined_Revenue
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
WHERE Store_type = 'Flagship store' AND(prod_cat = 'Electronics' OR prod_cat = 'Clothing')
Group By Store_type

