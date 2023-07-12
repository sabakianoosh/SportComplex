/*
ALTER TABLE Person
      ADD CONSTRAINT age_check CHECK (Age > 16)

ALTER TABLE Game
	ADD Constraint jersey_check check (team_host_id != team_guest_id)

ALTER TABLE Team
	ADD Constraint Payment_how check (Payment != 'Online')

alter table Team 
	DROP constraint Payment_how

alter table Spectator
	ADD constraint SEX_ALLOWED check(SEX = 'Male')	

alter table Spectator
	DROP constraint SEX_ALLOWED

*/

