USE AdventureWorks2017;

--Exerc�cio 1 
SELECT * FROM Person.Person;

SELECT FirstName, LastName FROM Person.Person;

--Exerc�cio 2
SELECT DISTINCT LastName FROM Person.Person;

--Exerc�cio 3
SELECT * FROM Production.Product;

SELECT ProductID, Name, Weight, WeightUnitMeasureCode 
FROM Production.Product 
WHERE 
	(Weight > 500 AND Weight <= 700 AND WeightUnitMeasureCode = 'G')
	OR 
	(Weight > 1.102 AND Weight <= 1.543 AND WeightUnitMeasureCode = 'LB');

--Exerc�cio 4
SELECT * FROM HumanResources.Employee;

SELECT Employee.BusinessEntityID, JobTitle, MaritalStatus, Gender, SalariedFlag, CurrentFlag
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' AND SalariedFlag = 1;

--Exerc�cio 5
SELECT * FROM Person.Person;

SELECT * FROM Person.EmailAddress;

SELECT Person.BusinessEntityID, FirstName, LastName, EmailAddress.EmailAddress
FROM Person.Person
	INNER JOIN Person.EmailAddress ON EmailAddress.BusinessEntityID = Person.BusinessEntityID
WHERE FirstName = 'Peter' AND LastName = 'Krebs';

--Exerc�cio 6
SELECT * FROM Production.Product;

SELECT COUNT(ProductId) FROM Production.Product;

--Exerc�cio 7
SELECT COUNT(Size) FROM Production.Product;

--Exerc�cio 8
SELECT COUNT(DISTINCT Size) FROM Production.Product;

--Exerc�cio 9
SELECT * FROM Production.Product;

SELECT TOP 10 ProductID, Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

--Exerc�cio 10
SELECT * FROM Production.Product;

SELECT TOP 4 ProductID, Name, ProductNumber
FROM Production.Product
ORDER BY ProductId ASC;

--Exerc�cio 11
SELECT * FROM Production.Product;

SELECT COUNT(ProductId)
FROM Production.Product
WHERE ListPrice > 1500;

--Exerc�cio 12
SELECT * FROM Person.Person;

SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName LIKE 'P%';

--Exerc�cio 13
SELECT * FROM Person.Address;

SELECT COUNT(DISTINCT City)
FROM Person.Address;

--Exerc�cio 14
SELECT * FROM Person.Address;

SELECT DISTINCT City
FROM Person.Address
ORDER BY City ASC;

--Exerc�cio 15
SELECT * FROM Production.Product;

SELECT COUNT(Color)
FROM Production.Product
WHERE Color = 'Red' AND ListPrice BETWEEN 500 AND 1000;

--Exerc�cio 16
SELECT * FROM Production.Product;

SELECT COUNT(Name)
FROM Production.Product
WHERE Name LIKE '%road%';

--Exerc�cio 17
SELECT * FROM Person.Person;

SELECT MiddleName, COUNT(MiddleName) AS 'NomeDoMeio'
FROM Person.Person
WHERE MiddleName <> ''
GROUP BY MiddleName
ORDER BY NomeDoMeio ASC;

--Exerc�cio 18
SELECT * FROM Sales.SalesOrderDetail;

SELECT ProductID, AVG(OrderQty) AS 'MediaQuantidadeVendida'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID;

--Exerc�cio 19
SELECT * FROM Sales.SalesOrderDetail;

SELECT TOP 10 SUM(LineTotal) AS 'TopDez', ProductID
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TopDez DESC;

--Exerc�cio 20
SELECT * FROM Production.WorkOrder
ORDER BY ProductID ASC;

SELECT ProductID, 
	COUNT(ProductID) AS 'TotalProdutos',
	AVG(OrderQty) AS 'QuantidadeMedia'
FROM Production.WorkOrder
GROUP BY ProductID
ORDER BY ProductID;

--Exerc�cio 21
SELECT * FROM Person.Address;

SELECT StateProvinceID, COUNT(StateProvinceId) AS 'Quantidade'
FROM Person.Address
GROUP BY StateProvinceID 
HAVING COUNT('Quantidade') > 1000
ORDER BY 'Quantidade' ASC;

--Exerc�cio 22
SELECT * FROM Sales.SalesOrderDetail;

SELECT ProductID, AVG(LineTotal) AS 'M�dia'
FROM Sales.SalesOrderDetail
GROUP BY ProductID HAVING AVG(LineTotal) <= 1000000
ORDER BY 'M�dia' DESC;

--Exerc�cio 23
SELECT * FROM Person.Person;
SELECT FirstName AS 'Nome', LastName AS 'Sobrenome'
FROM Person.Person;

SELECT * FROM Production.Product;
SELECT ProductID, ProductNumber AS 'C�digo do Produto'
FROM Production.Product;

SELECT * FROM Sales.SalesOrderDetail;
SELECT SalesOrderID, UnitPrice AS 'Pre�o Unit�rio'
FROM Sales.SalesOrderDetail;

