-- Calculate ingredient usage and cost per menu item
SELECT
  s1.item_name,                                   -- Menu item name
  s1.ing_id,                                      -- Ingredient ID
  s1.ing_name,                                    -- Ingredient name
  s1.ing_weight,                                  -- Package weight of ingredient
  s1.ing_price,                                   -- Package price of ingredient
  s1.order_quantity,                              -- Total items sold
  s1.recipe_quantity,                             -- Ingredient needed per item
  s1.order_quantity * s1.recipe_quantity AS ordered_weight, -- Total ingredient used
  s1.ing_price / s1.ing_weight AS unit_cost,      -- Cost per unit weight
  (s1.order_quantity * s1.recipe_quantity) * 
  (s1.ing_price / s1.ing_weight) AS ingredient_cost -- Total cost of ingredient used
FROM
(
    -- Aggregate orders with recipe and ingredient details
    SELECT
      o.item_id,                                  -- Ordered item ID
      i.sku,                                      -- Item SKU (links to recipe)
      i.item_name,                                -- Item name
      r.ing_id,                                   -- Ingredient ID
      ing.ing_name,                               -- Ingredient name
      r.quantity AS recipe_quantity,              -- Ingredient per recipe
      SUM(o.quantity) AS order_quantity,          -- Total items ordered
      ing.ing_weight,                             -- Ingredient package weight
      ing.ing_price                               -- Ingredient package price
    FROM
      orders o
      LEFT JOIN item i ON o.item_id = i.item_id         -- Join items
      LEFT JOIN recipe r ON i.sku = r.recipe_id         -- Join recipes
      LEFT JOIN ingredient ing ON ing.ing_id = r.ing_id -- Join ingredients
    GROUP BY
      o.item_id, i.sku, i.item_name,
      r.ing_id, r.quantity,
      ing.ing_name, ing.ing_weight, ing.ing_price
) s1;
