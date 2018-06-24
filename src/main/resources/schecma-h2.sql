DROP TABLE account;
DROP TABLE users;
DROP TABLE util_account_types;
DROP TABLE exchange;
DROP TABLE util_exchange_types;

CREATE TABLE account (
user_id NUMBER(10,0) NOT NULL AUTO_INCREMENT,
account_type_id NUMBER(10,0) NOT NULL,
created_date DATE NOT NULL,
last_accessed DATE NOT NULL,
amount FLOAT(10, 2) NOT NULL,
PRIMARY KEY (user_id),
PRIMARY KEY (account_type_id),
FOREIGN KEY (user_id) REFERENCES users (user_id),
FOREIGN KEY (account_type_id) REFERENCES util_account_types (account_type_id));

CREATE TABLE users (
user_id NUMBER(10, 0) NOT NULL AUTO_INCREMENT,
user_name VARCHAR2(255),
hashed_password VARCHAR2(255),
first_name VARCHAR2(255),
last_name VARCHAR2(255),
email_address VARCHAR2(255)
PRIMARY KEY (user_id));

CREATE TABLE util_account_types (
account_type_id NUMBER (10, 0) NOT NULL AUTO_INCREMENT,
name VARCHAR2(255) NOT NULL,
PRIMARY KEY (account_type_id));

CREATE TABLE exchange (
exchange_id NUMBER(10,0) NOT NULL AUTO_INCREMENT,
exchange_type_id NUMBER(10, 0) NOT NULL,
account_id NUMBER(10,0) NOT NULL,
amount FLOAT(10, 2) NOT NULL,
exchange_date DATE NOT NULL,
PRIMARY KEY (exchange_id),
FOREIGN KEY (exchange_type_id) REFERENCES util_exchange_types (exchange_type_id),
FOREIGN KEY (account_id) REFERENCES account (account_id));

CREATE TABLE exchange_type_id (
exchange_type_id NUMBER(10, 0) NOT NULL AUTO_INCREMENT,
name VARCHAR2(255) NOT NULL,
PRIMARY KEY (exchange_type_id));

DROP SEQUENCE hibernate_sequence;

CREATE SEQUENCE hibernate_sequence;