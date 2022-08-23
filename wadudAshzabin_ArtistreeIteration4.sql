--Dropping tables

DROP TABLE Login;
DROP TABLE Employer;
DROP TABLE Freelancer;
DROP TABLE Languages;
DROP TABLE Speak;
DROP TABLE Skill;
DROP TABLE Operational;
DROP TABLE Projects;
DROP TABLE WorkableProject;
DROP TABLE Contract;
DROP TABLE BillingInfo;
DROP TABLE Accounts;
DROP TABLE Card;
DROP TABLE SavedBillableInfo;
DROP TABLE Payment;

--Creating tables
 
CREATE TABLE Login(
login_id DECIMAL(12) PRIMARY KEY,
username VARCHAR(64) NOT NULL,
encrypted_password VARCHAR(255) NOT NULL,
first_name VARCHAR(64) NOT NULL,
last_name VARCHAR(64) NOT NULL,
phone_no VARCHAR(64),
email VARCHAR(16) NOT NULL,
address_line VARCHAR(128) NOT NULL,
city VARCHAR(32) NOT NULL,
user_state CHAR(2),
zip VARCHAR(10) NOT NULL,
country VARCHAR(32) NOT NULL,
availability_status DECIMAL(2) NOT NULL,
bio VARCHAR(255),
is_employer CHAR(1) NOT NULL,
is_freelancer CHAR(1) NOT NULL
);

CREATE TABLE Employer(
login_id DECIMAL(12) PRIMARY KEY,
type_of_business VARCHAR(32),
company_name VARCHAR(32),
FOREIGN KEY(login_id) REFERENCES Login(login_id)
);

CREATE TABLE Freelancer(
login_id DECIMAL(12) PRIMARY KEY,
hourly_rate DECIMAL(5,2),
FOREIGN KEY(login_id) REFERENCES Login(login_id)
);

CREATE TABLE Languages(
languages_id DECIMAL(12) PRIMARY KEY,
languages_name VARCHAR(32) NOT NULL
);

CREATE TABLE Speak(
speak_id DECIMAL(12) PRIMARY KEY,
login_id DECIMAL(12) NOT NULL,
languages_id DECIMAL(12) NOT NULL,
FOREIGN KEY(login_id) REFERENCES Login(login_id),
FOREIGN KEY(languages_id) REFERENCES Languages(languages_id)
);

CREATE TABLE Skill(
skill_id DECIMAL(12) PRIMARY KEY,
skill_name VARCHAR(32) NOT NULL,
skill_description VARCHAR(255),
skill_type VARCHAR(32) NOT NULL
);

CREATE TABLE Operational(
operational_id DECIMAL(12) PRIMARY KEY,
login_id DECIMAL(12) NOT NULL,
skill_id DECIMAL(12) NOT NULL,
FOREIGN KEY(login_id) REFERENCES Login(login_id),
FOREIGN KEY(skill_id) REFERENCES Skill(skill_id)
);

CREATE TABLE Projects(
projects_id DECIMAL(12) PRIMARY KEY,
projects_title VARCHAR(64) NOT NULL,
projects_description VARCHAR(255) NOT NULL,
projects_venue VARCHAR(64),
genre VARCHAR(32) NOT NULL,
status DECIMAL(2) NOT NULL,
created_on DATE NOT NULL,
last_updated_on DATE,
closed_on DATE,
completed_on DATE
);

CREATE TABLE WorkableProject(
workableproject_id DECIMAL(12) PRIMARY KEY,
login_id DECIMAL(12) NOT NULL,
projects_id DECIMAL(12) NOT NULL,
FOREIGN KEY(login_id) REFERENCES Login(login_id),
FOREIGN KEY(projects_id) REFERENCES Projects(projects_id)
);

