--Increase varchar length of email in Login
ALTER TABLE Login
MODIFY email VARCHAR(128);


----------------------------------------------------STORED PROCEDURES-----------------------------------------------------------------------------

--Creating Login Sequence
CREATE SEQUENCE login_id_seq START WITH 1000 NOCACHE;

--Procedure for creating Freelancer
CREATE OR REPLACE PROCEDURE add_freelancer(
    login_id IN DECIMAL,
    username IN VARCHAR,
    encrypted_password IN VARCHAR,
    first_name IN VARCHAR,
    last_name IN VARCHAR,
    phone_no IN VARCHAR,
    email IN VARCHAR,
    address_line IN VARCHAR,
    city IN VARCHAR,
    user_state IN CHAR,
    zip IN VARCHAR,
    country IN VARCHAR,
    availability_status IN DECIMAL,
    bio IN VARCHAR,
    is_employer IN CHAR,
    is_freelancer IN CHAR,
    hourly_rate IN DECIMAL)
IS
BEGIN
    INSERT INTO Login(login_id, username, encrypted_password, first_name, last_name, phone_no, email, address_line, city, user_state, zip, country, availability_status, bio, is_employer, is_freelancer)
    VALUES(login_id, username, encrypted_password, first_name, last_name, phone_no, email, address_line, city, user_state, zip, country, availability_status, bio, is_employer, is_freelancer);
    
    INSERT INTO Freelancer(login_id, hourly_rate)
    VALUES(login_id, hourly_rate);
END
;
/

BEGIN
    add_freelancer(login_id_seq.NEXTVAL, 'icube', 't@ng3nT', 'Ice', 'Cube', '2839181191', 'icube@gmail.com', '500 Washington St', 'Boston', 'MA', '02141', 'United States of America', 
    1, 'I am an up and coming rapper.', 'N', 'Y', 5.50);
END;
/

--Add more values to Login and Freelancer
BEGIN
    add_freelancer(login_id_seq.NEXTVAL, 'mmaqsood', 't20321#', 'Mishal', 'Maqsood', '7290199999', 'mmaq@gmail.com', '29 Chelsea St', 'Chelsea', 'NV', '88191', 'United States of America', 
    1, 'I am a civil engineer', 'N', 'Y', 27.50);
    add_freelancer(login_id_seq.NEXTVAL, 'ihasnain', 'l3ave33T666##', 'Intekhab', 'Hasnain', '3730929921', 'ihas@gmail.com', 'Hillview 930', 'Chittagong', null, '1230', 'Bangladesh', 
    1, 'Looking for nerdy stuff.', 'N', 'Y', 9.99);
    add_freelancer(login_id_seq.NEXTVAL, 'mtabassum', 'b3nzeeene910@', 'Mehnaz', 'Tabassum', '8270976452', 'mtab@gmail.com', 'PO 7281', 'Gung Ho', 'NV', '88191', 'United States of America', 
    1, 'I love to take care of my kids', 'N', 'Y', 18.00);
    add_freelancer(login_id_seq.NEXTVAL, 'awadud', 'th1slyF420%#', 'Abdul', 'Wadud', '9285563746', 'abw@gmail.com', 'Angelica Avenue 78', 'Chittagong', null, '1467', 'Bangladesh', 
    1, 'I give medical advice for a living', 'N', 'Y', 40.00);
END;
/

select * from login;
select * from freelancer;


--Procedure for creating Employer
CREATE OR REPLACE PROCEDURE add_employer(
    login_id IN DECIMAL,
    username IN VARCHAR,
    encrypted_password IN VARCHAR,
    first_name IN VARCHAR,
    last_name IN VARCHAR,
    phone_no IN VARCHAR,
    email IN VARCHAR,
    address_line IN VARCHAR,
    city IN VARCHAR,
    user_state IN CHAR,
    zip IN VARCHAR,
    country IN VARCHAR,
    availability_status IN DECIMAL,
    bio IN VARCHAR,
    is_employer IN CHAR,
    is_freelancer IN CHAR,
    type_of_business IN VARCHAR,
    company_name IN VARCHAR)
