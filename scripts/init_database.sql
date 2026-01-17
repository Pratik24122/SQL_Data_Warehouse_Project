/*
=============================================================
Create Database and Schemas (PostgreSQL)
=============================================================
Script Purpose:
    This script creates a new database named 'datawarehouse'.
    If the database already exists, all active connections are terminated,
    the database is dropped, and then recreated.

    After creation, three schemas are created within the database:
    - bronze
    - silver
    - gold

WARNING:
    Running this script will drop the entire 'datawarehouse' database if it exists.
    All data will be permanently deleted.
    Ensure proper backups before execution.
=============================================================
*/

-- ===========================================================
-- STEP 1: Terminate existing connections (run from postgres db)
-- ===========================================================
DO
$$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM pg_database
        WHERE datname = 'datawarehouse'
    ) THEN
        PERFORM pg_terminate_backend(pid)
        FROM pg_stat_activity
        WHERE datname = 'datawarehouse'
          AND pid <> pg_backend_pid();
    END IF;
END
$$;

-- ==========================
-- STEP 2: Drop database
-- ==========================
DROP DATABASE IF EXISTS datawarehouse;

-- ==========================
-- STEP 3: Create database
-- ==========================
CREATE DATABASE datawarehouse;

-- ======================================================
-- STEP 4: Connect to database (run in client / tool)
-- ======================================================
-- \c datawarehouse;

-- ==========================
-- STEP 5: Create schemas
-- ==========================
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;

