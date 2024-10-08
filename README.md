# School Analytics Repository

## Overview
This repository contains data analytics of exam results, including details about students, teachers, and marks. It features SQL scripts and a Power BI report for comprehensive analysis. The tools used for this project include T-SQL, Power BI, and Microsoft Fabric (Synapse Data Warehouse). The pipeline implements an ETL (Extract, Transform, Load) process, where data is extracted from SQL Server, transformed using Dataflow Gen2, and then loaded into the data warehouse for further analysis and visualization.

## Table of Contents
- [Repository Structure](#repository-structure)
- [Detailed Description](#detailed-description)
- [Database and Tools](#database-and-tools)
- [How to Use](#how-to-use)

## Repository Structure
The repository is organized into the following folders and files:

1. **SQL Scripts**  
   This folder contains all SQL scripts necessary for database setup and maintenance:
   - **alter_tables:** Scripts for altering existing tables.
   - **views:** SQL views for data aggregation and simplification.
   - **triggers:** Triggers to automate database tasks.
   - **functions:** Custom functions for specific data operations.
   - **procedures:** Stored procedures for complex data processing.
   - **create_db_tables:** Scripts to create initial database tables.
   - **insert_data:** Scripts to insert raw data into tables.
   - **indexes:** Scripts for creating indexes to optimize database performance.

2. **Database**  
   This folder contains the SQL file for creating the database:
   - **school_exams_database.sql:** Complete SQL script to create and populate the school exams database.

3. **Raw Data**  
   This folder includes the raw data used for analysis:
   - **teachers:** Data related to teachers.
   - **students:** Student details and records.
   - **marks:** Exam marks and results.
   - **subjects:** Information about the subjects.

4. **Power BI Reports and Dashboards**  
   This folder contains Power BI reports and dashboards for data visualization:
   - **School Analytics.pbix:** The Power BI report file for school analytics.
   - **School Analytics.pdf:** A PDF version of the school analytics report.
   - **Screenshots:** Visual snapshots of the Power BI dashboards:
     - **Kenya Student and Staff Overview Dashboard:** An overview dashboard for students and staff in Kenya.

5. **ETL Process Diagrams**  
   This folder contains diagrams related to the ETL process:
   - **dataflow_diagram:** Screenshot of the dataflow diagram representing data movement during the ETL process.
   - **pipeline_diagram:** Screenshot of the pipeline diagram representing ETL activities and data orchestration.

6. **SQL Server Jobs**  
   This folder includes SQL scripts used for automating routine database tasks:
   - **monthly_full_backup_school.sql:** Script for performing monthly full backups of the school database.
   - **weekly_differential_backup_school.sql:** Script for performing weekly differential backups, capturing changes since the last full backup.
   - **weekly_insert_school_marks.sql:** Script for weekly data inserts into the marks-related tables.

## Detailed Description
This repository provides a complete framework for analyzing school exam results, from raw data ingestion to advanced data visualization. It includes:

- **Database Management:** SQL scripts for creating and maintaining database structures, including tables, views, triggers, and functions.
- **ETL Process:** Diagrams that showcase how data is extracted, transformed, and loaded into the data warehouse.
- **Data Ingestion:** Scripts to insert and manage raw data related to school operations.
- **Data Analysis:** Power BI reports that offer insights into the academic performance and demographics of students and teachers.
- **Visualization:** Dashboards that provide an at-a-glance view of key performance indicators (KPIs) and metrics.

## Database and Tools

### Database
The database for this project is designed using SQL Server, with scripts provided to create and populate the necessary tables and structures for school data analysis.

### Tools Used
- **SQL Server Management Studio (SSMS):** Used for managing the SQL Server database, executing T-SQL scripts, and performing database maintenance tasks.
- **Power BI:** Utilized for creating interactive and visually appealing reports and dashboards, providing insights into school data.
- **Microsoft Fabric (Synapse Data Warehouse):** Used for data flow and pipeline orchestration within a cloud data warehouse environment.

## How to Use

### Set Up the Database

#### Prerequisites:
- SQL Server 2016 or higher.
- SQL Server Management Studio (SSMS) installed.
- Power BI Desktop installed.

#### Instructions:
1. Open the `school_exams_database.sql` file in SQL Server Management Studio (SSMS).
2. Execute the script to create the database, tables, and insert the data.

### Database Maintenance
Utilize the scripts in `alter_tables`, `views`, `triggers`, `functions`, `procedures`, and `indexes` to maintain and optimize the database.

### Data Analysis
- Open the `School Analytics.pbix` file in Power BI Desktop to explore the detailed analytics report.
- Refer to the `School Analytics.pdf` for a static, printable version of the report.

### Visualizations
Review the screenshots in the `Screenshots` folder to get a quick overview of the student and staff performance dashboard.

### SQL Server Jobs
- **Monthly Full Backup:** The `monthly_full_backup_school.sql` script automates a full backup of the database every month, preserving the entire database state.
- **Weekly Differential Backup:** The `weekly_differential_backup_school.sql` script automates weekly differential backups, capturing any changes since the last full backup.
- **Weekly Data Insert:** The `weekly_insert_school_marks.sql` script automates the weekly insertion of exam marks into the relevant tables.