IS
BEGIN
    INSERT INTO Login(login_id, username, encrypted_password, first_name, last_name, phone_no, email, address_line, city, user_state, zip, country, availability_status, bio, is_employer, is_freelancer)
    VALUES(login_id, username, encrypted_password, first_name, last_name, phone_no, email, address_line, city, user_state, zip, country, availability_status, bio, is_employer, is_freelancer);
    
    INSERT INTO Employer(login_id, type_of_business, company_name)
    VALUES(login_id, type_of_business, company_name);
END
;
/

BEGIN
    add_employer(login_id_seq.NEXTVAL, 'Darryl Philbin', 'bi0m3d321#', 'Darryl', 'Philbin', '1629372228', 'dphil@gmail.com', '20 Newbury St', 'Marryp', 'AZ', '37292', 'United States of America', 
    1, 'I am looking for people.', 'Y', 'N', 'Medicine', 'BioMed Functionalities');   
END;
/

--Insert more values for login and employer
BEGIN
    add_employer(login_id_seq.NEXTVAL, 'asifAli', 't52@@@#', 'Asif', 'Ali', '9283948282', 'aal@gmail.com', '523 Waterbury', 'Waterbury', 'CT', '58201', 'United States of America', 
    1, 'Looking for a soccer player to play center midfield', 'Y', 'N', 'Sports', 'Filibuster Inc.');
    add_employer(login_id_seq.NEXTVAL, 'srafique', 'ksiwn726@', 'Samuel', 'Rafique', '9205647282', 'sraf@gmail.com', '20 Nashville St', 'Levoin', null, '9233', 'France', 
    1, 'I give jobs', 'Y', 'N', 'Software', 'Traumaless LTD');   
    add_employer(login_id_seq.NEXTVAL, 'jrocky', '^troRREnd432', 'Jody', 'Rocky', '3748592727', 'jrok@gmail.com', '23 Newbury St', 'Windsor', 'DE', '34667', 'United States of America', 
    1, 'I have a Scottish accent.', 'Y', 'N', 'Music', 'Strings Corp');   
    add_employer(login_id_seq.NEXTVAL, 'rrobbie', '**shso2#$', 'Robert', 'Robbie', '6783452624', 'robs@gmail.com', 'PO Box 90', 'Delhi', null, '6732', 'India', 
    1, 'I am looking for cheap labour.', 'Y', 'N', 'Startup', 'Therapy LLC');   
    
END;
/

select * from login;
select * from employer;

------------------------------------------------------------

--Create Skill sequence
CREATE SEQUENCE skill_id_seq START WITH 10 NOCACHE;

--creating procedure to add skill
CREATE OR REPLACE PROCEDURE add_skill(
    skill_id IN DECIMAL,
    skill_name IN VARCHAR,
    skill_description IN VARCHAR,
    skill_type IN VARCHAR)
IS
BEGIN
    INSERT INTO Skill(skill_id, skill_name, skill_description, skill_type)
    VALUES(skill_id, skill_name, skill_description, skill_type);
END
;
/

BEGIN
    add_skill(SKILL_ID_SEQ.nextval, 'Rapping', 'I can play with words.', 'Music');   
END;
/

--INSERT MORE VALUES TO SKILL
BEGIN
    add_skill(SKILL_ID_SEQ.nextval, 'Design Databases', 'Design databases of various sizes', 'Tech');
    add_skill(SKILL_ID_SEQ.nextval, 'Stand-up Comedy', 'Make people laugh', 'Comedy');  
    add_skill(SKILL_ID_SEQ.nextval, 'Writing', 'Write articles, blogs, novels etc', 'Literature/Language');  
    add_skill(SKILL_ID_SEQ.nextval, 'Bharatnatyam', 'Expert in Bharatnatyam', 'Dance');  
    add_skill(SKILL_ID_SEQ.nextval, 'Play Guitar', 'Play acoustic, electric, Hawaiian etc types of guitar', 'Music');  
END;
/

select * from skill;

-----------------------------------------------------------------------------------------

--creating project sequence
CREATE SEQUENCE projects_id_seq START WITH 100 NOCACHE;

--creating procedure to add project
CREATE OR REPLACE PROCEDURE add_project(
    projects_id IN DECIMAL,
    projects_title IN VARCHAR,
    projects_description IN VARCHAR,
    projects_venue IN VARCHAR,
    genre IN VARCHAR,
    status IN DECIMAL,
    created_on IN DATE,
    last_updated_on IN DATE,
    closed_on IN DATE,
    completed_on IN DATE)
