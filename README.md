# SQL_Data_Warehouse_Project


## 📌 Project Overview

This project demonstrates an **end-to-end SQL Data Warehouse implementation** using the **Medallion Architecture (Bronze, Silver, Gold)**.  
It integrates data from **CRM and ERP source systems**, applies structured transformations, and delivers **analytics-ready datasets** modeled using a **Star Schema**.

The project focuses on:
- SQL-based ETL design
- Layered data architecture
- Dimensional modeling (Kimball methodology)
- Data quality validation
- Analytics and BI readiness

---

## 🏗️ Data Architecture

The overall data architecture follows a layered approach where raw source data is progressively refined into business-ready datasets.

![Data Architecture](docs/Data_Architecture.png)

**Key Characteristics**
- **Bronze Layer**: Raw, as-is data ingestion
- **Silver Layer**: Cleansed, standardized, enriched data
- **Gold Layer**: Business-ready fact and dimension tables
- **Consumption Layer**: BI, ad-hoc SQL, and analytics

---

## 🔄 Data Flow Diagram

The diagram below shows how data flows from **CRM and ERP sources** through Bronze, Silver, and Gold layers.

![Data Flow Diagram](docs/Data_Flow_Diagram.png)

**Flow Summary**
- Source CSV files land in the Bronze layer
- Bronze data is cleaned and standardized in Silver
- Gold layer exposes star-schema views for analytics

---

## 🔗 Data Integration (CRM & ERP)

This diagram illustrates how **CRM and ERP tables are connected** and enriched during transformation.

![Data Integration](docs/Data_Integration.png)

**Integration Highlights**
- CRM provides transactional and master data
- ERP enriches customers and products
- Customer and product data are unified before analytics

---

## ⭐ Gold Layer – Dimensional Data Model (Star Schema)

The Gold layer represents the **final, business-ready dimensional data model** of the data warehouse.  
It is designed using a **Star Schema** to support analytical queries, reporting, and BI consumption.

![Gold Layer Data Model](docs/Data_Model.png)

### Fact Table
- `gold.fact_sales`  
  Stores transactional sales measures such as quantity, price, and sales amount.

### Dimension Tables
- `gold.dim_customers`  
  Contains enriched customer attributes including demographics and location.
  
- `gold.dim_products`  
  Contains product, category, and pricing information.

**Design Characteristics**
- Surrogate keys are used for all dimensions
- Fact table references dimensions via foreign keys
- Optimized for aggregation, filtering, and slicing across business dimensions

