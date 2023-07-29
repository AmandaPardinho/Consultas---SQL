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