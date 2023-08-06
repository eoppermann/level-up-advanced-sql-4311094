SELECT firstName, lastName
FROM employee e
LEFT JOIN sales s ON s.employeeId = e.employeeId
WHERE e.title = 'Sales Person' AND s.salesId IS NULL;