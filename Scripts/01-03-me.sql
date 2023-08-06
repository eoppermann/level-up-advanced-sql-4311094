  SELECT c.firstName, c.lastName, c.address, c.city, s.salesId, s.salesAmount, s.soldDate
  FROM sales s
  INNER JOIN customer c
    ON s.customerId = c.customerId
UNION
  SELECT c.firstName, c.lastName, c.address, c.city, s.salesId, s.salesAmount, s.soldDate
  FROM customer c
  LEFT JOIN sales s
    ON s.customerId = c.customerId
  WHERE s.salesId IS NULL
UNION
  SELECT c.firstName, c.lastName, c.address, c.city, s.salesId, s.salesAmount, s.soldDate
  FROM sales s
  LEFT JOIN customer c
    ON s.customerId = c.customerId
  WHERE c.customerId IS NULL;