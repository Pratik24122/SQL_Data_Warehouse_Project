/*
==============================================================================
Load Script: Bronze Layer Data Ingestion (Source -> Bronze)
PostgreSQL / psql
==============================================================================

Script Purpose:
This script loads raw data into the 'bronze' schema tables in PostgreSQL
from external CSV files using psql meta-commands.

The script performs the following actions:
- Truncates existing bronze tables before loading new data.
- Loads data from CSV files using the psql '\copy' command.
- Captures load duration for:
    * Each individual table
    * CRM tables as a group
    * ERP tables as a group
    * The overall Bronze layer load
- Executes all operations inside a transaction to ensure consistency.

Implementation Notes:
- This is NOT a stored procedure.
- The script is intended to be executed via the psql client.
- Client-side commands such as '\copy', '\echo', and '\gset' are used.
- Timing is captured using PostgreSQL's 'clock_timestamp()'.

Parameters:
None.
This script does not accept input parameters and does not return values.

Usage Example:
psql -d DataWarehouse -f bronze_load.sql
-- OR inside psql:
\i 'D:/Pratik/Data Engineer/bronze_load.sql'

==============================================================================
*/



\set ON_ERROR_STOP on

-- =====================================================
-- Overall Bronze Load Start Time
-- =====================================================
SELECT clock_timestamp() AS bronze_start_time \gset

BEGIN;

\echo 'Loading Bronze Layer'

-- =====================================================
-- CRM TABLES
-- =====================================================
\echo '--------------------------------'
\echo 'Loading CRM Tables'
\echo '--------------------------------'

SELECT clock_timestamp() AS crm_start_time \gset


-- -----------------------------------------------------
-- bronze.crm_cust_info
-- -----------------------------------------------------
\echo 'Truncating & Loading: bronze.crm_cust_info'

SELECT clock_timestamp() AS start_time \gset
TRUNCATE TABLE bronze.crm_cust_info;
\copy bronze.crm_cust_info FROM 'D:/Pratik/Data Engineer/datasets/source_crm/cust_info.csv' CSV HEADER;
SELECT clock_timestamp() AS end_time \gset

SELECT
    :'end_time'::timestamp - :'start_time'::timestamp
    AS crm_cust_info_total_time;


-- -----------------------------------------------------
-- bronze.crm_prd_info
-- -----------------------------------------------------
\echo 'Truncating & Loading: bronze.crm_prd_info'

SELECT clock_timestamp() AS start_time \gset
TRUNCATE TABLE bronze.crm_prd_info;
\copy bronze.crm_prd_info FROM 'D:/Pratik/Data Engineer/datasets/source_crm/prd_info.csv' CSV HEADER;
SELECT clock_timestamp() AS end_time \gset

SELECT
    :'end_time'::timestamp - :'start_time'::timestamp
    AS crm_prd_info_total_time;


-- -----------------------------------------------------
-- bronze.crm_sales_details
-- -----------------------------------------------------
\echo 'Truncating & Loading: bronze.crm_sales_details'

SELECT clock_timestamp() AS start_time \gset
TRUNCATE TABLE bronze.crm_sales_details;
\copy bronze.crm_sales_details FROM 'D:/Pratik/Data Engineer/datasets/source_crm/sales_details.csv' CSV HEADER;
SELECT clock_timestamp() AS end_time \gset

SELECT
    :'end_time'::timestamp - :'start_time'::timestamp
    AS crm_sales_details_total_time;


-- -----------------------------------------------------
-- CRM TOTAL TIME
-- -----------------------------------------------------
SELECT clock_timestamp() AS crm_end_time \gset

SELECT
    :'crm_end_time'::timestamp - :'crm_start_time'::timestamp
    AS crm_total_time;


-- =====================================================
-- ERP TABLES
-- =====================================================
\echo '--------------------------------'
\echo 'Loading ERP Tables'
\echo '--------------------------------'

SELECT clock_timestamp() AS erp_start_time \gset


-- -----------------------------------------------------
-- bronze.erp_cust_az12
-- -----------------------------------------------------
\echo 'Truncating & Loading: bronze.erp_cust_az12'

SELECT clock_timestamp() AS start_time \gset
TRUNCATE TABLE bronze.erp_cust_az12;
\copy bronze.erp_cust_az12 FROM 'D:/Pratik/Data Engineer/datasets/source_erp/cust_az12.csv' CSV HEADER;
SELECT clock_timestamp() AS end_time \gset

SELECT
    :'end_time'::timestamp - :'start_time'::timestamp
    AS erp_cust_az12_total_time;


-- -----------------------------------------------------
-- bronze.erp_loc_a101
-- -----------------------------------------------------
\echo 'Truncating & Loading: bronze.erp_loc_a101'

SELECT clock_timestamp() AS start_time \gset
TRUNCATE TABLE bronze.erp_loc_a101;
\copy bronze.erp_loc_a101 FROM 'D:/Pratik/Data Engineer/datasets/source_erp/loc_a101.csv' CSV HEADER;
SELECT clock_timestamp() AS end_time \gset

SELECT
    :'end_time'::timestamp - :'start_time'::timestamp
    AS erp_loc_a101_total_time;


-- -----------------------------------------------------
-- bronze.erp_px_cat_g1v2
-- -----------------------------------------------------
\echo 'Truncating & Loading: bronze.erp_px_cat_g1v2'

SELECT clock_timestamp() AS start_time \gset
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
\copy bronze.erp_px_cat_g1v2 FROM 'D:/Pratik/Data Engineer/datasets/source_erp/px_cat_g1v2.csv' CSV HEADER;
SELECT clock_timestamp() AS end_time \gset

SELECT
    :'end_time'::timestamp - :'start_time'::timestamp
    AS erp_px_cat_g1v2_total_time;


-- -----------------------------------------------------
-- ERP TOTAL TIME
-- -----------------------------------------------------
SELECT clock_timestamp() AS erp_end_time \gset

SELECT
    :'erp_end_time'::timestamp - :'erp_start_time'::timestamp
    AS erp_total_time;


COMMIT;


-- =====================================================
-- Overall Bronze Load End Time
-- =====================================================
SELECT clock_timestamp() AS bronze_end_time \gset

SELECT
    :'bronze_end_time'::timestamp - :'bronze_start_time'::timestamp
    AS bronze_total_time;

\echo 'Bronze Layer Load Completed Successfully'
