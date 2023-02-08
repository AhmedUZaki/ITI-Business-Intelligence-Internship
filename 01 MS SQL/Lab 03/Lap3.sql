--1.Display the Department id, name and id and the name of its manager.
SELECT Departments.Dnum,Departments.Dname ,Employee.SSN,
Employee.FName + ' ' + Employee.LName AS ManagerName FROM Departments
JOIN Employee ON Employee.SSN = Departments.MGRSSN 

--2.Display the name of the departments and the name of the projects under its control.
SELECT Dname ,Pname 
FROM Departments D, Project P
where D.Dnum = P.Dnum

SELECT Departments.Dname AS DepartmentName, Project.Pname AS ProjectName
FROM Departments JOIN Project ON Departments.Dnum = Project.Dnum;

/*3.Display the full data about all the dependence associated
with the name of the employee they depend on him/her.-- */
SELECT Employee.FName + ' ' + Employee.LName AS EmployeeName , Dependent.*
FROM Employee JOIN Dependent ON Employee.SSN = Dependent.ESSN;

/*4.Display the Id, name and location of the projects in Cairo or Alex city.*/
SELECT Pname , Pnumber, City from project
WHERE Project.City IN ('Cairo', 'Alex');

/*5.Display the Projects full data of the projects with a name starts with "a" letter.*/
SELECT * FROM Project
WHERE Pname LIKE 'A%';

/*6.display all the employees in department 30 whose salary from 1000 to 2000 LE monthly*/
SELECT FName, LName,Salary, Dno FROM Employee
WHERE Dno = 30 AND Employee.Salary BETWEEN 1000 AND 2000;

/*7.Retrieve the names of all employees in department 10
who works more than or equal 10 hours per week on "AL Rabwah" project*/
SELECT Fname, Lname FROM Employee
INNER JOIN Works_for ON Employee.SSN = Works_for.ESSN
INNER JOIN Project ON Works_for.Pno = Project.Pnumber
WHERE Dno= 10 AND Project.Pname = 'AL Rabwah' AND Works_for.Hours >= 10;

/*8.Find the names of the employees who directly supervised with Kamel Mohamed.*/
SELECT FName, LName FROM Employee
WHERE Employee.Superssn = (SELECT Employee.SSN
                         FROM Employee
                         WHERE Employee.FName = 'Kamel' AND Employee.LName = 'Mohamed');

SELECT E.FName +' '+ E.LName as EmployeeName,
S.FName+' '+ S.LName as supervisor 
FROM Employee E ,  Employee S 
WHERE E.superssn =S.SSN  And S.FName = 'Kamel' AND S.LName = 'Mohamed' ;

SELECT E.FName +' '+ E.LName as EmployeeName,
S.FName+' '+ S.LName as supervisor 
FROM Employee E ,  Employee S 
WHERE S.superssn =E.SSN  And S.FName = 'Kamel' AND S.LName = 'Mohamed' ;

/*9.Retrieve the names of all employees and 
the names of the projects they are working on, sorted by the project name.*/
select fname,lname, pname from Employee , Project ,Works_for
where Pno = Pnumber and ESSn = SSN
order by Pname
/*10.For each project located in Cairo City , 
find the project number, the controlling department name ,
the department manager last name ,address and birthdate.*/
select pnumber,Dname,Fname,Lname,Address,BDate
from Departments D, Project P, Employee E
where City ='Cairo'  and SSN = mgrssn and p.Dnum = D.Dnum

/*11.Display All Data of the managers*/
Select * from Departments 
join Employee on MGRSSN = SSN

/*12.Display All Employees data and the data of their dependents 
even if they have no dependents*/
Select * from Employee 
left join Dependent on SSN = ESSN

/*13.Insert your personal data to the employee table as a new employee in
department number 30, SSN = 102672, Superssn = 112233, salary=3000.*/
insert into Employee 
(Fname, Lname, SSN,Bdate, Address, Sex, Salary, Superssn, Dno)
values ('Ahmed', 'Zaki', 102672,23/12/2000, 'Mansoura', 'M', 3000, 112233, 30)

/*14.Insert another employee with personal data your friend as new employee in
department number 30, SSN = 102660, but don’t enter any value for 
salary or supervisor number to him.*/
insert into Employee 
(Fname, Lname, SSN,Bdate, Address, Sex, Dno)
values ('Mohamed', 'Zaki', 102660,23/1/2000, 'Mansoura', 'M', 30)

/*15.Upgrade your salary by 20 % of its last value.*/
update Employee
set salary = salary * 1.2
where ssn=112233