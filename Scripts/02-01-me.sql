SELECT e.employeeId, e.firstName, e.lastName, count(*) AS NumberOfCarsSold
FROM sales s
LEFT JOIN employee e 
  ON e.employeeId = s.employeeId
GROUP BY s.employeeId
ORDER BY NumberOfCarsSold DESC;
