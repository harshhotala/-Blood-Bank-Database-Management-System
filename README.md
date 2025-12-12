<!-- ======================= PROJECT BANNER ======================= -->
<p align="center">
  <img src="images/banner.png" width="100%" alt="Blood Bank Database Banner">
</p>

<h1 align="center">🩸 Blood Bank Database Management System</h1>

<p align="center">
A complete SQL-based database project designed to manage operations of a real-world blood bank.
<br>
Showcasing relational modeling, normalization, analytics queries, and end-to-end database design.
</p>

<!-- ======================= BADGES ======================= -->
<p align="center">
  <img src="https://img.shields.io/badge/Database-MySQL-blue">
  <img src="https://img.shields.io/badge/Normalization-3NF%20%2F%20BCNF-green">
  <img src="https://img.shields.io/badge/Project-Type%3A%20Portfolio-orange">
  <img src="https://img.shields.io/badge/SQL-Database%20Design-red">
  <img src="https://img.shields.io/badge/Status-Completed-success">
</p>

---

## 📌 Project Overview

<details>
<summary><strong>Click to Expand</strong></summary>
<br>

This Blood Bank Database System is built to:

- Maintain donor and recipient information  
- Track blood donations and blood availability  
- Monitor hospitals and patient treatments  
- Manage volunteers and employees  
- Record medical equipment details  
- Ensure strong relational integrity using foreign keys  

This relational model reflects a **mini real-world healthcare logistics system**.

<br>

### ✔ System Highlights

- Normalized tables (All in **3NF / BCNF**)  
- Strong relational schema with foreign keys  
- ER diagram + functional dependencies  
- Complete SQL scripts (schema + dummy data)  
- Suitable for **Data Analyst / Data Engineer portfolios**  

Documentation contains schema design, dependencies, diagrams, and normalization steps.

</details>

---

## 🗂 Database Entities

<details>
<summary><strong>Click to Expand</strong></summary>
<br>

The project contains the following major tables:

- Blood Bank  
- Donor  
- Blood (Weak entity)  
- Hospital  
- Patient / Recipient  
- Employee  
- Volunteer  
- Medical Equipment  

Foreign keys maintain referential integrity between donors, patients, hospitals, volunteers, and blood banks.

</details>

---

## 🧰 Tech Stack

| Technology      | Purpose                                      |
|-----------------|----------------------------------------------|
| MySQL           | Database engine used for schema + data       |
| SQL (DDL + DML) | Table creation, constraints, inserts         |
| ERD             | Conceptual & logical database design         |
| Normalization   | Ensuring 3NF / BCNF compliance               |
| GitHub          | Version control & portfolio showcase         |

---

## 🧱 Database Features

<details>
<summary><strong>Click to Expand</strong></summary>
<br>

### ✔ Fully Normalized Schema  
Tables follow **3NF**, while the Blood Bank table is in **BCNF**, reducing redundancy and improving consistency.

### ✔ Strong Entity Relationships  
- Donor → Blood (1:M)  
- Blood Bank → Employee / Volunteer / Equipment (1:M)  
- Hospital → Patient (1:M)  
- Donor → Recipient (M:N via blood mapping)  

### ✔ Complete SQL Script Includes  
- Table creation (DDL)  
- Primary & foreign key constraints  
- Composite keys  
- Insert statements (DML)  
- Timestamp + Date fields  

</details>

---

## 📊 ER Diagram

<p align="center">
  <img src="images/ER_Diagram.png" width="90%" alt="ER Diagram">
</p>

> Make sure to place the image in:  
> **/images/ER_Diagram.png**

---

## 🔍 Sample Analytics Queries

<details>
<summary><strong>Click to Expand</strong></summary>
<br>

### 1️⃣ Check available blood stock by group  
```sql
SELECT blood_group, SUM(quantity_ml) AS total_quantity
FROM blood
GROUP BY blood_group;
```
###2️⃣ Find top donating blood banks
```sql
SELECT b.city, COUNT(d.donor_id) AS total_donors
FROM blood_bank b
JOIN donor d ON b.blood_bank_id = d.blood_bank_id
GROUP BY b.city
ORDER BY total_donors DESC;
```

###3️⃣ Patients who received more than 500ml
```sql
SELECT patient_name, quantity
FROM patient
WHERE quantity > 500;
```
###4️⃣ Employees with salary above the average
```sql
SELECT employee_name, salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);
```

</details>


##🚀 Future Enhancements
<details>
<summary><strong>Click to Expand</strong></summary>
<br>
	•	Add stored procedures (e.g., auto-assign donor to recipient)
	•	Add triggers (e.g., auto-update blood stock)
	•	Create SQL views (e.g., Available Blood Stock)
	•	Build a UI dashboard using Flask / Django
	•	Connect MySQL to Power BI dashboards
	•	Integrate Python analytics workflows
	</details>
<p align="center">
⭐ If you like this project, feel free to star the repository! ⭐
</p>
```
