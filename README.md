# SQL_Data_Warehouse_Project

📌 Project Overview

This project demonstrates the end-to-end implementation of a SQL-based Data Warehouse using a Medallion Architecture (Bronze, Silver, Gold).
It integrates data from CRM and ERP systems, applies structured transformations, and produces analytics-ready dimensional views following Kimball’s Star Schema principles.

The project emphasizes:

Data modeling

Data quality checks

Layered transformations

Clean, maintainable SQL design

🏗️ Architecture Overview
Source CSV Files
   │
   ▼
Bronze Layer  →  Raw ingestion (as-is)
   │
   ▼
Silver Layer  →  Cleansed & standardized data
   │
   ▼
Gold Layer    →  Dimension & Fact views (Star Schema)

📂 Repository Structure
SQL_Data_Warehouse_Project/
│
├── datasets/
│   ├── source_crm/
│   │   ├── cust_info.csv
│   │   ├── prd_info.csv
│   │   └── sales_details.csv
│   │
│   ├── source_erp/
│   │   ├── CUST_AZ12.csv
│   │   ├── LOC_A101.csv
│   │   └── PX_CAT_G1V2.csv
│
├── scripts/
│   ├── ddl_bronze.sql                 -- Bronze schema & tables
│   ├── bronze_load.sql               -- Load raw CSV data
│   ├── ddl_silver.sql                -- Silver transformations
│   ├── silver_data_filling_checks.sql-- Silver layer validations
│   └── gold_layer.sql                -- Gold views (dimensions & facts)
│
├── docs/
├── tests/
├── README.md
└── LICENSE

📊 Source Data Description
CRM Source
File	Description
cust_info.csv	Customer master data
prd_info.csv	Product master data
sales_details.csv	Sales transaction data
ERP Source
File	Description
CUST_AZ12.csv	Customer demographic details
LOC_A101.csv	Customer location data
PX_CAT_G1V2.csv	Product category hierarchy
🥉 Bronze Layer

Scripts

ddl_bronze.sql

bronze_load.sql

Purpose

Store raw source data without transformation

Preserve original structure and values

Key Characteristics

One-to-one mapping with source files

No cleansing or enrichment

Acts as the immutable data foundation

🥈 Silver Layer

Scripts

ddl_silver.sql

silver_data_filling_checks.sql

Purpose

Clean and standardize Bronze data

Integrate CRM and ERP sources

Key Transformations

Null and invalid value handling

Deduplication

Standardized column naming

Data type normalization

Referential alignment across datasets

🥇 Gold Layer (Star Schema)

Script

gold_layer.sql

Dimension Views

gold.dim_customers

gold.dim_products

Fact View

gold.fact_sales

Key Features

Surrogate keys generated using ROW_NUMBER()

Enriched attributes via Silver-layer joins

Optimized for BI, reporting, and analytics

✅ Data Quality & Validation

Quality checks are implemented to ensure:

Uniqueness of surrogate keys in dimensions

Referential integrity between fact and dimensions

Detection of orphan records

Data consistency across layers

These checks are read-only, repeatable, and designed for ongoing validation.

🛠️ Technology Stack

SQL (PostgreSQL / SQL Server compatible)

Dimensional Modeling (Kimball methodology)

CSV-based source ingestion

Git & GitHub for version control

🚀 How to Run the Project

Create database and schemas

Execute ddl_bronze.sql

Load raw data using bronze_load.sql

Run ddl_silver.sql

Validate Silver data using silver_data_filling_checks.sql

Create Gold views using gold_layer.sql

Query Gold views for analytics

📈 Use Cases

Sales performance analysis

Customer behavior insights

Product and category reporting

BI and dashboard consumption

🎯 Key Learnings

Data warehouse layering (Bronze, Silver, Gold)

SQL-based ETL design

Dimensional modeling (Star Schema)

Data quality validation techniques

Professional project structuring

📄 License

This project is licensed under the MIT License.
