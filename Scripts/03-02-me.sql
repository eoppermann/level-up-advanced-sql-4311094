WITH cte AS (
  SELECT strftime('%m', s.soldDate) AS soldMonth,
         s.salesAmount, 
         employeeId
  FROM sales s
  WHERE strftime('%Y', s.soldDate) = '2021'
) 

SELECT e.firstName, e.lastName,
  SUM(CASE WHEN cte.soldMonth = '01' 
  THEN cte.salesAmount END) AS JanSales,
  SUM(CASE 
    WHEN cte.soldMonth = '02' 
    THEN cte.salesAmount END) AS FebSales,
  SUM(CASE 
    WHEN cte.soldMonth = '03'  
    THEN cte.salesAmount END) AS MarchSales,
  SUM(CASE 
    WHEN cte.soldMonth = '04' 
    THEN cte.salesAmount END) AS AprilSales,
  SUM(CASE 
    WHEN cte.soldMonth = '05' 
    THEN cte.salesAmount END) AS MaySales,
  SUM(CASE 
    WHEN cte.soldMonth = '06' 
    THEN cte.salesAmount END) AS JuneSales,
  SUM(CASE 
    WHEN cte.soldMonth = '07' 
    THEN cte.salesAmount END) AS JulySales,
  SUM(CASE 
    WHEN cte.soldMonth = '08' 
    THEN cte.salesAmount END) AS AugustSales,
  SUM(CASE 
    WHEN cte.soldMonth = '09' 
    THEN cte.salesAmount END) AS SeptemberSales,
  SUM(CASE 
    WHEN cte.soldMonth = '10' 
    THEN cte.salesAmount END) AS OctoberSales,
  SUM(CASE 
    WHEN cte.soldMonth = '11' 
    THEN cte.salesAmount END) AS NovemberSales,
  SUM(CASE 
    WHEN cte.soldMonth = '12' 
    THEN cte.salesAmount END) AS DecemberSales
FROM cte
INNER JOIN employee e 
  ON e.employeeId = cte.employeeId
GROUP BY cte.employeeId
ORDER BY e.lastName, e.firstName;