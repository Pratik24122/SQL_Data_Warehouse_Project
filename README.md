# SQL_Data_Warehouse_Project


## 📌 Project Overview

This project implements an **end-to-end SQL Data Warehouse** using a **Medallion Architecture (Bronze, Silver, Gold)**.  
It ingests data from **CRM and ERP source systems**, performs structured transformations, and exposes a **business-ready dimensional data model** for analytics and reporting.

The project demonstrates how raw operational data can be transformed into a clean, integrated, and query-optimized warehouse using **pure SQL**, following **data engineering and dimensional modeling best practices**.

Key highlights:
- Layered data warehouse design (Bronze, Silver, Gold)
- Integration of multiple source systems
- SQL-based data cleansing and transformation
- Dimensional modeling using a Star Schema
- Data quality and integrity validation

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

---
## 📋 Project Requirements

### Functional Requirements
- Ingest raw data from CRM and ERP source systems
- Preserve raw data without modification in the Bronze layer
- Clean, standardize, and integrate data in the Silver layer
- Build a business-ready Gold layer using a dimensional (Star Schema) model
- Generate surrogate keys for dimension tables
- Maintain referential integrity between fact and dimension tables
- Enable analytical and reporting queries on the Gold layer

### Data Requirements
- Support CSV-based source data ingestion
- Handle customer, product, and sales transaction data
- Enrich customer and product data using ERP sources
- Ensure consistency of keys across systems

### Data Quality Requirements
- No duplicate surrogate keys in dimension tables
- No orphan records in the fact table
- Valid and standardized attribute values
- Repeatable validation checks at Silver and Gold layers

### Technical Requirements
- SQL-based implementation (PostgreSQL / SQL Server compatible)
- Clear separation of Bronze, Silver, and Gold layers
- Script-based execution (no manual transformations)
- Version-controlled code using Git and GitHub

### Non-Functional Requirements
- Readable, maintainable SQL scripts
- Idempotent and re-runnable transformations
- Clear documentation and project structure
- Suitable for analytics, BI tools, and ad-hoc SQL queries


## 📂 Repository Structure