IS
BEGIN
    INSERT INTO Projects(projects_id, projects_title, projects_description, projects_venue, genre, status, created_on, last_updated_on, closed_on, completed_on)
    VALUES(projects_id, projects_title, projects_description, projects_venue, genre, status, created_on, last_updated_on, closed_on, completed_on);
END
;
/

BEGIN
    add_project(PROJECTS_ID_SEQ.nextval, 'Rap Show', 'Rap Nights, come rap!', 'Boston University Park', 'Music', 1, SYSDATE, null, null, null);   
END;
/

--INSERT MORE VALUES IN PROJECTS
BEGIN
    add_project(PROJECTS_ID_SEQ.nextval, 'Rap Show', 'Rap Nights, come rap!', 'Boston University Park', 'Music', 1, SYSDATE, null, null, null);
    add_project(PROJECTS_ID_SEQ.nextval, 'Music Programme', 'A night of acoustic music', 'Leora Park', 'Music', 1, SYSDATE, null, null, null);  
    add_project(PROJECTS_ID_SEQ.nextval, 'Dance and Comedy Night', 'Stand-up comedy by the best in Boston', 'TeeDee Garden', 'Comedy', 1, SYSDATE, null, null, null);  
    add_project(PROJECTS_ID_SEQ.nextval, 'Blood Donation Program', 'Blood donation at NorthWestern', 'NorthWestern University Western Hall', 'Medical', 1, SYSDATE, null, null, null);  
    add_project(PROJECTS_ID_SEQ.nextval, 'Article on digital clocks', 'Write an article on Digital vs Analog Watches', null, 'Literature', 1, SYSDATE, null, null, null);  
    add_project(PROJECTS_ID_SEQ.nextval, '10 Things to not do during corona', 'An article for Buzztalk online magazine', null, 'Medical', 1, SYSDATE, null, null, null);  
END;
/

--INSERT SOME MORE VALUES TO PROJECTS
BEGIN
    add_project(PROJECTS_ID_SEQ.nextval, 'Rowing Class', 'Teach enthusiasts the art of rowing boats', 'Lake Tahua', 'Sailing', 1, CAST('19-FEB-2019' AS DATE), null, null, null);
    add_project(PROJECTS_ID_SEQ.nextval, 'Hosting Corporate Show', 'An acting professional who can keep the guests engaged', 'Tanvir Memorial Avenue', 'Acting', 1, CAST('31-DEC-2019' AS DATE), null, null, null);  
    add_project(PROJECTS_ID_SEQ.nextval, 'Data Collection for Wind Waves', 'Need someone to collect data for Hurricane Laura', null, 'Tech', 1, CAST('20-JUN-2018' AS DATE), null, null, null);
END;
/

select * from projects;


----------------------------------------------------------------TRIGGERS------------------------------------------------------------------------------------------------------

--creating table ProjectStatus_History
CREATE TABLE ProjectStatus_History(
projectstatushistory_id DECIMAL(12) PRIMARY KEY,
projects_id DECIMAL(12) NOT NULL,
old_status DECIMAL(2) NOT NULL,
new_status DECIMAL(2) NOT NULL,
change_date DATE NOT NULL,
FOREIGN KEY(projects_id) REFERENCES Projects(projects_id)
);

--creating index for foreign key projects_id
CREATE INDEX StatusHistoryProjectIdx
ON ProjectStatus_History(projects_id);

--creating sequence for projectstatushistory_id
CREATE SEQUENCE projectstatushistory_id_seq START WITH 500 NOCACHE;

--creating trigger
CREATE OR REPLACE TRIGGER proj_stat_hist_trg
BEFORE UPDATE OF status ON Projects
FOR EACH ROW
BEGIN
    INSERT INTO projectstatus_history(projectstatushistory_id, projects_id, old_status, new_status, change_date)
    VALUES(PROJECTSTATUSHISTORY_ID_SEQ.nextval, :New.projects_id, :OLD.status, :NEW.status, CAST('31-DEC-2019' AS DATE));
END;
/

--updating status in Projects table
UPDATE Projects
SET status = 2,
last_updated_on = SYSDATE
WHERE projects_title = 'Rap Show';

