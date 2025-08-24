# restaurant-output-analysis-project

### 📌 Overview

This project evaluates restaurant operations using SQL and Tableau, providing insights into orders, ingredient usage, inventory levels, and labour costs to support data-driven decisions and improve efficiency.

### 👉 View Interactive Dashboard on Tableau Public: 
https://public.tableau.com/app/profile/amritpal.purewal/viz/RestaurantOutputAnalysis/Orders

### 📊 Dashboard Features

1. **Orders Analysis** – Track order volumes, item categories, and delivery locations.

2. **Ingredient Utilization** – Measure recipe-level ingredient demand and cost.

3. **Inventory Tracking** – Compare ordered ingredient quantities vs. available stock.

4. **Labour Costs** – Calculate staff hours and wage expenses per shift.

5. **Profitability Metrics** – Assess food and labour costs to identify high-margin and low-margin items.

### 🗂 Data Sources

| Dataset / SQL File               | Description                                     |
| -------------------------------- | ----------------------------------------------- |
| `inventory_management.sql`       | Inventory levels vs. ingredient usage           |
| `order_activity.sql`             | Orders with item details and delivery info      |
| `order_weight_and_inventory.sql` | Ingredient weight per order and remaining stock |
| `time.sql`                       | Staff shift hours and labour cost calculations   |

### 📈 Business Insights

These queries provide actionable insights for restaurant operations and decision-making:

| SQL File                         | Key Business Questions Answered                                                                                                                                                           |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `inventory_management.sql`       | - How much stock do we have vs. what is needed? <br> - Which ingredients are running low? <br> - How much inventory remains after fulfilling orders?                                      |
| `order_activity.sql`             | - What items are most frequently ordered? <br> - Where are orders being delivered? <br> - What is the revenue per order or item?                                                          |
| `order_weight_and_inventory.sql` | - What is the total weight of ingredients needed per order? <br> - How much does each ingredient cost per order? <br> - Are there discrepancies between inventory and order requirements? |
| `staff.sql`                       | - How many hours did staff work per shift? <br> - What is the total labour cost per staff or shift? <br> - Are staffing costs aligned with order volume and peak times?                    |
