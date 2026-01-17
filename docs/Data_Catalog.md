## 📘 Data Catalog – Gold Layer

The Gold layer represents the **final, business-ready semantic layer** of the data warehouse.  
It exposes **clean, integrated, and analytics-optimized views** designed using a **Star Schema**.

This data catalog documents the **Gold layer objects**, their columns, and business meaning.

---

### 📊 gold.fact_sales

**Description**  
Stores transactional sales data at the order level.  
Each record represents a single product sold to a customer on a specific order.

**Grain**  
One row per **order × product × customer**

| Column Name | Data Type | Description |
|------------|----------|-------------|
| order_number | VARCHAR | Unique identifier for the sales order |
| product_key | INT | Surrogate key referencing `gold.dim_products` |
| customer_key | INT | Surrogate key referencing `gold.dim_customers` |
| order_date | DATE | Date when the order was placed |
| shipping_date | DATE | Date when the order was shipped |
| due_date | DATE | Order due date |
| sales_amount | NUMERIC | Total sales amount for the line item |
| quantity | INT | Quantity of product sold |
| price | NUMERIC | Unit price of the product |

**Business Rules**
- `sales_amount = quantity × price`
- Each record must have a valid `product_key` and `customer_key`

---

### 👤 gold.dim_customers

**Description**  
Contains enriched customer master data combining CRM and ERP attributes.

**Grain**  
One row per **unique customer**

| Column Name | Data Type | Description |
|------------|----------|-------------|
| customer_key | INT | Surrogate key (primary key) |
| customer_id | VARCHAR | Natural customer identifier from source |
| customer_number | VARCHAR | Business customer reference number |
| first_name | VARCHAR | Customer first name |
| last_name | VARCHAR | Customer last name |
| country | VARCHAR | Customer country |
| marital_status | VARCHAR | Marital status |
| gender | VARCHAR | Gender |
| birthdate | DATE | Customer date of birth |
| create_date | DATE | Customer record creation date |

**Business Rules**
- `customer_key` is unique and system-generated
- Used for customer-level slicing and segmentation

---

### 📦 gold.dim_products

**Description**  
Contains enriched product master data with category and pricing information.

**Grain**  
One row per **unique product**

| Column Name | Data Type | Description |
|------------|----------|-------------|
| product_key | INT | Surrogate key (primary key) |
| product_id | VARCHAR | Natural product identifier from source |
| product_number | VARCHAR | Business product reference number |
| product_name | VARCHAR | Product name |
| category_id | VARCHAR | Category identifier |
| category | VARCHAR | Product category |
| subcategory | VARCHAR | Product subcategory |
| maintenance | VARCHAR | Maintenance flag or classification |
| cost | NUMERIC | Product cost |
| product_line | VARCHAR | Product line |
| start_date | DATE | Product effective start date |

**Business Rules**
- Only active products are included
- `product_key` is unique and system-generated

---

### 🔗 Relationships (Star Schema)

- `gold.fact_sales.customer_key` → `gold.dim_customers.customer_key`
- `gold.fact_sales.product_key` → `gold.dim_products.product_key`

All relationships enforce **referential integrity** at the semantic level.

---

### ✅ Data Quality Guarantees

- No duplicate surrogate keys in dimension tables
- No orphan records in the fact table
- Standardized and validated attribute values
- Business-ready and safe for BI consumption

---

### 🎯 Intended Usage

The Gold layer is designed for:
- Business Intelligence dashboards
- Ad-hoc analytical SQL queries
- Reporting and aggregation
- Downstream data marts or ML feature generation
