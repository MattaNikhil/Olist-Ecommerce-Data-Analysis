Brazilian E-Commerce Analytics (Olist) - End-to-End Data Project
📌 Project Overview
This project is an end-to-end data analytics solution designed to extract, transform, and visualize real-world e-commerce data from Olist, the largest department store in Brazilian marketplaces. The goal of this project is to analyze operational performance, sales trends, and logistics efficiency across 100,000+ anonymized orders to provide actionable business intelligence.

🛠️ Tech Stack & Tools
Database Management: MySQL (Relational Database Design, Bulk Data Ingestion)

Business Intelligence: Power BI (Data Modeling, Power Query, Advanced DAX, Interactive Dashboards)

Dataset: Brazilian E-Commerce Public Dataset by Olist (Kaggle)

🏗️ Project Architecture & Workflow
1. Database Creation (MySQL)
Designed a normalized relational database schema (Star Schema) to handle multiple connected tables: Customers, Orders, Products, and Order_Items.

Bypassed local infile security constraints to successfully bulk-load over 100,000 rows of raw CSV data into the SQL server.

2. Data Modeling & Transformation (Power BI)
Connected Power BI directly to the local MySQL server.

Utilized Power Query to clean data, adjust data types (ensuring accurate datetime and currency formatting), and establish a robust data model.

Engineered a dynamic DateTable using DAX for precise Time Intelligence reporting.

3. Advanced DAX Calculations
Created custom business logic to track core KPIs, including:

Total Revenue & Freight Costs

Average Order Value (AOV)

Year-over-Year (YoY) Revenue Growth

Average Delivery Time (Days)

Late Delivery Percentage

4. Interactive Dashboard Design
Developed a two-page report catering to different business stakeholders:

Executive Sales Overview: High-level metrics, revenue seasonality, top-performing product categories, and geographic sales density across Brazilian states.

Logistics Performance: Operational metrics focusing on fulfillment efficiency, tracking delivery times against freight costs, and overall order status breakdowns.

📊 Key Insights & Business Recommendations
(Note: Replace these with the actual insights you find when clicking around your finished dashboard!)

Top Revenue Driver: The [Insert Top Category] category generated the highest revenue, bringing in $[Insert Number].

Logistics Bottleneck: The average delivery time across all regions is [Insert Number] days, with a late delivery rate of [Insert Number]%.

Freight Impact: Based on the scatter plot analysis, customers paying higher freight values [did / did not] consistently receive their orders faster, indicating a need to optimize carrier partnerships.

🖼️ Dashboard Previews
(Upload your screenshots to your GitHub repository and link them here so recruiters can see your work immediately!)

👨‍💻 Author
M Nikhil [https://www.linkedin.com/in/m-nikhil-0b5a84338/]

[Link to your Portfolio/Resume]
