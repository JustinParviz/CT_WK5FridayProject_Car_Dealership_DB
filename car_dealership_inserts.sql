

create or replace function add_salesperson(
	_salesperson_id INTEGER, 
	_first_name VARCHAR(30),
	_last_name VARCHAR(30),
	_phone_number VARCHAR(20),
	_email_address VARCHAR(30)
)
returns void
as $main$
begin
	insert into salesperson
	values(_salesperson_id, _first_name, _last_name, _phone_number, _email_address);
end;
$main$
language plpgsql;

select *
from Salesperson

select add_salesperson(101, 'Harold', 'Potter', '910-632-8710', 'Hpotter@fastcars.com');
select add_salesperson(102, 'Ronald', 'Weasley', '910-820-1125', 'Rweasley@wizardmotors.com');
select add_salesperson(103, 'Viktor', 'Krum', '910-430-2289', 'Vkrum@wizardmotors.com');
select add_salesperson(104, 'Neville', 'Longbottom', '910-210-7752', 'Nlongbottom@wizardmotors.com');



create or replace function add_customer(
	_customer_id INTEGER,
	_first_name VARCHAR(30),
	_last_name VARCHAR(30),
	_phone_number VARCHAR(20),
	_address VARCHAR(30),
	_email_address VARCHAR(30)
)
returns void 
as $main$
begin
	insert into customer
	values(_customer_id, _first_name, _last_name, _phone_number, _address, _email_address);
end;
$main$
language plpgsql;

select *
from Customer 

select add_customer(911, 'John', 'Wick', '212-510-9425', '1 Hitman Boulevard', 'BabaYaga@hitman.net');
select add_customer(2012, 'Jack', 'Reacher', '764-901-5123', '25 Nomads Haven Rd', 'Jack@nowhere.com');
select add_customer(007, 'James', 'Bond', '860-646-2663', '007 Spy Lane', 'BondJamesBond@mi6.com');
select add_customer(2002, 'Jason', 'Bourne', '515-722-4020', '10 Memory Lane', 'Jbourne@treadstone.com');



create or replace function add_car(
	_car_id INTEGER, 
	_serial_number VARCHAR(30),
	_make VARCHAR(30),
	_model VARCHAR(30),
	_color VARCHAR(30),
	_year Int,
	_price DECIMAL(10,2),
	_new_or_used BOOLEAN
)
returns void
as $main$
begin
	insert into car
	values(_car_id, _serial_number, _make, _model, _color, _year, _price, _new_or_used);
end;
$main$
language plpgsql;

select *
from Car

select add_car(56925, 'JH4DC53815', 'Ford', 'Mustang Mach 1', 'Black', 1969, 80000, false);
select add_car(06831, 'W5YJ3E1E07', 'Chevrolet', 'Chevelle SS', 'Steel Blue', 1970, 60000, false);
select add_car(73258, 'V7KN005892', 'Aston Martin', 'V12 Vanquish', 'Silver', 2002, 150000, true);
select add_car(16405, 'ST3KF18643', 'BMW', 'M5', 'Blue', 2001, 75000, true);



create or replace function add_mechanic(
	_mechanic_id INTEGER,
	_first_name VARCHAR(30),
	_last_name VARCHAR(30),
	_specialization VARCHAR(255)
)
returns void 
as $main$
begin
	insert into mechanic
	values(_mechanic_id, _first_name, _last_name, _specialization);
end;
$main$
language plpgsql;

select *
from Mechanic 

select add_mechanic(4556, 'Tim', 'Miller', 'Electrical Systems');
select add_mechanic(7032, 'Mona Lisa', 'Vito', 'Tune ups, Oil changes, Brake relining, Engine and Transmission rebuilding, as well as general Automotive Knowledge and Expertise');
select add_mechanic(6180, 'Frank', 'Ramirez', 'Transmission');
select add_mechanic(9465, 'Jorge', 'Villalobos', 'Collision Repair');



create or replace function add_part(
	_part_id INT, 
	_name VARCHAR(50),
	_price DECIMAL(10, 2)
)
returns void
as $main$
begin
	insert into part
	values(_part_id, _name, _price);
end;
$main$
language plpgsql;

select *
from Part

select add_part(56840622, 'fuel pump', 295.50);
select add_part(73215786, 'carburetor', 540.00);
select add_part(49660217, 'intake manifold', 1100.00);
select add_part(16405392, 'transmission', 4500.00);



create or replace function add_invoice(
	_invoice_id INTEGER,
	_date TIMESTAMP(30),
	_amount DECIMAL(10, 2),
	_car_id INT,
	_salesperson_id INT,
	_customer_id INT
)
returns void 
as $main$
begin
	insert into invoice
	values(_invoice_id, _date, _amount, _car_id, _salesperson_id, _customer_id);
