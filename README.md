Description:

This project focuses on analyzing the sales performance of an e-commerce platform. The goal was to study revenue trends and provide insights that can help the company make data-driven decisions. Specifically, we aimed to identify which products and categories generate the most revenue, which customers and regions contribute the most sales, how sales are trending over time, and which products or regions are underperforming. By analyzing these patterns, the management team can optimize inventory planning, marketing strategies and customer engagement for better business outcomes.

Setup:

We used Google Cloud Platform (GCP), Big Query and Data Studio to process and visualize the data.

Steps Followed:

1. Dataset Upload to Google Cloud Storage

Created a GCS Bucket to store our raw data files.
Uploaded all CSV files i.e. orders.csv, order_item.csv, product.csv, users.csv into the bucket.
These files represented different aspects of the business such as customer details, product catalog, orders and transaction items.
2. Creating Big Query Dataset and Tables

Created a Big Query Dataset to store our e-commerce data.

Imported each CSV file into a seperate Big Query Table along while ensuring proper schema mapping.

Wrote the following SQL Queries:

Top 10 Products By Revenue
Top 10 Categories By Revenue
Revenue By Region (Customer Contribution)
Sales Trend Over Time (Monthly)
Average Order Value (AOV)
Repeat Customers (who ordered more than once)
UnderPerforming Products (Low Revenue + Low Sales Count)
Wrote SQL queries to calculate: Top 10 Products By Revenue, Average Order Value, Top 10 Categories By Revenue, Revenue By Region, Sales Trends, Repeat Customers and Underperforming Products.
👉 Click Here to View all queries [https://github.com/rathi-saurabh/Ecom-SalesAnalytics_on-BQ-DataStudio/blob/7dc5817ba3f3d0692a69a58811d367d4e39dcbc0/revenueAnalysisECom.sql]

3. Connecting To Data Studio

Connected Big Query Data to Data Studio.

We used Custom Queries to streamline the linking process with Looker Studio. Although it is possible to connect each table individually from the Big Query project to Data Studio, this method is slower and less efficient. Another approach is to create views in Big Query for each analysis and then connect those views to Data Studio. However, the most efficient method we implemented was using custom queries directly in Data Studio, which allowed faster integration and reduced complexity.

Then Built a Dashboard with Visualizations such as:

Time Series Chart (Revenue Trends Over Time)
Scorecard (Average Order Value)
Geo Map (Revenue By Country)
Bar Charts (Top Brands / Categories)
Tables (Top Customers By Orders / Top Products By Sale)
This covers most of the important KPI's (Key Performance Index) of an e-commerce project.

Final Dashboard-

![image alt] (https://github.com/rathi-saurabh/Ecom-SalesAnalytics_on-BQ-DataStudio/blob/0e6fd84e32af00de0efd6390c129fa250f395b0b/E-Commerce_Dashboard.jpg) 
