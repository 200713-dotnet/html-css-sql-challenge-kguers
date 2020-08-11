use master;
go

create database EmployeeDb;
GO

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

   