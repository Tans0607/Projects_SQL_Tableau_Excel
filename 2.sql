SELECT GENDER,Count(GENDER) as 'Count'
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
Group by GENDER
ORDER by Count DESC