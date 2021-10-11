/*
CREATE TABLE Employee(EmployeeID INT IDENTITY(1,1) UNIQUE,
					  FullName VARCHAR(35) NOT NULL,
					  Age INT NOT NULL,
					  DoB DATE NOT NULL,
					  Position VARCHAR(20),
					  PhoneNo VARCHAR(11) UNIQUE NOT NULL,
					  Address VARCHAR(50),
					  Status VARCHAR(10),
					  DateOfEmployment Date NOT NULL,
					  ShiftType VARCHAR(10) NOT NULL)

CREATE TABLE Products(ProductsID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
					  ProductName VARCHAR(20) NOT NULL,
					  Barcode INT NOT NULL,
					  ExpiryDate DATE NOT NULL,
					  Price VARCHAR(15) NOT NULL,
					  SupplierID INT NOT NULL FOREIGN KEY REFERENCES Products(ProductsID),
					  OrdersID INT NOT NULL FOREIGN KEY REFERENCES Products(ProductsID),
					  ProductTypeID INT FOREIGN KEY REFERENCES Products(ProductsID))

CREATE TABLE Suppliers(SuppliersID INT IDENTITY(1,1) NOT NULL UNIQUE,
					   SuppliersName VARCHAR(25) NOT NULL,
					   SupAddress VARCHAR(25) NOT NULL,
					   SupPhoneNo VARCHAR(11) NOT NULL,
					   OrdersID INT NOT NULL,
					   ProductsID INT NOT NULL)

CREATE TABLE Orders(OrdersID INT IDENTITY(1,1) NOT NULL,
					OrderDate DATE NOT NULL,
					QtyOrdered INT NOT NULL,
					ProductsID INT NOT NULL,
					EmployeeID INT NOT NULL,
					SuppliersID INT NOT NULL)

CREATE TABLE ProductType(ProductTypeID INT IDENTITY(1,1) NOT NULL,
						ProductType VARCHAR(20) NOT NULL,
						ProductsID INT NOT NULL)

CREATE TABLE Transactions(TransactionID INT IDENTITY(1,1) NOT NULL UNIQUE,
						  ProductItems VARCHAR(50) NOT NULL,
						  PaymentMethod VARCHAR(10) NOT NULL,
						  AmountPerTransaction NUMERIC NOT NULL,
						  PaymentTime DATETIME NOT NULL,
						  CashierID INT NOT NULL)

CREATE TABLE Cashier(CashierID INT IDENTITY(1,1) NOT NULL UNIQUE,
					 EmployeeID INT NOT NULL,
					 TransactionID INT NOT NULL,
					 StationStart DATETIME NOT NULL,
					 StationEnd DATETIME NOT NULL)
*/

	
						  


