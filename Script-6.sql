CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	description TEXT,
	amount float
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	first_name varchar(255),
	last_name varchar(255)
);

CREATE TABLE service_ticket(
	ticket_id SERIAL PRIMARY KEY
);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	FOREIGN KEY(invoice_id) REFERENCES invoice(invoice_id),
	first_name varchar(255),
	last_name varchar(255)
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	make varchar(255),
	model varchar(255),
	"year" integer
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	FOREIGN KEY(invoice_id) REFERENCES invoice(invoice_id),
	FOREIGN KEY(ticket_id) REFERENCES service_ticket(ticket_id),
	first_name varchar(255),
	last_name varchar(255)
);

CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	"type" varchar(255)
);

INSERT INTO car(
	make,
	model,
	"year"
)values(
	'honda',
	'accord',
	2022
),(
	'lincoln',
	'aviator',
	2022
)

INSERT INTO customer(
	first_name,
	last_name
)values(
	'Noah',
	'Gaeckle'
),(
	'Tom',
	'Cruise'
)

INSERT INTO mechanic(
	first_name,
	last_name
)values(
	'Sam',
	'Jackson'
),(
	'Bradley',
	'Cooper'
)

INSERT INTO salesperson(
	first_name,
	last_name
)values(
	'Joe',
	'Joeman'
),(
	'Bret',
	'Bretterson'
)

INSERT INTO invoice(
	amount,
	description
)values(
	300,
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vulputate tellus id aliquet scelerisque. Vivamus ultrices, ligula condimentum sagittis maximus, ligula nisl dictum nisi, in.'
),(
	450,
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vulputate tellus id aliquet scelerisque. Vivamus ultrices, ligula condimentum sagittis maximus, ligula nisl dictum nisi, in.'
)

INSERT INTO service(
	"type"
)values(
	'Oil Change'
),(
	'Tire pressure check'
)
