/*
Create table [Sport Complex]
(
	Id int,
	name varchar(50) not null,
	primary key(Id)
)

Create table Field
(
	Field_name varchar(50) not null,
	spectors_apacity Int not null,
	Game_Full_Time Int not null,
	SC_name int Foreign key REFERENCES [Sport Complex](Id),
	Register_Cost float not null,
	primary key(Field_name)
);

Create table Team
(
	Id int not null,
	Name varchar(50) not null,
	Register_cost int not null, 
	Payment varchar(50) not null,
	Field_name varchar(50) Foreign key REFERENCES Field(Field_name),
	RegisterCost int not null, 
	Wins int not null, 
	Losses int not null, 
	Ties int not null,
	Team_name varchar(50) not null,
	Points int not null,
	Number_of_games int not null,
	primary key(Id)
)
Create table Person
(
	SSN Int not null,
	Firstname varchar(50) not null,
	Lastname varchar(50) not null,
	Age Int not null,
	Kit_number Int not null,
	Birthday datetime not null,
	primary key(SSN)
);

Create table Game
(
	result varchar(7) not null,
	Sans int not null,
	Game_id int not null, 
	Team_host_Id int Foreign key REFERENCES Team(Id) not null, 
	Team_guest_Id int Foreign key REFERENCES Team(Id) not null, 
	SC_id int Foreign key REFERENCES [Sport Complex](Id) not null,
	Game_Date datetime not null,
	primary key(Game_id)
)
alter table Game
alter column Sans Varchar(50)

*/

/*
Create table Ticket 
(
	Validation_Num int not null, 
	Field varchar(50) not null,
	IS_VIP bit not null,
	Seat_num int not null, 
	Game_Id int Foreign key REFERENCES Game(Game_Id),
	primary key(Validation_Num)
)


Create table Spectator
(
	SSN int not null,
	Validation_Num int Foreign key REFERENCES Ticket(Validation_Num),
	Firstname varchar(50) not null,
	Lastname varchar(50) not null,
	Primary key(SSN)
)

Create table MemberOf
(
	Is_captain bit not null,
	Person_ssn Int Foreign key REFERENCES Person(SSN),
	Team_Id int Foreign key REFERENCES Team(Id)
);

Create table [Jersey Colors]
(
	Jersey_Colors varchar(50) not null,
	Team_Id int Foreign key REFERENCES Team(Id)

);
*/