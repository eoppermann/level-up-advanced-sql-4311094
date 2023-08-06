SELECT e.employeeId, e.firstName, e.lastName, COUNT(*) AS CarsSold
FROM sales s
INNER JOIN employee e 
  ON e.employeeId = s.employeeId
WHERE s.soldDate >= date('now', 'start of year')
GROUP BY e.employeeId
HAVING COUNT(*) > 5;
