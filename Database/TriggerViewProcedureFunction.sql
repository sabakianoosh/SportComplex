
--Trigger
/*
Alter table Person
add  ModifyDateTime datetime null
*/
/*
Create Trigger dbo.[Trg_Update] On dbo.Person
 After Update
 As Begin
Update Person Set ModifyDateTime = GETDATE()
Where Person.SSN = (Select d.SSN from deleted d)
End
*/
/*
Create Trigger dbo.[Trg_Insert] On dbo.Person
 After insert
 As Begin
Update Person Set ModifyDateTime = GETDATE()
Where Person.SSN = (Select d.SSN from deleted d)
End
*/
/*
update Person
set Age = 27
where SSN = 123698238
select * from Person
*/
/*
insert into Person
values (232891017, 'Neymar', 'JR', 25, 11, '19830217 00:00:00 AM','Male','')
select * from Person
*/

--View
/*
CREATE VIEW Summery AS
SELECT team_name, Points
FROM Team
WHERE Id = 1 or Id = 2
*/
--select * from Summery


/*
create view younge_players AS
select *
from Person
where Age < 25
*/

--Procedure
/*
create procedure FieldofTeam @team_name varchar(50)
as
select Team.Field_name from dbo.team where Team.Team_name = @team_name
*/

/*
EXEC FieldofTeam @team_name = 'Barca';
*/

/*
CREATE PROCEDURE Top5Team
AS
SELECT * from(select Team_name,Points,Field_name,
				ROW_NUMBER() over (partition by Field_name order by Points desc) as topteam
				from Team) ranks
				where ranks.topteam <= 5

*/
--EXEC Top5Team;
/*
CREATE PROCEDURE Captains_of_Leaders
AS
select distinct Person.Firstname, Person.Lastname
from
(
	SELECT Field.Field_name as 'Field name', (select top 1 team.Id
								from  dbo.team, dbo.Field
								where Team.Field_name = Field.Field_name
								order by team.points desc ) as 'leading team'
	from  dbo.team, dbo.Field
	where Team.Field_name = Field.Field_name
	group by Field.Field_name
) as leaders, dbo.Person, dbo.MemberOf
where leaders.[leading team] = MemberOf.team_Id and MemberOf.Person_SSN = Person.SSN 
*/
/*
EXEC Captains_of_Leaders 
*/
--Function
/*
CREATE FUNCTION FootballPlayers()  
RETURNS TABLE  
AS  
 RETURN ( Select Firstname,Lastname
from (
select *
	from dbo.team, dbo.Person, dbo.MemberOf
	where Team.Id = MemberOf.team_Id and Person.SSN = MemberOf.Person_SSN and Team.Field_name = 'Football'
) as players)  
*/

/*
select * from FootballPlayers()
*/

/*
CREATE FUNCTION Minus(  
    @num1 INT,  
    @num2 int   
)  
RETURNS DEC(10,2)  
AS   
BEGIN  
    RETURN abs(@num1-@num2);  
END;   
*/
/*
select Minus(10,2) as result
*/

/*
CREATE FUNCTION Young_Player( @age int, @month int)  
RETURNS TABLE  
AS    
    RETURN (
	select youngest_oct.Birthday
from
(
	select Person.Birthday, ROW_NUMBER() over (partition by Team.Team_name order by person.Age ASC) as age_rank
	from dbo.Person, dbo.Team, dbo.MemberOf
	where person.SSN = MemberOf.Person_SSN and MemberOf.team_Id = team.Id and person.Age <  @age and month(person.Birthday) >= @month
) as youngest_oct )
*/
/*
select * from Young_Player(21, 10) -- should return no data!
*/








