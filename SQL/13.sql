SELECT --TOP 1
Store_type,SUM(TOTAL_AMT) Sales, SUM(QTY) Quantity
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
GROUP BY Store_type
