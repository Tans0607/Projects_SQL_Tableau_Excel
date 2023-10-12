SELECT DISTINCT prod_cat AS 'Category', prod_subcat AS 'Sub_Category'

FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id

WHERE prod_cat = 'Books'
