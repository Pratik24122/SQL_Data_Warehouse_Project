/*
====================================================================================================
DDL Script : Create Gold Layer Views
====================================================================================================

Script Purpose:
    This script creates Dimension and Fact views in the Gold layer of the data warehouse.
    The Gold layer represents the business-ready semantic layer modeled using a Star Schema.

    - Dimension Views:
        • gold.dim_customers  : Customer master dimension with enriched demographic attributes
        • gold.dim_products   : Product master dimension with category and pricing attributes

    - Fact View:
        • gold.fact_sales     : Sales fact table containing transactional measures and foreign keys
                                to customer and product dimensions

Data Source:
    - Silver Layer tables (cleansed and standardized datasets)
    - ERP and CRM integrated data

Key Transformations:
    - Surrogate key generation using ROW_NUMBER()
    - Attribute enrichment via LEFT JOINs
    - Handling of missing or invalid values using CASE and COALESCE
    - Filtering for active products only (prd_end_dt IS NULL)

Usage:
    - These views are intended for analytics, reporting, and BI consumption.
    - Designed to support aggregation, slicing, and dicing across customers, products, and time.

Layer       : Gold
====================================================================================================
*/



-- ========================================================================================
-- Create Dimension : gold.dim_customers
-- ========================================================================================
CREATE VIEW gold.dim_customers As
(SELECT 
	Row_number() Over(Order By cst_id) as customer_key, -- Surrogate Key
	ci.cst_id as customer_id,
	ci.cst_key as customer_number,
	ci.cst_firstname as first_name,
	ci.cst_lastname as last_name,
	cust_country.cntry as country,
	ci.cst_marital_status as marital_status,
	CASE WHEN ci.cst_gndr!='n/a' THEN ci.cst_gndr
		 ELSE COALESCE(cust_bdate.gen, 'n/a')
	END AS gender,
	cust_bdate.bdate as birthdate,
	ci.cst_create_date as create_date
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 cust_bdate
ON ci.cst_key=cust_bdate.cid
LEFT JOIN silver.erp_loc_a101 cust_country
ON ci.cst_key=cust_country.cid);


-- ========================================================================================
-- Create Dimension : gold.dim_products
-- ========================================================================================
CREATE OR REPLACE VIEW gold.dim_products AS
SELECT 
	ROW_NUMBER() OVER(ORDER BY pi.prd_start_dt,pi.prd_key) AS product_key,
	pi.prd_id AS product_id,
	pi.prd_key product_number,
	pi.prd_nm product_name,
	pi.cat_id category_id,
	pc.cat category,
	pc.subcat subcategory,
	pc.maintenance,
	pi.prd_cost as "cost",
	pi.prd_line product_line,
	pi.prd_start_dt	start_date
FROM silver.crm_prd_info pi
LEFT JOIN silver.erp_px_cat_g1v2 pc
ON pi.cat_id=pc.id
where prd_end_dt IS NULL;


-- ========================================================================================
-- Create Fact : gold.fact_sales
-- ========================================================================================
CREATE OR REPLACE VIEW gold.fact_sales AS
SELECT 
	sd.sls_ord_num order_number,
	dp.product_key,
	dc.customer_key,
	sd.sls_order_dt order_date,
	sd.sls_ship_dt shipping_date,
	sd.sls_due_dt due_date,
	sd.sls_sales sales_amount,
	sd.sls_quantity quantity,
	sd.sls_price price
FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_products dp
ON dp.product_number=sd.sls_prd_key
LEFT JOIN gold.dim_customers dc
ON dc.customer_id=sd.sls_cust_id;






























