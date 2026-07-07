# 🏥 Healthcare Management System | SQL + Python + Power BI

A complete end-to-end **Healthcare Management System** built using **MySQL**, **Python**, and **Power BI**. This project simulates a real hospital database by generating realistic healthcare data, performing SQL-based business analysis, and visualizing key insights through an interactive Power BI dashboard.

The project demonstrates the complete data analytics workflow—from database design and synthetic data generation to SQL analysis and dashboard development.

---

## 📌 Project Overview

Healthcare organizations generate large amounts of data every day, including patient registrations, appointments, prescriptions, billing, and payments.

This project recreates a real-world hospital management system by:

- Designing a normalized relational database in MySQL
- Generating realistic healthcare datasets using Python
- Performing SQL analysis using 60 business queries
- Building an interactive Power BI dashboard for healthcare analytics

---

## 🚀 Tech Stack

- **Database:** MySQL
- **Programming Language:** Python
- **Libraries:** Faker, Pandas, NumPy
- **Visualization:** Power BI
- **Query Language:** SQL
- **IDE:** VS Code, MySQL Workbench

---

# 📂 Project Structure

```text
Healthcare-Management-System/
│
├── Data/
│   ├── schema.sql
│   ├── tables.sql
│   ├── basic_queries.sql
│   ├── intermediate_queries.sql
│   └── advanced_queries.sql
│
├── Dataset/
│   ├── appointments.csv
│   ├── bills.csv
│   ├── departments.csv
│   ├── doctors.csv
│   ├── medical_records.csv
│   ├── medicines.csv
│   ├── patients.csv
│   ├── payments.csv
│   └── prescriptions.csv
│
├── Images/
│   ├── healthcare_er_diagram.png
│   ├── Executive Dashboard.png
│   ├── Patient Analytics.png
│   ├── Doctor Analytics.png
│   └── Billing & Revenue.png
│
├── PowerBI/
│   └── Healthcare_Management_System.pbix
│
├── Python/
│   ├── generate_data.py
│   ├── config.py
│   └── requirements.txt
│
└── README.md
```

---

# 🏥 Database Modules

The database consists of **9 relational tables**.

| Table | Description |
|---------|------------|
| Departments | Hospital departments |
| Doctors | Doctor information |
| Patients | Patient information |
| Medicines | Medicine inventory |
| Appointments | Appointment records |
| MedicalRecords | Diagnosis and treatment |
| Prescriptions | Prescribed medicines |
| Bills | Billing information |
| Payments | Payment details |

---

# 🗂 Database Schema

The database follows a normalized relational design with proper primary and foreign key relationships.

### ER Diagram

<img width="1536" height="1024" alt="healthcare_er_diagram" src="https://github.com/user-attachments/assets/4eafe070-0ce9-4734-a8a9-b3dc8600634e" />


---

# 🔄 Project Workflow

```text
Database Design
        │
        ▼
Python Dataset Generation
        │
        ▼
CSV Files
        │
        ▼
MySQL Database
        │
        ▼
SQL Analysis
        │
        ▼
Power BI Dashboard
```

---

# 📊 Dataset Information

| Table | Records |
|---------|---------:|
| Departments | 10 |
| Doctors | 120 |
| Patients | 5,000 |
| Medicines | 50 |
| Appointments | 15,000 |
| Medical Records | Generated from completed appointments |
| Prescriptions | Generated dynamically |
| Bills | Generated dynamically |
| Payments | Generated dynamically |

---

# 📈 SQL Analysis

The project contains **60 SQL Queries** categorized into three levels.

## Basic SQL

Topics Covered

- SELECT
- WHERE
- DISTINCT
- ORDER BY
- LIMIT
- Aggregate Functions
- Date Filtering

---

## Intermediate SQL

Topics Covered

- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- CASE
- Subqueries
- Date Functions
- String Functions

---

## Advanced SQL

Topics Covered

- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LEAD()
- LAG()
- Running Totals
- Moving Average
- Business Analytics

---

# 📊 Power BI Dashboard

The dashboard consists of multiple pages designed for different business users.

## 🏥 Executive Dashboard

Provides an overview of hospital performance.

**KPIs**

- Total Patients
- Total Doctors
- Total Appointments
- Total Revenue
- Completed Appointments
- Average Bill

<p align="center">
<img src="Images/Executive Dashboard.png">
</p>

---

## 👤 Patient Analytics

Provides patient demographic and clinical insights.

**Visuals**

- Age Distribution
- Blood Group Distribution
- Patients by City
- Top Diagnoses
- Most Prescribed Medicines
- Visit Type Analysis

<p align="center">
<img src="Images/Patient Analytics.png">
</p>

---

## 👨‍⚕️ Doctor Analytics

Analyzes doctor productivity and department performance.

**Visuals**

- Top Doctors by Revenue
- Top Doctors by Appointments
- Department Revenue
- Appointment Status
- Experience Distribution
- Consultation Fee Analysis

<p align="center">
<img src="Images/Doctor Analytics.png">
</p>

---

# 📌 Key Business Insights

The dashboard helps answer questions such as:

- Which department generates the highest revenue?
- Which doctors handle the most appointments?
- Which diagnoses are most common?
- Which medicines are prescribed the most?
- Which cities contribute the highest number of patients?
- What is the hospital's appointment completion rate?
- Which payment method is used most frequently?
- What are the monthly appointment and revenue trends?

---

# 📈 Skills Demonstrated

### SQL

- Database Design
- Data Modeling
- Joins
- Aggregate Functions
- Window Functions
- CTEs
- Business Queries

### Python

- Synthetic Data Generation
- Data Cleaning
- Automation
- CSV Export

### Power BI

- Data Modeling
- Relationships
- DAX Measures
- Interactive Dashboards
- KPI Cards
- Slicers
- Drill-down Analysis

---

# 📚 Learning Outcomes

- Designed a normalized healthcare database
- Generated realistic synthetic healthcare data
- Built analytical SQL queries
- Created interactive dashboards in Power BI
- Applied business intelligence techniques to healthcare operations

---

# ⭐ Future Improvements

- Role-based login system
- Live database connectivity
- Predictive patient analytics
- Appointment scheduling optimization
- Machine Learning for disease prediction
- Real-time dashboard updates

---

# 👨‍💻 Author

**Garbhit Maheshwari**

B.Tech CSE (AI & ML)


---

If you found this project useful, consider giving it a ⭐ on GitHub.
