# SQL_Data_Warehouse_Project

# SQL Data Warehouse Project

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

![Data Architecture](docs/data_architecture.png)

**Key Characteristics**
- **Bronze Layer**: Raw, as-is data ingestion
- **Silver Layer**: Cleansed, standardized, enriched data
- **Gold Layer**: Business-ready fact and dimension tables
- **Consumption Layer**: BI, ad-hoc SQL, and analytics

---

## 🔄 Data Flow Diagram

The diagram below shows how data flows from **CRM and ERP sources** through Bronze, Silver, and Gold layers.

![Data Flow Diagram](docs/data_flow_diagram.png)

**Flow Summary**
- Source CSV files land in the Bronze layer
- Bronze data is cleaned and standardized in Silver
- Gold layer exposes star-schema views for analytics

---

## 🔗 Data Integration (CRM & ERP)

This diagram illustrates how **CRM and ERP tables are connected** and enriched during transformation.

![Data Integration](docs/data_integration.png)

**Integration Highlights**
- CRM provides transactional and master data
- ERP enriches customers and products
- Customer and product data are unified before analytics

---

## ⭐ Sales Data Mart (Star Schema)

The final Gold layer is modeled as a **Sales Data Mart** using a Star Schema.

![Sales Data Mart](docs/sales_data_mart.png)

### Fact Table
- `gold.fact_sales`

### Dimension Tables
- `gold.dim_customers`
- `gold.dim_products`

**Design Notes**
- Surrogate keys for dimensions
- Fact table references dimensions via foreign keys
- Optimized for reporting and aggregation

---

## 📂 Repository Structure

