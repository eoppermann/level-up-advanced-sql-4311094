SELECT s.salesId, s.salesAmount, s.soldDate
FROM sales s
WHERE s.inventoryId IN (
    SELECT i.inventoryId 
    FROM inventory i
    LEFT JOIN model m ON i.modelId = m.modelId
    WHERE m.EngineType = 'Electric');