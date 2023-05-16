SELECT --TOP 1
city_code as 'City',Count(customer_Id) as 'Cust_Count'
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
Group by city_code
Order by Cust_Count DESC