end;
$main$
language plpgsql;

select *
from Invoice 

select add_invoice(850311, '05-12-2017', 38740.86, 56925, 101, 911);
select add_invoice(748209, '02-05-2015', 3216.55, 06831, 102, 2012);
select add_invoice(521683, '09-16-2003', 46125.92, 73258, 103, 007);
select add_invoice(623394, '10-25-2012', 6532.19, 16405, 104, 2002);



create or replace function add_ServiceTicket( 
	_ticket_id INTEGER,
	_date TIMESTAMP(30),
	_description TEXT,
	_car_id INT,
	_customer_id INT
)
returns void 
as $main$
begin
	insert into ServiceTicket
	values(_ticket_id, _date, _description, _car_id, _customer_id);
end;
$main$
language plpgsql;

select *
from ServiceTicket 

select add_ServiceTicket(514022, '04-18-2017', 'Customer needs new windows as well as a new windshield. The doors and almost the entire body of the car have to be either fixed or replaced since theyre riddled with bullet holes. Also needs several new parts for the engine and transmission.', 56925, 911);
select add_ServiceTicket(369014, '01-25-2015', 'Customer needs new front and rear bumper. Also needs to replace damaged transmission.', 06831, 2012);
select add_ServiceTicket(148036, '08-21-2003', 'Customer needs a new anti missile guidance system. Also needs new bullet proof windows and repairs to some cosmetic damage.', 73258, 007);
select add_ServiceTicket(757089, '10-09-2012', 'Customer needs replace rear headlights and damaged back bumper. Also needs to fix damaged drivers side door and needs extensive repairs to the engine.', 16405, 2002);



create or replace function add_ServiceHistory(
	_history_id INTEGER,
	_car_id INT,
	_ticket_id INT,
	_service_details VARCHAR(255) 
)
returns void 
as $main$
begin
	insert into ServiceHistory
	values(_history_id, _car_id, _ticket_id, _service_details);
end;
$main$
language plpgsql;

select *
from ServiceHistory 

select add_ServiceHistory(930445, 56925, 514022, 'None');
select add_ServiceHistory(560718, 06831, 369014, 'Customer has had work done to his front and rear bumber in the past as well as other cosmetic repairs to the body of his car.');
select add_ServiceHistory(280396, 73258, 148036, 'Customer has totaled several cars in the past and has made it a habit to bring his car to the shop riddled with bullet holes and the aftermath of surviving several explosions. Clearly this customer wishes to Die Another Day.');
select add_ServiceHistory(410572, 16405, 757089, 'None');



create or replace function add_CarMechanic(
	_car_id INTEGER,
	_mechanic_id INT,
	_work_details TEXT
)
returns void 
as $main$
begin
	insert into CarMechanic
	values(_car_id, _mechanic_id, _work_details);
end;
$main$
language plpgsql;

select *
from CarMechanic 

select add_CarMechanic(56925, 4556, 'Fixed car door and entire body, repaired engine and transmission, and installed new windows and windshield.');
select add_CarMechanic(06831, 7032, 'Replaced both bumpers and the transmission.');
select add_CarMechanic(73258, 6180, 'Installed new bullet proof windows and fixed all the cosmetic damage to the body of the car. Even managed to acquire and install a new anti missile guidance system.');
select add_CarMechanic(16405, 9465, 'Could not fix the engine, had to order and install a new one instead. Fixed the damaged door and the back bumper. Also replaced the rear headlights.');



create or replace function add_ServicePart(
	_ticket_id INTEGER,
	_part_id INT,
	_quantity INT
)
returns void 
as $main$
begin
	insert into ServicePart
	values(_ticket_id, _part_id, _quantity);
end;
$main$
language plpgsql;

select *
from ServicePart 

select add_ServicePart(514022, 56840622, 2);
select add_ServicePart(369014, 73215786, 2);
select add_ServicePart(148036, 49660217, 1);
select add_ServicePart(757089, 16405392, 1);




ALTER TABLE Car ADD COLUMN is_serviced BOOLEAN DEFAULT FALSE;



create or replace procedure UpdateServiceStatus(
	_car_id INTEGER,
	_is_serviced BOOLEAN 
)
language plpgsql 
as $$ 
begin 
	
	update car 
	set is_serviced = _is_serviced 
	where car_id = _car_id; 
end;
$$



call UpdateServiceStatus(56925,true)

call UpdateServiceStatus(06831,false)

call UpdateServiceStatus(73258,true)

call UpdateServiceStatus(16405,false)










