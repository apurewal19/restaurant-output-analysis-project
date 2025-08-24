-- Order Activity Report: shows order details with item, pricing, and delivery info
SELECT
  o.order_id,             -- Unique order ID
  i.item_price,           -- Price of the ordered item
  o.quantity,             -- Quantity of items in the order
  i.item_cat,             -- Item category (e.g., Pizza, Drink)
  i.item_name,            -- Item name
  o.created_at,           -- Order timestamp
  a.delivery_address1,    -- Delivery address line 1
  a.delivery_address2,    -- Delivery address line 2
  a.delivery_city,        -- Delivery city
  a.delivery_zipcode,     -- Delivery postal/zip code
  o.delivery              -- Delivery method (e.g., pickup, delivery)
FROM
  orders o
  LEFT JOIN item i ON o.item_id = i.item_id     -- Link orders to item details
  LEFT JOIN address a ON o.add_id = a.add_id;   -- Link orders to delivery address