CREATE TABLE Contract(
contract_id DECIMAL(12) PRIMARY KEY,
projects_id DECIMAL(12) NOT NULL,
contract_header VARCHAR(255),
contract_body1 VARCHAR(1024) NOT NULL,
contract_body2 VARCHAR(1024),
contract_footer VARCHAR(255),
created_on DATE NOT NULL,
signed_on DATE,
contracted_fee DECIMAL(5,2) NOT NULL,
fee_due_on DATE NOT NULL,
FOREIGN KEY(projects_id) REFERENCES Projects(projects_id)
);

CREATE TABLE BillingInfo(
billinginfo_id DECIMAL(12) PRIMARY KEY,
name VARCHAR(128) NOT NULL,
is_account CHAR(1) NOT NULL,
is_card CHAR(1) NOT NULL
);

CREATE TABLE Accounts(
billinginfo_id DECIMAL(12) PRIMARY KEY,
accounts_type DECIMAL(1) NOT NULL,
accounts_no VARCHAR(32) NOT NULL,
routing_no VARCHAR(16) NOT NULL,
id_no VARCHAR(32) NOT NULL,
FOREIGN KEY(billinginfo_id) REFERENCES BillingInfo(billinginfo_id)
);

CREATE TABLE Card(
billinginfo_id DECIMAL(12) PRIMARY KEY,
card_type DECIMAL(1) NOT NULL,
card_no VARCHAR(32) NOT NULL,
expires_on DATE NOT NULL,
billing_address VARCHAR(128) NOT NULL,
billing_city VARCHAR(32) NOT NULL,
billing_state CHAR(2),
billing_zip VARCHAR(10) NOT NULL,
billing_country VARCHAR(32) NOT NULL,
FOREIGN KEY(billinginfo_id) REFERENCES BillingInfo(billinginfo_id)
);

CREATE TABLE SavedBillableInfo(
savedbillableinfo_id DECIMAL(12) PRIMARY KEY,
login_id DECIMAL(12),
billinginfo_id DECIMAL(12),
FOREIGN KEY(login_id) REFERENCES Login(login_id),
FOREIGN KEY(billinginfo_id) REFERENCES BillingInfo(billinginfo_id)
);

CREATE TABLE Payment(
payment_id DECIMAL(12) PRIMARY KEY,
contract_id DECIMAL(12) NOT NULL,
payer DECIMAL(12) NOT NULL,
payee DECIMAL(12) NOT NULL,
billinginfo_id DECIMAL(12) NOT NULL,
paid_on DATE NOT NULL,
amount_paid DECIMAL(5,2) NOT NULL,
FOREIGN KEY(contract_id) REFERENCES Contract(contract_id),
FOREIGN KEY(payer) REFERENCES Login(login_id),
FOREIGN KEY(payee) REFERENCES Login(login_id),
FOREIGN KEY(billinginfo_id) REFERENCES BillingInfo(billinginfo_id)
);

---------------------------------------------------

--creating indexes
CREATE INDEX SpeakLoginIdx
ON Speak(login_id);

CREATE INDEX SpeakLanguagesIdx
ON Speak(languages_id);

CREATE INDEX OperationalLoginIdx
ON Operational(login_id);

CREATE INDEX OperationalSkillIdx
ON Operational(skill_id);

CREATE INDEX WorkableLoginIdx
ON WorkableProject(login_id);

CREATE INDEX WorkableProjectsIdx
ON WorkableProject(projects_id);

CREATE INDEX ContractProjectsIdx
ON Contract(projects_id);

CREATE INDEX SavedBillableLoginIdx
ON SavedBillableInfo(login_id);

CREATE INDEX SavedBillingInfoIdx
ON SavedBillableInfo(billinginfo_id);

CREATE INDEX PaymentContractIdx
ON Payment(contract_id);

CREATE INDEX PaymentPayerIdx
ON Payment(payer);

CREATE INDEX PaymentPayeeIdx
ON Payment(payee);

CREATE INDEX PaymentBillingInfoIdx
ON Payment(billinginfo_id);

CREATE INDEX ProjectsTitleIdx
ON Projects(projects_title);

CREATE INDEX ProjectsCreatedOnIdx
ON Projects(created_on);

CREATE INDEX ProjectsCompletedOnIdx
ON Projects(completed_on);

