CREATE DATABASE CargillsDB;
GO
USE CargillsDB;

CREATE TABLE Customer (
    CustomerID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Contact_Info VARCHAR(10)
);

CREATE TABLE Cashier (
    CashierID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL
);


CREATE TABLE Manager (
    ManagerID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Contact_Info VARCHAR(10)
);


CREATE TABLE Store_Admin (
    StoreAdminID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Contact_Info VARCHAR(10)
);


CREATE TABLE Supplier (
    SupplierID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Contact_Info VARCHAR(10),
    StoreAdminID VARCHAR(10),
    FOREIGN KEY (StoreAdminID) REFERENCES Store_Admin(StoreAdminID)
);


CREATE TABLE Item (
    ItemID VARCHAR(10) PRIMARY KEY,
    Item_Name VARCHAR(40) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category VARCHAR(20),
    Stock_Qty INT,
    ManagerID VARCHAR(10),
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);


CREATE TABLE [Order] (
    OrderID VARCHAR(10) PRIMARY KEY,
    Order_Date DATE,
    CustomerID VARCHAR(10),
    CashierID VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (CashierID) REFERENCES Cashier(CashierID)
);



CREATE TABLE Order_Details (
    OrderID VARCHAR(10),
    ItemID VARCHAR(10),
    Quantity INT,
    PRIMARY KEY (OrderID, ItemID),
    FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);


CREATE TABLE Supply_Order (
    SupplierOrderID VARCHAR(10) PRIMARY KEY,
    Date DATE,
    ManagerID VARCHAR(10),
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);


CREATE TABLE Supplier_Supply_Order (
    SupplierID VARCHAR(10),
    SupplierOrderID VARCHAR(10),
    PRIMARY KEY (SupplierID, SupplierOrderID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (SupplierOrderID) REFERENCES Supply_Order(SupplierOrderID)
);


CREATE TABLE Supply (
    SupplyID VARCHAR(10) PRIMARY KEY,
    SupplierID VARCHAR(10),
    ItemID VARCHAR(10),
    SupplyDate DATE,
    Quantity INT,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);


CREATE TABLE Receipt (
    ReceiptID INT PRIMARY KEY,
    OrderID VARCHAR(10),
    PaymentMethod VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES [Order](OrderID)
);

