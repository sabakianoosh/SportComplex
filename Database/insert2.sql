use master
/*

--Insert After Triggers
--!Run this after triggers!

insert into team
values 
	 (5, 'Cash', 'Soccer', 2, 4,4,'Manchester City', 2075, 10)
	,(6, 'Check', 'Soccer', 4, 4, 0, 'Bayern München', 1940, 8)
	,(7, 'Cash', 'VolleyBall', 21, 2, 4, 'POLAND', 98, 27)
	,(8, 'Cash', 'VolleyBall', 19, 4, 4, 'FRANCE', 100, 27)


insert into Game
values ('2-3', 'Afternoon',4,5,6,1, '20230719 05:00:00 PM')
	  ,('3-1','Morning',5,7,8,1,'20230719 08:00:00 AM');



insert into Person
values (232891098, 'Bernardo','Silva', 28, 20, '19940110 00:00:00 AM','Male',''),
	   (127801252, 'Manuel', 'Neuer', 37, 1, '19860217 00:00:00 AM','Male',''), --captain
       (129648238, 'Maria', 'Stenzel', 24, 1, '19980624 00:00:00 AM','Female',''),
       (495325185, 'Juliette', 'Duranton', 30,8, '19920217 00:00:00 AM','Female','');--captain



insert into Ticket
values (99914778,'Soccer',0,4,4,'Afternoon'),
       (985811121,'Soccer',1,7,4,'Afternoon'),
	   (887618321,'VolleyBall',1,9,5,'Morning'),
	   (915940011,'VolleyBall',0,6,5,'Morning')



insert into Spectator
values(1236669,99914778,'Maria','Singleton','Female'),
	  (9800321,985811121,'Clifford','Ward','Male'),
	  (9869121,887618321,'Krista','Schroeder','Female'),
	  (9800779,915940011,'Brandi','Cummings','Male')




insert into MemberOf
values (0,232891098,5),
	   (1,127801252,6),
	   (0,129648238,7),
	   (1,495325185,8)


insert into [Jersey Colors]
values('Black,Red',5),
	  ('Purple,Yellow',6),
	  ('Blue-Red,Black',7),
      ('White,Purple',8)

*/