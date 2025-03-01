CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY ,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(20) NOT NULL UNIQUE,
    Address TEXT NOT NULL
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    TotalAmount DECIMAL(10,2) NOT NULL,
    OrderDate DATETIME,
    Status VARCHAR(20) NOT NULL DEFAULT 'Pending' CHECK (Status IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')),
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer
);



CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    ContactInfo VARCHAR(255) NOT NULL,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE OrderProduct (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,

    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders,
    FOREIGN KEY (ProductID) REFERENCES Product
);
CREATE TABLE OrderDetails (
    OrderDetailsID INT PRIMARY KEY ,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    OrderID INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders
);
CREATE TABLE Product (
    ProductID INT PRIMARY KEY ,
    Category VARCHAR(100) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL
);
CREATE TABLE ProductOrderDetails (
    ProductID INT NOT NULL,
    OrderDetailsID INT NOT NULL,
    PRIMARY KEY (ProductID, OrderDetailsID),
    FOREIGN KEY (ProductID) REFERENCES Product,
    FOREIGN KEY (OrderDetailsID) REFERENCES OrderDetails
);
CREATE TABLE ProductSupplier (
    SupplierID INT NOT NULL,
    ProductID INT NOT NULL,
    PRIMARY KEY (SupplierID, ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier,
    FOREIGN KEY (ProductID) REFERENCES Product
);

INSERT INTO Customer ( CustomerID,Name,Email, PhoneNumber, Address)
VALUES ('1','omar898@gmail.com', 'Omar Mahmoud', '01098765432', 'Cairo');

INSERT INTO Customer (CustomerID,Name,Email , PhoneNumber, Address)
VALUES ('2','salma_nagy@hotmail.com', 'Salma Nagy', '01122334455', 'Alexandria');


INSERT INTO Orders ( OrderID, TotalAmount, Status, OrderDate, CustomerID)
VALUES ('1',2000, 'Processing', '2024-03-02', 2);

INSERT INTO Orders (OrderID,TotalAmount, Status, OrderDate, CustomerID)
VALUES ('2',750, 'Cancelled', '2024-03-03', 1);


INSERT INTO OrderDetails(OrderDetailsID, Quantity, Price, OrderID)
VALUES (1,30, 450,1);

INSERT INTO OrderDetails(OrderDetailsID,Quantity, Price, OrderID)
VALUES (2,75, 1500,2);


INSERT INTO Supplier(SupplierID,ContactInfo, Name)
VALUES (1,'01056473829', 'AHMED MOHAMED');

INSERT INTO Supplier(SupplierID,ContactInfo, Name)
VALUES (2,'01184736294', 'DINA SHERIF');



INSERT INTO ProductSupplier(SupplierID, ProductID)
VALUES (2, 2);

INSERT INTO ProductSupplier(SupplierID, ProductID)
VALUES (2, 1);




INSERT INTO Product(ProductID, Category, Name, Description, Price)
VALUES (1, 'Chocolate', 'Sweet and creamy', 'Snacks', 50);

INSERT INTO Product(ProductID, Category, Name, Description, Price)
VALUES  (2, 'Dairy', 'Milk', 'Fresh cow milk', 20);


INSERT INTO ProductOrderDetails (ProductID, OrderDetailsID)
VALUES (1, 2);

INSERT INTO ProductOrderDetails (ProductID, OrderDetailsID)
VALUES (2, 2);



INSERT INTO OrderProduct (OrderID, ProductID)
VALUES (2, 1);

INSERT INTO OrderProduct (OrderID, ProductID)
VALUES (1, 2);



