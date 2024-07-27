# School Analytics Repository

## Overview

This repository contains data analytics of exam results, including details about students, teachers, and marks. It features SQL scripts and a Power BI report for comprehensive analysis. The tools used for this project were T-SQL and Power BI.

## Repository Structure

The repository is organized into the following folders and files:

### 1. SQL Scripts
This folder contains all SQL scripts necessary for database setup and maintenance:
- **alter_tables**: Scripts for altering existing tables.
- **views**: SQL views for data aggregation and simplification.
- **triggers**: Triggers to automate database tasks.
- **functions**: Custom functions for specific data operations.
- **procedures**: Stored procedures for complex data processing.
- **create_db_tables**: Scripts to create initial database tables.
- **insert_data**: Scripts to insert raw data into tables.
- **indexes**: Scripts for creating indexes to optimize database performance.

### 2. Raw Data
This folder includes the raw data used for analysis:
- **teachers**: Data related to teachers.
- **students**: Student details and records.
- **marks**: Exam marks and results.
- **subjects**: Information about the subjects.

### 3. Power BI Reports and Dashboards
This folder contains Power BI reports and dashboards for data visualization:
- **School Analytics.pbix**: The Power BI report file for school analytics.
- **School Analytics.pdf**: A PDF version of the school analytics report.
- **Screenshots**: Visual snapshots of the Power BI dashboards:
  - **Kenya Student and Staff Overview Dashboard**: An overview dashboard for students and staff in Kenya.

### 4. Snowflake Schema
- **Snowflake Schema Diagram**: Diagram representing the snowflake schema used for organizing the data warehouse.

## Detailed Description

This repository provides a complete framework for analyzing school exam results, from raw data ingestion to advanced data visualization. It includes:

- **Database Management**: SQL scripts for creating and maintaining database structures, including tables, views, triggers, and functions.
- **Data Ingestion**: Scripts to insert and manage raw data related to school operations.
- **Data Analysis**: Power BI reports that offer insights into the academic performance and demographics of students and teachers.
- **Visualization**: Dashboards that provide an at-a-glance view of key performance indicators (KPIs) and metrics.

## How to Use

1. **Set Up the Database**:
   - Use the scripts in the `create_db_tables` folder to set up the initial database structure.
   - Run the scripts in the `insert_data` folder to populate the database with raw data.

2. **Database Maintenance**:
   - Utilize the scripts in `alter_tables`, `views`, `triggers`, `functions`, `procedures`, and `indexes` to maintain and optimize the database.

3. **Data Analysis**:
   - Open the `School Analytics.pbix` file in Power BI Desktop to explore the detailed analytics report.
   - Refer to the `School Analytics.pdf` for a static, printable version of the report.

4. **Visualizations**:
   - Review the screenshot in the `Screenshots` folder to get a quick overview of the student and staff performance dashboard.
