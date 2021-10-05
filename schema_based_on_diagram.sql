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

CREATE TABLE invoices_items(
    id INT GENERATED ALWAIS AS IDENTITY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int,
    FOREIGN KEY(treatment_id) REFERENCES treatments(id);
    FOREIGN KEY(invoice_id) REFERENCES invoices(id);
);

CREATE TABLE medical_treatments(
    medical_histories_id INT,
    treatments_id INT,
    FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id);
    FOREIGN KEY(treatments_id) REFERENCES treatments(id);
);

CREATE INDEX medical_histories_id_asc ON medical_treatments(medical_histories_id ASC);
CREATE INDEX treatments_id_asc ON medical_treatments(treatments_id ASC);