UPDATE Projects
SET status = 1,
last_updated_on = SYSDATE
WHERE projects_title = 'Rap Show';

select * from projectstatus_history;


------------------------------------------------------------INSERTING DATA-----------------------------------------------------------------------

--INSERT DATA IN OPERATIONAL
INSERT INTO operational
VALUES(1, 1000, 10);
INSERT INTO operational
VALUES(2, 1000, 15);
INSERT INTO operational
VALUES(3, 1003, 14);
INSERT INTO operational
VALUES(4, 1004, 13);
INSERT INTO operational
VALUES(5, 1006, 10);
INSERT INTO operational
VALUES(6, 1006, 12);

select * from operational;

------------------------

--INSERT DATA IN WORKABLEPROJECT
INSERT INTO workableproject
VALUES(1, 1002, 106);
INSERT INTO workableproject
VALUES(2, 1004, 106);
INSERT INTO workableproject
VALUES(3, 1009, 103);
INSERT INTO workableproject
VALUES(4, 1000, 103);
INSERT INTO workableproject
VALUES(5, 1009, 101);
INSERT INTO workableproject
VALUES(6, 1000, 101);
INSERT INTO workableproject
VALUES(7, 1010, 105);
INSERT INTO workableproject
VALUES(8, 1004, 105);
INSERT INTO workableproject
VALUES(9, 1008, 110);
INSERT INTO workableproject
VALUES(10, 1003, 110);
INSERT INTO workableproject
VALUES(11, 1008, 108);
INSERT INTO workableproject
VALUES(12, 1006, 108);
INSERT INTO workableproject
VALUES(13, 1005, 107);
INSERT INTO workableproject
VALUES(14, 1007, 107);
INSERT INTO workableproject
VALUES(15, 1003, 109);
INSERT INTO workableproject
VALUES(16, 1009, 109);

select * from projects;
select * from workableproject;
select * from login;

--updating some projects to status PUBLISHED
UPDATE projects
SET status = 2, last_updated_on = CAST('20-FEB-2019' AS DATE)
where projects_id = 108;

UPDATE projects
SET status = 2, last_updated_on = CAST('30-JUN-2019' AS DATE)
where projects_id = 109;

UPDATE projects
SET status = 2, last_updated_on = CAST('31-DEC-2019' AS DATE)
where projects_id = 110;


--INSERTING DATA IN CONTRACT
INSERT INTO contract
VALUES(2000, 101, 'Contract 101 for Rap Show', 'This is the body of the contract.', null, null, CAST('22-OCT-2019' AS DATE), CAST('30-OCT-2019' AS DATE), 50.99, CAST('30-NOV-2019' AS DATE));
INSERT INTO contract
VALUES(2002, 105, 'Contract :: Blood Donation', 'This is the body of the contract.', null, null, CAST('28-OCT-2019' AS DATE), CAST('10-NOV-2019' AS DATE), 20.99, CAST('10-DEC-2019' AS DATE));
INSERT INTO contract
VALUES(2004, 107, 'Corona Virus Article - 1', 'This is the body of the contract.', null, null, CAST('22-JUN-2019' AS DATE), CAST('30-JUN-2019' AS DATE), 10.99, CAST('30-JUL-2019' AS DATE));
INSERT INTO contract
VALUES(2006, 107, 'Corona Virus Article - 2', 'This is the body of the contract.', null, null, CAST('22-SEP-2020' AS DATE), CAST('30-SEP-2020' AS DATE), 15.99, CAST('30-OCT-2020' AS DATE));
INSERT INTO contract
VALUES(2008, 109, 'Contract Corporate Show', 'This is the body of the contract.', null, null, CAST('22-OCT-2018' AS DATE), CAST('30-OCT-2018' AS DATE), 60.99, CAST('30-NOV-2018' AS DATE));
INSERT INTO contract
VALUES(2010, 110, 'Contract Data Collection', 'This is the body of the contract.', null, null, CAST('09-OCT-2018' AS DATE), CAST('23-OCT-2018' AS DATE), 50.99, CAST('30-NOV-2018' AS DATE));

select * from projects;
select * from contract;

--INSERTING DATA IN BILLINGINFO AND ACCOUNTS AND CARD

--create sequence for billininfo_id
CREATE SEQUENCE billinginfo_seq START WITH 5000 NOCACHE;

