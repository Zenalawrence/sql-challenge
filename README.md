# sql-challenge

Pewlett Hackard (a fictional company) has requested some research done on employees from 1980 to 1990s.  This project requires the use of data modeling, data engineering and data analysis to design tables to hold data in the 6 CSV files and import them into a SQL database.

# Data Modeling
The six CSV files were inspected and an Entity Relationship Diagram was sketched using [QuickDBD](https://app.quickdatabasediagrams.com/#/).  The following diagram displays the relationship between all the tables.

![Employee ERD](<employees ERD.png>)



# Data Engineering

1.  Use the provided information to create a table schema for each of the six CSV files. Be sure to do the following:

        i. Remember to specify the data types, primary keys, foreign keys, and other constraints.

        ii. For the primary keys, verify that the column is unique. Otherwise, create a composite keyLinks to an external site., which takes two primary keys to uniquely identify a row.

        iii. Be sure to create the tables in the correct order to handle the foreign keys.

2.  Import each CSV file into its corresponding SQL table.



# Data Analysis

1. List the employee number, last name, first name, sex, and salary of each employee.

2. List the first name, last name, and hire date for the employees who were hired in 1986.

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

6. List each employee in the Sales department, including their employee number, last name, and first name.

7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
