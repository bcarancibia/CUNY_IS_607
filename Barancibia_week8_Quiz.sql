-- Ben Arancibia -- 
-- Week 8 Quiz --
--October 17th, 2014--

--Question 1--

SELECT VERSION();

CREATE Database CEO;

\connect ceo;

CREATE TABLE upper_manage_apple (
	exec_id SERIAL PRIMARY KEY ,
	title VARCHAR(100) ,
	first_name VARCHAR(100) ,
	last_name VARCHAR(100) ,
	boss_exec_id INT);

INSERT INTO csuite (exec_id ,title ,first_name ,last_name ,boss_exec_id) 
VALUES 	(1, 'CEO', 'Steve', 'Jobs', NULL),
		(2, 'SVP, IOS Software', 'Scott', 'Forstall', 1),
		(3, 'SVP, Chief Financial Officer', 'Peter', 'Oppenheimer', 1),
		(4, 'VP, Engineering, IOS Apps', 'Henri', 'Lamiraux', 2),
		(5, 'VP, IOS Wireless Software', 'Isabel', 'Ge Mahe', 2),
		(6, 'VP, Program Management', 'Kim', 'Vorrath', 2),
		(7, 'VP, Controller', 'Betsy', 'Rafael', 3),
		(8, 'VP, Treasurer', 'Gary', 'Wipfler' , 3);

-- Question 2 --
SELECT * 
FROM upper_manage_apple 
ORDER BY exec_id;

-- Question 3 --

UPDATE upper_manage_apple
set first_name = 'Timothy', last_name = 'Cook'
where exec_id = 1;

INSERT INTO csuite (exec_id, title, first_name, last_name, boss_exec_id)
VALUES (9, 'Chief Operating Office', 'Susan', 'Wojciki', 1);

SELECT * 
FROM upper_manage_apple 
ORDER BY exec_id