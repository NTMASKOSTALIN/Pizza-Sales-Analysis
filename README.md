Objectives:
The objective of this project is to perform an end-to-end analysis of pizza sales data (21k rows across 4 relational tables) to ensure data accuracy, integrity, and consistency through SQL-based cleaning and validation, and to derive key performance indicators (KPIs) that provide actionable business insights. The analysis aims to answer critical questions such as total revenue, order patterns, product mix performance, and time-based sales trends, while also identifying high-performing and underperforming pizzas. The ultimate goal is to transform raw sales data into a decision-support tool that helps optimize promotions, staffing schedules, and inventory planning.

Dataset:
- <a href="https://github.com/NTMASKOSTALIN/Pizza-Sales-Analysis/blob/main/pizzas.csv"> Pizzas
- <a href="https://github.com/NTMASKOSTALIN/Pizza-Sales-Analysis/blob/main/pizza_types.csv"> Pizza_Types
- <a href="https://github.com/NTMASKOSTALIN/Pizza-Sales-Analysis/blob/main/orders.csv"> Orders
- <a href="https://github.com/NTMASKOSTALIN/Pizza-Sales-Analysis/blob/main/order_details.csv"> Orderdetails
- <a href="https://docs.google.com/spreadsheets/d/1m5cTXE2Eiv_70_k4PXVUIKuuF_pWfhD9B9u84NWrF10/edit?gid=925059109#gid=925059109"> Google Sheets Dashboard

Questions(KPI):
1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top 5 most ordered pizza types along with their quantities.
6. Join the necessary tables to find the total quantity of each pizza category ordered.
7. Determine the distribution of orders by hour of the day.
8. Find the category-wise distribution of pizzas.
9. Group the orders by date and calculate the average number of pizzas ordered per day.
10. Determine the top 3 most ordered pizza types based on revenue.
11. Calculate the percentage contribution of each pizza type to total revenue.
12. Analyze the cumulative revenue generated over time.
13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

Process:
1. Data Exploration & Cleaning (SQL):
Checked for null values, duplicates, and negative prices.
Verified cross-table consistency between orders, order details, and pizzas.
Validated order details ↔ orders ↔ pizza records.
Found 5 pizzas never ordered → added an active/inactive flag.
Standardized date/time and price formats.
Ensured referential integrity and relationships across 4 tables.
2. Data Analysis (SQL):
Wrote queries to answer 13 business questions/KPIs.
Aggregated data for revenue, order counts, product mix, and time-based trends.
3. Visualization (Google Sheets Dashboard):
Designed a dashboard showing Revenue, Orders, Pizza Type Mix, Hourly Sales Distribution, Top 5 Pizza Types, Monthly Heatmap, and Annual Revenue Growth.
Added business insights directly below charts for storytelling.'

Dashboard:
<img width="1917" height="867" alt="Pizza Sales Dashboard" src="https://github.com/user-attachments/assets/75074910-a12e-4979-b794-55a23429fab8" />

Insights:
Strong Sales Volume: A total of 21,350 orders generated $817,860 in revenue, with an average of 138 pizzas sold per day demonstrates data sufficiency for meaningful trend analysis.

Pricing & Product Mix: The Greek Pizza ($35.95) is the highest-priced item, yet the Classic Deluxe Pizza dominates in both order volume and revenue share, highlighting the importance of product mix over price.

Category Insights: The Classic category leads both in quantity ordered and revenue contribution, making it the most reliable category for business growth.

Time-Based Trends: Sales peak at lunch (12 PM) and dinner (6 PM), with a noticeable dip between 2–3 PM, suggesting opportunities for time-based promotions during off-peak hours.

Revenue Drivers: While the Classic Deluxe is the top-seller, the Thai Chicken Pizza contributes the highest revenue, showing that premium pizzas drive disproportionate revenue impact.

Seasonality & Growth: Revenue remains stable throughout the year, with a small dip in October, suggesting overall resilience and potential for targeted seasonal marketing.

Conclusion:
This project demonstrates the complete data analytics lifecycle — from cleaning and validating raw data across multiple relational tables to deriving meaningful KPIs and building a dashboard that tells a clear business story. By ensuring data integrity (no nulls, no duplicates, referential consistency), performing SQL-based exploration and analysis, and translating results into actionable insights, the project highlights both technical rigor and business impact.

The findings not only answer performance questions (revenue, orders, product mix, seasonality) but also provide strategic recommendations such as focusing on high-margin pizzas, aligning staff with peak hours, and leveraging off-peak promotions. This reflects the ability to go beyond queries and visualizations to deliver data-driven decision support
