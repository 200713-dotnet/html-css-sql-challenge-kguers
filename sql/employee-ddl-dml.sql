use master;
go

create database EmployeeDb;
GO

use EmployeeDb;
go

create schema Employee;
GO


create table Employee.Employee
(
     EmployeeId tinyint primary key,
     FirstName nvarchar(250) not null,
     Lastname nvarchar(250) not null,
     SSN int not null,
     DeptId tinyint, 
);

create table Employee.Department
(
     DeptId tinyint primary key,
     [Name] nvarchar(250) not null,
     [Location] nvarchar(250) not null,
);

create table Employee.EmpDetails
(
     DetailsId tinyint primary key,
     EmployeeId tinyint,
     Salary money not null,
     Address1 nvarchar(250) not null,
     Address2 nvarchar(250) not null,
     City nvarchar(250) not null,
     [State] nvarchar(250) not null,
     Country nvarchar(250) not null,
);

alter table Employee.Employee
     add constraint FK_Employee_DeptId foreign key (DeptId) references Employee.Department(DeptId);

alter table Employee.EmpDetails
     add constraint FK_Employee_EmployeeId foreign key (EmployeeId) references Employee.Employee(EmployeeId);  


insert into Employee.Employee(EmployeeId, FirstName, LastName, SSN, DeptId)
values (1,'Tina', 'Smith', 111-22-3333, 1)

insert into Employee.Department([Name], [Location])
values ('Marketing', 'Pottsville')

insert into Employee.EmpDetails(DetailsId, Salary, Address1, Address2, City, [State], Country)
values (1,90000, '123 Main St.', 'Apt. 45', 'Shenandoah', 'VA', 'US')

select * from Employee.Employee

