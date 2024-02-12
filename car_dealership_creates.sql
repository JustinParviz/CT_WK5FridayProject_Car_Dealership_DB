

CREATE TABLE Salesperson ( --DONE
    Salesperson_ID SERIAL PRIMARY KEY,
    First_Name VARCHAR(30),
    Last_Name VARCHAR(30),
    Phone_Number VARCHAR(20),
    Email_Address VARCHAR(30)
);
CREATE TABLE Customer ( --DONE
    Customer_ID SERIAL PRIMARY KEY,
    First_Name VARCHAR(30),
    Last_Name VARCHAR(30),
    Phone_Number VARCHAR(20),
    Address VARCHAR(30),
    Email_Address VARCHAR(30)
);
CREATE TABLE Car ( --DONE
    Car_ID SERIAL PRIMARY KEY,
    Serial_Number VARCHAR(30),
    Make VARCHAR(30),
    Model VARCHAR(30),
    Color VARCHAR(30),
    Year INT,
    Price DECIMAL(10, 2),
    New_or_Used BOOLEAN
);
CREATE TABLE Invoice ( --DONE
    Invoice_ID SERIAL PRIMARY KEY,
    Date DATE,
    Amount DECIMAL(10, 2),
    Car_ID INT,
    Salesperson_ID INT,
    Customer_ID INT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    FOREIGN KEY (Salesperson_ID) REFERENCES Salesperson(Salesperson_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE ServiceTicket ( --DONE
    Ticket_ID SERIAL PRIMARY KEY,
    Date DATE,
    Description TEXT,
    Car_ID INT,
    Customer_ID INT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE ServiceHistory ( --DONE
    History_ID SERIAL PRIMARY KEY,
    Car_ID INT,
    Ticket_ID INT,
    Service_Details TEXT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    FOREIGN KEY (Ticket_ID) REFERENCES ServiceTicket(Ticket_ID)
);
CREATE TABLE Mechanic ( --DONE
    Mechanic_ID SERIAL PRIMARY KEY,
    First_Name VARCHAR(30),
    Last_Name VARCHAR(30),
    Specialization VARCHAR(255)
);
CREATE TABLE CarMechanic (
    Car_ID INT,
    Mechanic_ID INT,
    Work_Details TEXT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    FOREIGN KEY (Mechanic_ID) REFERENCES Mechanic(Mechanic_ID)
);
CREATE TABLE Part ( --DONE
    Part_ID SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    Price DECIMAL(10, 2)
);
CREATE TABLE ServicePart ( --DONE
    Ticket_ID INT,
    Part_ID INT,
    Quantity INT,
    FOREIGN KEY (Ticket_ID) REFERENCES ServiceTicket(Ticket_ID),
    FOREIGN KEY (Part_ID) REFERENCES Part(Part_ID)
);



