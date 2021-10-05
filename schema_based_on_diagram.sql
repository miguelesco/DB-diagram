CREATE DATABASE diagram
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE TABLE patiens(
	id INT GENERATED ALWAYS AS IDENTITY,
	name char(80),
	date_of_birth DATE,
	PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
	id INT GENERATED ALWAYS AS IDENTITY,
	admitted_at TIMESTAMP,
	patient_id INT,
	status varchar(80),
	FOREIGN KEY(patient_id) REFERENCES patiens(id),
	PRIMARY KEY(id)
);

CREATE TABLE invoices(
	id INT GENERATED ALWAYS AS IDENTITY,
	total_amount decimal,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT,
	FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
	PRIMARY KEY(id)
);

CREATE TABLE treatments(
	id INT GENERATED ALWAYS AS IDENTITY,
	type varchar(80),
	name varchar(80),
	PRIMARY KEY(id)
);