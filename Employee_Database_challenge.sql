--Deliverable 1
--Retrieve emp_no, first_name, and last_name cloumns from Employees table
SELECT e.emp_no,
       e.first_name,
       e.last_name,


--Retrieve title, from_date, and to_date columns from Titles table
	   ti.title,
       ti.from_date,
       ti.to_date


--Join into retirement_titles table on primary key
INTO retirement_titles
FROM Employees as e
INNER JOIN Titles as ti
ON (e.emp_no = ti.emp_no)

--Filter birth_date column for employees born between 1952 and 1955, then order by number
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--Display retierment_titles table
SELECT * FROM retirement_titles

-------------------------------------------------------------------------------

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
                            first_name,
                            last_name,
                            title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--DIsplay unique_titles table
SELECT * FROM unique_titles

----------------------------------------------------------------------------------

--Retrieve the number of employees by thier most recent job title who are about to retire
--Retrieve number of titles from unique_titles table
SELECT COUNT(ut.emp_no), ut.title

--Creat retiring_titles table to hold the info
INTO retiring_titles
FROM unique_titles as ut

--Group the table by title then sort count column in descending order
GROUP BY title 
ORDER BY COUNT(title) DESC;

--Display retiring_titles table
SELECT * FROM retiring_titles

------------------------------------------------------------------------------------
--Deliverable 2
--Retrieve emp_no, first_name, last_name, and birth_date columns from employees table
SELECT DISTINCT ON(e.emp_no) e.emp_no,
                             e.first_name,
                             e.last_name,
                             e.birth_date,
--Retrieve from_date and to_date from department_employees
                            de.from_date,
                            de.to_date,
--Retrieve title column from titles table
                            ti.title
--Create mentorship_eligibility table
INTO mentorship_eligibility
FROM employees as e
--Join employees and department_employees on primary key
LEFT OUTER JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
--Join employees and titles on primary key
LEFT OUTER JOIN titles as t
ON (e.emp_no = t.emp_no)
--Filter to_date column to all current emplyoees then filter birth_date for employees born between 1/1/65 and 12/31/65
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
--Order table by employee number
ORDER BY e.emp_no;
--Display mentorship_eligibility table
SELECT * FROM mentorship_eligibility

                    