--create procedure to add account
CREATE OR REPLACE PROCEDURE add_account(
    billinginfo_id DECIMAL,
    name VARCHAR,
    is_account CHAR,
    is_card CHAR,
    accounts_type DECIMAL,
    accounts_no VARCHAR,
    routing_no VARCHAR,
    id_no VARCHAR)
IS
BEGIN
    INSERT INTO billinginfo(billinginfo_id, name, is_account, is_card)
    VALUES(billinginfo_id, name, is_account, is_card);
    
    INSERT INTO accounts(billinginfo_id, accounts_type, accounts_no, routing_no, id_no)
    VALUES(billinginfo_id, accounts_type, accounts_no, routing_no, id_no);
END
;
/

BEGIN
    add_account(billinginfo_seq.NEXTVAL, 'ABCD Corp' ,'Y', 'N', '1', '1400628372', '22019283', '8273627897');
    add_account(billinginfo_seq.NEXTVAL, 'Coney Lighthouse', 'Y', 'N', '2', '28397772625', '9286637', '119028765');
    add_account(billinginfo_seq.NEXTVAL, 'Litterman Comeyson', 'Y', 'N', '1', '987627284623', '28819991', '2909982819');
END;
/

select * from billinginfo;
select * from accounts;

--create procedure to add card
CREATE OR REPLACE PROCEDURE add_card(
    billinginfo_id DECIMAL,
    name VARCHAR,
    is_account CHAR,
    is_card CHAR,
    card_type DECIMAL,
    card_no VARCHAR,
    expires_on DATE,
    billing_address VARCHAR,
    billing_city VARCHAR,
    billing_state CHAR,
    billing_zip VARCHAR,
    billing_country VARCHAR)
IS
BEGIN
    INSERT INTO billinginfo(billinginfo_id, name, is_account, is_card)
    VALUES(billinginfo_id, name, is_account, is_card);
    
    INSERT INTO card(billinginfo_id, card_type, card_no, expires_on, billing_address, billing_city, billing_state, billing_zip, billing_country)
    VALUES(billinginfo_id, card_type, card_no, expires_on, billing_address, billing_city, billing_state, billing_zip, billing_country);
END
;
/

BEGIN
    add_card(billinginfo_seq.NEXTVAL, 'Delaney Mukherjee' ,'N', 'Y', '1', '1600098765432567', CAST('31-OCT-2024' AS DATE), '90 Mulaney St', 'Springfield', 'NE', '82736', 'United States of America');
    add_card(billinginfo_seq.NEXTVAL, 'Jack Burkhart' ,'N', 'Y', '1', '2728938762524435', CAST('31-AUG-2021' AS DATE), '1467 Dune ST', 'Lovingdale', 'MD', '82928', 'United States of America');
    add_card(billinginfo_seq.NEXTVAL, 'Adnan Sami' ,'N', 'Y', '2', '2172873652428389', CAST('30-JUN-2022' AS DATE), '92 Hillview R/A', 'Pirojpur', null, '2229', 'Andora');
    add_card(billinginfo_seq.NEXTVAL, 'Bela Bose' ,'N', 'Y', '1', '273864289288', CAST('31-DEC-2024' AS DATE), 'Bosnia Aparments', 'Bagerhat', null, '1929', 'Bangladesh');
END;
/

select * from billinginfo;
select * from card;

--INSERTING DATA IN SAVEDBILLABLEINFO
INSERT INTO savedbillableinfo
VALUES (100, 1002, 5000);
INSERT INTO savedbillableinfo
VALUES (103, 1007, 5006);
INSERT INTO savedbillableinfo
VALUES (106, 1007, 5001);

select * from login;
select * from accounts;
select * from card;
select * from savedbillableinfo;

--INSERTING DATA IN LANGUAGE
INSERT INTO languages
VALUES(005, 'Bangla');
INSERT INTO languages
VALUES(010, 'Urdu');
INSERT INTO languages
VALUES(015, 'English');
INSERT INTO languages
VALUES(020, 'French');
INSERT INTO languages
VALUES(025, 'Spanish');

SELECT * FROM languages;

--INSERTING DATA INTO SPEAK
INSERT INTO speak
VALUES(003, 1000, 5);
INSERT INTO speak
VALUES(006, 1003, 5);
INSERT INTO speak
VALUES(009, 1009, 20);
INSERT INTO speak
VALUES(012, 1000, 25);
INSERT INTO speak
VALUES(015, 1005, 10);

