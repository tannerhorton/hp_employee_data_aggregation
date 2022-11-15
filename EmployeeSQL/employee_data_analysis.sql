-- Ensure all tables were created and imported correctly 
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary from salaries
join employees on employees.emp_no = salaries.emp_no;

-- 2.List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees
where DATE_PART('year',hire_date) = 1986
order by hire_date;

-- 3.List manager of each dept with following info: dept number, dept name, manager's emp number, last name, first name.
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from  dept_manager inner join departments on departments.dept_no = dept_manager.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no;

-- 4.List department of each employee with the following info: employee number, last name, first name, and department name.
select departments.dept_no, departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name from departments
left join dept_emp on departments.dept_no = dept_emp.dept_no
left join employees on dept_emp.emp_no = employees.emp_no;

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select last_name, first_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no , employees.last_name , employees.first_name , departments.dept_name
from departments inner join dept_emp on departments.dept_no = dept_emp.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no 
where departments.dept_name='Sales' order by emp_no;

-- 7.List all employees in the Sales and Development depts, including: emp number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name='Sales' or departments.dept_name='Development'
order by emp_no;

-- (8) List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select last_name, count(last_name) as frequency from employees group by last_name order by frequency desc