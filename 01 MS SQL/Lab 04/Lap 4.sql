/*1*/
SELECT d.Dependent_name ,d.Sex,e.fname,e.sex
from Dependent d , Employee e 
where e.SSN = d.ESSN and d.Sex = 'f' and e.sex='f'
Union 
SELECT d.Dependent_name ,d.Sex,e.Fname,e.Sex
from Dependent d , Employee e
where e.SSN = d.ESSN and d.Sex = 'm'and e.sex='m'
/*2*/
select p.Pname ,sum(Hours) as Total_Hour
from Employee E , Project P , Works_for 
where E.Dno = P.Dnum and E.SSN = Works_for.ESSn 
group by p.Pname 
/*3*/
select d.*
from Departments d , Employee e
where d.Dnum=e.Dno and
ssn=(select min(ssn) from Employee e)
/*4*/
select dname,max(salary),min(salary),avg(salary)
from Employee,Departments
where Dno=Dnum group by dname
/*5*/
SELECT Employee1.FName, Employee1.LName
FROM Employee Employee1
LEFT JOIN Dependent
ON Employee1.SSN = Dependent.ESSN WHERE Dependent.ESSN IS NULL;
/*6*/
select COUNT(*),dname ,dno from Employee E , Departments D
where E.Dno = D.Dnum
having avg(Salary) < (select( avg(Salary)))

/*7*/
SELECT Lname, Fname, Pname
FROM Employee E ,Departments D, Project P
where d.Dnum=e.Dno and d.Dnum= P.Dnum
ORDER BY d.Dname, fName, lName
/*8*/
SELECT FName, LName, Salary
FROM (
  SELECT ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum, FName, LName, Salary
  FROM Employee
) AS EmployeeWithRowNum
WHERE RowNum <= 2

/*9*/
select fname + ' ' + Lname from Employee where exists (select Essn from Dependent)
/*10*/
select fname, lname,ssn from Employee
where exists (select ssn,essn from Employee, Dependent where ssn=essn)
/*11*/
insert into Departments(Dname,Dnum,MGRSSN,"MGRStart Date")
values('Dept IT',100,112233,'1/11/2006')

/* 12 */
Update Departments set MGRSSN = 968574
where Dnum=100

Update Departments set MGRSSN = 102672
where Dnum=20

Update Employee set Superssn = 102672
where SSN=102660
/*13*/
Delete from works_for where ESSn=223344
update Departments set MGRSSN=102675 where MGRSSN=223344 
delete from Dependent where ESSN =223344
update Employee set Superssn = 102672 where Superssn = 223344
delete from Employee where ssn = 223344

/*14*/
UPDATE Employee SET Salary = Salary * 1.3
from Employee,Project,Works_for
where Pname = Pnumber and ESSN = SSN and Pname = 'Al Rabwah'