select * from login;
select * from languages;
select * from speak;

--INSERTING DATA IN PAYMENT
--create sequence for payment_id
CREATE SEQUENCE payment_seq START WITH 40000 NOCACHE;

INSERT INTO PAYMENT
VALUES(PAYMENT_SEQ.nextval, 2000, 1009, 1000, 5000, CAST('15-NOV-2019' AS DATE), 25.99);
INSERT INTO PAYMENT
VALUES(PAYMENT_SEQ.nextval, 2000, 1009, 1000, 5000, CAST('30-NOV-2019' AS DATE), 25.00);
INSERT INTO PAYMENT
VALUES(PAYMENT_SEQ.nextval, 2004, 1010, 1004, 5005, CAST('30-JUL-2019' AS DATE), 10.99);
INSERT INTO PAYMENT
VALUES(PAYMENT_SEQ.nextval, 2006, 1007, 1005, 5005, CAST('30-SEP-2020' AS DATE), 5.99);
INSERT INTO PAYMENT
VALUES(PAYMENT_SEQ.nextval, 2006, 1007, 1005, 5006, CAST('15-OCT-2020' AS DATE), 5.00);
INSERT INTO PAYMENT
VALUES(PAYMENT_SEQ.nextval, 2006, 1007, 1005, 5006, CAST('10-NOV-2020' AS DATE), 5.00);
INSERT INTO PAYMENT
VALUES(PAYMENT_SEQ.nextval, 2008, 1009, 1003, 5004, CAST('15-NOV-2018' AS DATE), 60.99);
INSERT INTO PAYMENT
VALUES(PAYMENT_SEQ.nextval, 2010, 1008, 1003, 5000, CAST('15-NOV-2018' AS DATE), 50.99);
INSERT INTO PAYMENT
VALUES(PAYMENT_SEQ.nextval, 2002, 1010, 1004, 5006, CAST('15-DEC-2019' AS DATE), 10.00);
INSERT INTO PAYMENT
VALUES(PAYMENT_SEQ.nextval, 2002, 1010, 1004, 5007, CAST('20-DEC-2019' AS DATE), 10.99);

select * from contract;
select * from workableproject;
select * from login;
select * from billinginfo;
select * from savedbillableinfo;
select * from payment;

--------------------------------------------------------------------------------REPORT QUERIES-------------------------------------------------------------------------------------
--report of number of users who have been involved in projects in the system
SELECT l.country, count(p.projects_id) as Number_of_Projects
FROM Login l
JOIN workableproject w
on l.login_id = w.login_id
JOIN projects p
on w.projects_id = p.projects_id
WHERE p.status = 3
GROUP BY l.country
ORDER BY count(p.projects_id) DESC;

--Report of which projects have been worked on in 2020:
SELECT e.company_name, (l.first_name || ' ' || l.last_name) AS Employer, p.projects_title, p.genre, count(psh.projectstatushistory_id) As Total_Activity
FROM Projects p
JOIN workableproject w
ON p.projects_id = w.projects_id
JOIN login l
ON w.login_id = l.login_id
JOIN employer e
on l.login_id = e.login_id
JOIN projectstatus_history psh
on p.projects_id = psh.projects_id
WHERE EXTRACT(YEAR FROM psh.change_date) = 2020
GROUP BY p.genre, e.company_name, l.first_name, l.last_name, p.projects_title
ORDER BY count(psh.projectstatushistory_id) DESC;



-- REPORT FOR TOTAL AMOUNT IN THE TRANSACTIONS PAID IN 2019
SELECT proj.projects_title, TO_CHAR(p.paid_on, 'MONTH') AS MONTH, SUM(p.amount_paid) AS TOTAL_AMOUNT_PAID
FROM payment p
JOIN contract c
on p.contract_id = c.contract_id
join projects proj
on c.projects_id = proj.projects_id
WHERE EXTRACT(YEAR FROM p.PAID_ON) = 2019
GROUP BY EXTRACT(MONTH FROM p.PAID_ON), TO_CHAR(p.paid_on, 'MONTH'), proj.projects_title
ORDER BY EXTRACT(MONTH FROM p.PAID_ON);