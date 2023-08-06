SELECT soldDate, salesAmount, employeeId, 
SUM(salesAmount) OVER (PARTITION BY employeeId ORDER BY soldDate) AS salesTotal, 
COUNT(salesAmount) OVER (PARTITION BY employeeId ORDER BY soldDate) AS salesNumbers,
AVG(salesAmount) OVER (PARTITION BY employeeId ORDER BY soldDate) AS salesAVG
FROM sales;

SELECT soldDate, salesAmount, employeeId, 
ROW_NUMBER() OVER (PARTITION BY employeeId ORDER BY soldDate) as rowNumber,
RANK() OVER (PARTITION BY employeeId ORDER BY salesAmount) as salesRank
FROM sales;

SELECT e.firstName, e.lastName, m.model,
  COUNT(s.inventoryId) AS numberOfCarsSold,
  RANK() OVER (PARTITION BY s.employeeId ORDER BY COUNT(m.model) desc) AS RankOfSoldModels
FROM sales s
INNER JOIN employee e ON e.employeeId = s.employeeId
INNER JOIN inventory i ON i.inventoryId = s.inventoryId
INNER JOIN model m ON m.modelId = i.modelId 
WHERE e.title = 'Sales Person'
GROUP BY s.employeeId, m.model;  