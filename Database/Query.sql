use master

/*
--Query1
select SSN,Firstname,Lastname from dbo.Spectator where Lastname like '%s%'
*/
/*
--Query2
select * from dbo.Game where month(Game_date) between 2 and 9
*/

/*
--Query3
select team.Field_name from dbo.team where team.Team_name = 'Manchester City'
*/

/*
--Query4
select * from dbo.Game where Game.Sans = 'Afternoon'
*/

/*
--Query5
select Firstname,Lastname,Age from dbo.Person
*/

/*
--Query6
select team.name
from dbo.person, dbo.team, dbo.MemberOf
	where person.SSN = MemberOf.Person_SSN and MemberOf.team_Id = team.Id 
	and person.Firstname = 'Manuel' and person.Lastname = 'Neuer'
*/

/*
--Query7
select person.SSN
from dbo.person, dbo.team, dbo.MemberOf
where person.SSN = MemberOf.Person_SSN and MemberOf.team_Id = team.Id and team.name = 'Milan'
*/

/*
--Query8
select Person.Firstname, Person.Lastname
from
(
	SELECT Field.Field_name as 'Field name', (select top 1 team.Id
								from  dbo.team, dbo.Field
								where Team.Field_name = Field.Field_name
								order by team.points asc ) as 'leading team'
	from  dbo.team, dbo.Field
	where Team.Field_name = Field.Field_name
	group by Field.Field_name
) as leaders, dbo.Person, dbo.MemberOf
where leaders.[leading team] = MemberOf.team_Id and MemberOf.Person_SSN = Person.SSN and MemberOf.Is_Captain = '1'

--OR
select *
from
(
	SELECT Person.Firstname,Person.Lastname, Field.Field_name as 'Field name', ROW_NUMBER() over (partition by team.Field_name order by team.points) as rank
	from  dbo.team, dbo.Field, dbo.Person, dbo.MemberOf
	where team.Id = MemberOf.team_Id and MemberOf.Person_SSN = Person.SSN and MemberOf.Is_Captain = '1'
) as leaders
where leaders.rank = 1
*/


/*
--Query9
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
--Query10
Select * , ROW_NUMBER() over (partition by team.Field_name order by team.name asc) as rank
from dbo.team
*/

/*
--Query11
select team.Name, team.Number_of_games, team.Wins, team.Losses, team.Ties, team.points 
from dbo.Field, dbo.team
where team.Field_name = Field.Field_name and Field.Field_name = 'Soccer'
order by team.points desc
*/

/*
--Query12
select *
from( select * ,ROW_NUMBER() over (partition by team.Field_name order by team.points desc) as rank
from dbo.team
) teams
where teams.rank = 1 
*/


/*
--Query13
Select players.Field_name, players.Firstname, players.Lastname, players.rank
from 
(
	select *, ROW_NUMBER() over (partition by team.Field_name order by team.name asc) as rank
	from dbo.team, dbo.Person, dbo.MemberOf
	where team.Id = MemberOf.team_Id and Person.SSN = MemberOf.Person_SSN and Person.Age < 25
) as players
*/


/*
--Query14
select games.name, games.result
from
( select *, ROW_NUMBER() over (partition by team.name order by Game.Game_date DESC) as rank
from dbo.Game, dbo.team
where team.Id = Game.Team_host_Id or team.Id = Game.Team_guest_Id and LEN(Game.result) >=3
)as games
where rank = 1
*/

/*
 --Query15
select games.name, games.result
from
( select *, ROW_NUMBER() over (partition by team.name order by Game.Game_date DESC) as rank
from dbo.Game, dbo.team
where team.Id = Game.Team_host_Id or team.Id = Game.Team_guest_Id and LEN(Game.result) = 0
)as games
where rank = 1
*/


/*
--Query16
select *, youngest.youngest_age
from 
(
	select *, ROW_NUMBER() over (partition by team.field_name order by person.Age ASC) as youngest_age
	from dbo.person, dbo.team, dbo.MemberOf
	where person.SSN = MemberOf.Person_SSN and MemberOf.team_Id = team.Id
) as youngest
where youngest.youngest_age = 1
*/

/*
--Query17
select youngest_oct.Birthday
from
(
	select Person.Birthday, ROW_NUMBER() over (partition by team.name order by person.Age ASC) as age_rank
	from dbo.person, dbo.team, dbo.MemberOf
	where person.SSN = MemberOf.Person_SSN and MemberOf.team_Id = team.Id and person.Age < 20 and month(person.Birthday) >= 10
) as youngest_oct
*/

/*
--Query18
select team.Team_name, AVG(Person.Age) as [Average age]
from dbo.person, dbo.team, dbo.MemberOf
where person.SSN = MemberOf.Person_SSN and MemberOf.team_Id = team.Id
group by team.Team_name
order by [Average Age] desc 
*/

/*
--Query19
select Personteams.Firstname,  Personteams.Lastname
from 
(
	select Person.SSN, Person.Firstname, Person.Lastname, ROW_NUMBER() over(partition by Person.SSN order by team.name ASC) as person_teams
	from dbo.person, dbo.team, dbo.MemberOf
	where person.SSN = MemberOf.Person_SSN and MemberOf.team_Id = team.Id
) as Personteams
where Personteams.person_teams >=2
*/

/*
--Query20
 SELECT * from(select Name,Points,Field_name,
				ROW_NUMBER() over (partition by Field_name order by Points desc) as topteam
				from Team) ranks
				where ranks.topteam <= 5;
*/


/*
--Query21
select Cast(AVG(Team_host_Id) as varchar) + ',' + CAST(AVG(Team_guest_Id) as varchar) as age
from dbo.Game
where Game_id = 1
*/

/*
--Query22
Select Firstname,Lastname
from (
select *
	from dbo.team, dbo.Person, dbo.MemberOf
	where Team.Id = MemberOf.team_Id and Person.SSN = MemberOf.Person_SSN and Team.Field_name = 'Football'
) as players
*/



/*
--Query23
SELECT Firstname,Lastname,Field_name,Age from(select Firstname, Lastname,Field_name,Age,
				ROW_NUMBER() over (partition by Field_name order by Person.Age desc) as oldest
				from dbo.Team, dbo.Person, dbo.MemberOf
				where  Team.Id = MemberOf.team_Id and Person.SSN = MemberOf.Person_SSN
				)  ranks
				where ranks.oldest = 1 
*/


/*
--Query24
SELECT Firstname,Lastname,Field_name,Age from(select Firstname, Lastname,Field_name,Age,
				ROW_NUMBER() over (partition by Field_name order by Person.Age asc) as youngest
				from dbo.Team, dbo.Person, dbo.MemberOf
				where  Team.Id = MemberOf.team_Id and Person.SSN = MemberOf.Person_SSN
				)  ranks
				where ranks.youngest = 1 
*/