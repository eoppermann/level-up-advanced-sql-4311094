SELECT e.firstName, 
  e.lastName, 
  e_m.firstName AS mangagerFirstName, 
  e_m.lastName AS managerLastName
FROM employee e
LEFT JOIN employee e_m 
  ON e.managerID = e_m.employeeId