use master;
go

drop database if exists my_test_db;
go

create database my_test_db;
go


use my_test_db;
go

--create the table

drop table if exists calendar;
go

create table calendar (
   ID int IDENTITY(1,1) PRIMARY KEY,
   [description] varchar(200),
   [year] int
);
go

--seed the data

delete from calendar;
go

insert into calendar ([description], [year]) values ('event 1', 1998);
insert into calendar ([description], [year]) values ('event 2', 1999);
insert into calendar ([description], [year]) values ('event 3', 1997);
insert into calendar ([description], [year]) values ('event 4', 1996);

--select * from calendar;
go

--create the sp
drop procedure if exists displayActiveEvents;
go

CREATE PROCEDURE displayActiveEvents
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * from calendar;
END
GO

--execute the procedure
exec displayActiveEvents;
go