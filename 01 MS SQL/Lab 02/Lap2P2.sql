--1
select * from Employee
--2
select Fname , Lname , Salary ,Dno  from Employee
--3
select pname , Plocation , Dnum from Project
--4
SELECT Fname +' '+ Lname AS full_name,
       salary * 0.1 AS commission FROM Employee;
--5
select Fname , Lname ,SSN, Salary ,Dno  from Employee
WHERE Salary > 1000;
--6
select Fname , Lname ,SSN, Salary ,
Dno,salary * 12 AS Annually_salary from Employee
WHERE salary * 12  > 10000;
--7
select Fname , Lname ,Sex, Salary from Employee
WHERE Sex = 'F'
--8
select Dname , Dnum  ,MGRSSN from Departments
WHERE MGRSSN = 968574
--9
select Pname , Pnumber, Plocation,Dnum from Project
WHERE Dnum = 10