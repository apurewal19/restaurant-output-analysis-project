-- Order Weight and Inventory Report: compares ingredient usage from orders 
-- against the current inventory to calculate remaining stock
SELECT 
  s2.ing_name,                                      -- Ingredient name
  s2.ordered_weight,                                -- Total ingredient used in orders
  ing.ing_weight,                                   -- Package weight of ingredient
  inv.quantity,                                     -- Number of ingredient packages in inventory
  ing.ing_weight * inv.quantity AS total_inv_weight,-- Total inventory weight available
  (ing.ing_weight * inv.quantity) - s2.ordered_weight AS remain_weight -- Remaining stock after usage
FROM (
    -- Aggregate ingredient usage across all orders
    SELECT
      ing_id,                                       -- Ingredient ID
      ing_name,                                     -- Ingredient name
      SUM(ordered_weight) AS ordered_weight         -- Total weight of ingredient used
    FROM stock1 
    GROUP BY
      ing_name,
      ing_id
) s2
LEFT JOIN inventory inv ON inv.item_id = s2.ing_id   -- Match ingredient to inventory
LEFT JOIN ingredient ing ON ing.ing_id = s2.ing_id;  -- Get ingredient package details