--Exerc�cio 24
SELECT * FROM Person.PersonPhone;

SELECT * FROM Person.PhoneNumberType;

SELECT TipoFone.Name, Fone.BusinessEntityID, Fone.PhoneNumberTypeID, Fone.PhoneNumber
FROM Person.PersonPhone AS Fone
	INNER JOIN Person.PhoneNumberType AS TipoFone
		ON Fone.PhoneNumberTypeID = TipoFone.PhoneNumberTypeID;

--Exerc�cio 25
SELECT * FROM Person.Address;

SELECT * FROM Person.StateProvince;

SELECT Endereco.AddressID, Endereco.City, Provincia.StateProvinceID, 
	Provincia.Name AS 'Nome da Prov�ncia'
FROM Person.Address AS Endereco
	INNER JOIN Person.StateProvince AS Provincia
		ON Endereco.StateProvinceID = Provincia.StateProvinceID;

--Exerc�cio 26 (Northwind)
SELECT * FROM Employees;

SELECT A.FirstName, A.LastName, A.HireDate, B.FirstName, B.LastName, B.HireDate
FROM Employees A, Employees B
WHERE DATEPART(YEAR, A.HireDate) = DATEPART(YEAR, B.HireDate);

--Exerc�cio 27 (Northwind)
SELECT * FROM [Order Details Extended];

SELECT A.ProductName, A.Discount, B.ProductName, B.Discount
FROM [Order Details Extended] A, [Order Details Extended] B
WHERE A.Discount = B.Discount;

--Exerc�cio 28
SELECT * FROM Production.Product;

SELECT Product.Name, Product.ListPrice
FROM Production.Product
WHERE ListPrice > (SELECT AVG(Product.ListPrice) FROM Production.Product);

--Exerc�cio 29
SELECT * FROM Person.Person;

SELECT * FROM HumanResources.Employee;
	
------SOLU��O 1------
SELECT P.BusinessEntityID, P.FirstName, P.MiddleName, P.LastName, HE.JobTitle
FROM Person.Person AS P
	INNER JOIN HumanResources.Employee AS HE ON P.BusinessEntityID = HE.BusinessEntityID
WHERE HE.JobTitle = 'Design Engineer';

------SOLU��O 2------
SELECT P.BusinessEntityId, P.FirstName, P.MiddleName, P.LastName
FROM Person.Person AS P
WHERE BusinessEntityID IN (
	SELECT HE.BusinessEntityID 
	FROM HumanResources.Employee AS HE
	WHERE JobTitle = 'Design Engineer'
);

--Exerc�cio 30
SELECT * FROM Person.Address;

SELECT * FROM Person.StateProvince;

SELECT A.StateProvinceId, A.AddressLine1
FROM Person.Address AS A
WHERE StateProvinceId IN (
	SELECT S.StateProvinceId
	FROM Person.StateProvince AS S
	WHERE S.Name = 'Alberta'
);

--Exerc�cio 31
SELECT * FROM HumanResources.Employee;

SELECT HE.BusinessEntityID, 
	DATEPART(MONTH, HE.BirthDate) AS 'M�s', 
	DATEPART(YEAR, HE.BirthDate) AS 'Ano'
FROM HumanResources.Employee AS HE
ORDER BY Ano;

--Exerc�cio 32
SELECT * FROM Production.Product;
SELECT * FROM Person.Person;

SELECT UPPER(Name) AS 'NAME' FROM Production.Product;

SELECT CONCAT(FirstName, ' ', MiddleName, ' ', LastName) AS 'NomeCompleto'
FROM Person.Person
WHERE MiddleName IS NOT NULL;

SELECT REPLACE(rowguid, '-', '.')
FROM Person.Person;

SELECT SUBSTRING(ProductNumber, 1, 2) AS 'LetrasC�digo'
FROM Production.Product
ORDER BY ProductNumber ASC;

SELECT LOWER(Color) AS 'Cor'
FROM Production.Product
WHERE Color IS NOT NULL;

SELECT ProductNumber, LEN(ProductNumber)
FROM Production.Product;

--Exerc�cio 33
SELECT * FROM Production.ProductCostHistory;

SELECT ROUND(StandardCost, 2) FROM Production.ProductCostHistory;

--Exerc�cio 34
CREATE TABLE Pacientes(
	PacienteId INT PRIMARY KEY,
	DataAtendimento DATETIME2 NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Idade INT NOT NULL,
	Genero VARCHAR(25) NOT NULL,
	Endereco VARCHAR(100) NOT NULL,
	DiagnosticoAlopatia VARCHAR(300),
	MedicamentosAlopatia VARCHAR(300),
	Sintomas VARCHAR(500)
);

CREATE TABLE Tratamentos(
	TratamentoId INT PRIMARY KEY,
	MedicamentoMTC VARCHAR(100),
	Pontos VARCHAR(100) NOT NULL,
	PacienteId INT FOREIGN KEY REFERENCES Pacientes(PacienteId)
);

SELECT * FROM Pacientes;

SELECT * FROM Tratamentos;

--Exerc�cio 35