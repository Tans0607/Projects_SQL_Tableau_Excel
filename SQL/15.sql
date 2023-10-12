SELECT PROD_CAT Prod_Cat, PROD_SUBCAT Prod_SubCat, AVG(TOTAL_AMT) AVG_REV, SUM(TOTAL_AMT) Total_REV
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
WHERE PROD_CAT IN
(
SELECT TOP 5 
PROD_CAT
FROM dbo.prod_cat_info JOIN dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code JOIN dbo.customer ON customer.customer_Id = transactions.cust_Id
GROUP BY PROD_CAT
ORDER BY SUM(QTY) DESC
)
GROUP BY PROD_CAT, PROD_SUBCAT 
