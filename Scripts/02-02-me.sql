SELECT e.employeeId, 
  e.firstName, 
  e.lastName, 
  MAX(s.salesAmount) AS MostExpensiveCar, 
  MIN(s.salesAmount) AS LeastExpensiveCar
FROM sales s
INNER JOIN employee e
  ON e.employeeId = s.employeeId
WHERE s.soldDate >= date('now', 'start of year')
GROUP BY e.employeeId
ORDER BY e.employeeId;