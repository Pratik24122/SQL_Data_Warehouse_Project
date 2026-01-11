/*
===========================================================================================
Script Name      : ddl_silver.sql
Layer            : Silver
Purpose          : DDL Creation for Silver Layer Tables
===========================================================================================

Script Purpose:
    This script is responsible for creating all required tables in the 'silver' schema.
    These tables store cleaned, standardized, and structured data derived from the
    'bronze' layer as part of the data warehousing pipeline.

Actions Performed:
    - Creates Silver layer tables.
    - Defines appropriate data types and column structures.
    - Prepares tables for downstream ETL loading processes.

Dependencies:
    - Requires the 'silver' schema to exist.
    - Source data is expected to come from the 'bronze' schema.

Parameters:
    None.

Notes:
    - This script should be executed before running any Silver layer data load procedures.
    - Designed to be idempotent where applicable (use DROP/CREATE or CREATE IF NOT EXISTS
      based on implementation).

===========================================================================================
*/


DROP TABLE IF EXISTS silver.crm_cust_info;
CREATE TABLE silver.crm_cust_info(
	cst_id int,
	cst_key varchar(50),
	cst_firstname varchar(50),
	cst_lastname varchar(50),
	cst_marital_status varchar(50),
	cst_gndr varchar(50),
	cst_create_date date,
	dwh_create_date timestamp default now()
);


DROP TABLE IF EXISTS silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info(
	prd_id int,
	cat_id varchar(50),
	prd_key varchar(50),
	prd_nm varchar(50),
	prd_cost int,
	prd_line varchar(50),
	prd_start_dt date,
	prd_end_dt date,
	dwh_create_date timestamp default now()
);

DROP TABLE IF EXISTS silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details(
	sls_ord_num varchar(50),
	sls_prd_key varchar(50),
	sls_cust_id int,
	sls_order_dt date,
	sls_ship_dt date,
	sls_due_dt date,
	sls_sales int,
	sls_quantity int,
	sls_price int,
	dwh_create_date timestamp default now()
	
);

DROP TABLE IF EXISTS silver.erp_cust_az12;
CREATE TABLE silver.erp_cust_az12(
CID varchar(50),
BDATE date,
GEN varchar(10),
dwh_create_date timestamp default now()
);

DROP TABLE IF EXISTS silver.erp_loc_a101;
CREATE TABLE silver.erp_loc_a101(
CID varchar(50),
CNTRY varchar(50),
dwh_create_date timestamp default now()
);

DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;
CREATE TABLE silver.erp_px_cat_g1v2(
ID varchar(50),
CAT varchar(50),
SUBCAT varchar(50),
MAINTENANCE varchar(50),
dwh_create_date timestamp default now()
);

