SELECT prod_cat_info.prod_cat AS 'PRODUCTS'/*,Transactions.total_amt AS 'AMOUNT'*/,SUM(total_amt) AS 'SUM_Total_Amt'--,COUNT(prod_cat_info.prod_cat) AS 'COUNT'

FROM dbo.prod_cat_info inner join dbo.Transactions ON prod_cat_info.prod_cat_code = Transactions.prod_cat_code

WHERE prod_cat IN ('Books' ,'Electronics') AND Transactions.total_amt > 0

GROUP BY prod_cat_info.prod_cat--,Transactions.total_amt

ORDER BY prod_cat_info.prod_cat