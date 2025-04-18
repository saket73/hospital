# hospital

🏥 Hospital Management System – DBMS Mini Project

👤 Name: Saket Singh
🎓 UID: 23BCA10351
🏫 Section: 4B
**Course**: BCA 4th Semester  
**Subject**: Database Management System  
**Technology Used**: MySQL


📌 Project Overview
The Hospital Management System is a mini-project designed to simulate the core functionalities of a hospital database. Built using SQL, this project manages information related to patients, doctors, appointments, medications, and prescriptions in a structured and relational manner.

It serves as an academic DBMS project demonstrating the use of relational databases, entity relationships, constraints, and query handling within a medical context.

🔧 How It Works
The database includes five interconnected tables that represent the core elements of hospital operations:

1. Patients Table
   Stores personal information such as patient ID, name, age, gender, and contact number.

2. Doctors Table
   Records details about doctors including their ID, name, specialization, contact number, and department.

3. Appointments Table
   Maps patient visits to doctors on specific dates, including reasons for the visits. This table connects both patients and doctors through foreign keys.

4. Medications Table
   Contains information about available medicines, including name, type, dosage, and price.

5. Prescriptions Table
   Links appointments to specific medications, capturing dosage instructions and duration. This is crucial for tracing treatment records.

🔄 Features Implemented
- Database Creation & Table Design: Five normalized tables with proper primary keys and foreign key constraints to ensure relational integrity.
- Data Insertion: Each table is populated with sample data (10 entries per table) for realistic simulation.
- Relational Mapping: Uses foreign key constraints to map patients to appointments, doctors to appointments, and prescriptions to medications.
- Query Execution (20+ Queries): Includes a variety of SQL queries such as:
  • Filtering data using WHERE, LIKE, and BETWEEN
  • Aggregation using COUNT, AVG, and GROUP BY
  • Joins across multiple tables for detailed reporting
  • Sorting and limiting results for advanced data retrieval
  • Subqueries for data filtering and validation

🎯 Learning Objectives
- Understand relational schema design and normalization
- Practice creating and managing databases in SQL
- Implement real-world data relationships using constraints
- Perform data retrieval using complex SQL queries
- Build structured database projects suitable for real applications

📂 Project Contents
- SQL script to create the database, tables, and insert data
- A wide range of SQL queries for various functionalities
- A well-documented project report (optional)
- ER diagram showing entity relationships and structure (optional)

✅ Use Cases
- Academic demonstration of DBMS principles
- Prototype for hospital database systems
- Practice resource for SQL learning and project documentation

📄 License
This project is developed for educational purposes and is open for academic use.
