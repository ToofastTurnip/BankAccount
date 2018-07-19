DROP TABLE util_account_types;
DROP TABLE util_transfer_types;
DROP TABLE account;
DROP TABLE users;
DROP TABLE transfer;

CREATE TABLE util_account_types (
account_type_id NUMBER (10, 0) NOT NULL AUTO_INCREMENT,
name VARCHAR2(255) NOT NULL,
PRIMARY KEY (account_type_id));

CREATE TABLE util_transfer_types (
transfer_type_id NUMBER(10, 0) NOT NULL AUTO_INCREMENT,
name VARCHAR2(255) NOT NULL,
PRIMARY KEY (transfer_type_id));

CREATE TABLE users (
user_id NUMBER(10, 0) NOT NULL AUTO_INCREMENT,
user_name VARCHAR2(255),
hashed_password VARCHAR2(255),
first_name VARCHAR2(255),
last_name VARCHAR2(255),
email_address VARCHAR2(255),
PRIMARY KEY (user_id));

CREATE TABLE account (
user_id NUMBER(10,0) NOT NULL AUTO_INCREMENT,
account_type_id NUMBER(10,0) NOT NULL,
created_date DATE NOT NULL,
last_accessed DATE NOT NULL,
amount FLOAT(10) NOT NULL,
PRIMARY KEY (user_id),
PRIMARY KEY (account_type_id),
FOREIGN KEY (user_id) REFERENCES users (user_id),
FOREIGN KEY (account_type_id) REFERENCES util_account_types (account_type_id));

CREATE TABLE transfer (
transfer_id NUMBER(10,0) NOT NULL AUTO_INCREMENT,
transfer_type_id NUMBER(10, 0) NOT NULL,
account_id NUMBER(10,0) NOT NULL,
amount FLOAT(10, 2) NOT NULL,
exchange_date DATE NOT NULL,
PRIMARY KEY (transfer_id),
FOREIGN KEY (transfer_type_id) REFERENCES util_transfer_types (transfer_type_id),
FOREIGN KEY (account_id) REFERENCES account (account_id));

DROP SEQUENCE hibernate_sequence;

CREATE SEQUENCE hibernate_sequence;

INSERT INTO util_account_types VALUES (1, "Checking");
INSERT INTO util_account_types VALUES (2, "Savings");

INSERT INTO util_transfer_types VALUES (1, "Withdraw");
INSERT INTO util_transfer_types VALUES (2, "Deposit");

-- Passwords hashed with BCrypt
INSERT INTO users VALUES (1, "daenis", "$2a$04$v5ylBEn3qptg6l5SVq7lquy.RAs3jhznTRpvkzIZbg09MKql3LobG", "Dennis", "Kalaygian", "example@gmail.com"); // password: daenis31
INSERT INTO users VALUES (2, "toofast", "$2a$04$nRhrbDhae9LghZpLQkkZyeM1krLUs1LaR9Q3MEkOtBAhjMLyEB/am", "Mitch", "Taylor", "example@verizon.com"); // password: toofast31

INSERT INTO account VALUES (1, 1, NOW(), NOW(), 1000.00);
INSERT INTO account VALUES (1, 2, NOW(), NOW(), 3000.00);
INSERT INTO account VALUES (2, 1, NOW(), NOW(), 1500.00);
INSERT INTO account VALUES (2, 2, NOW(), NOW(), 3500.00);
