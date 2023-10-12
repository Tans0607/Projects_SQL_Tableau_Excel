SELECT --TOP 1
prod_cat AS 'Products', SUM(Qty) AS 'Total_Qty'

FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id

GROUP BY prod_cat
ORDER By Total_Qty DESC