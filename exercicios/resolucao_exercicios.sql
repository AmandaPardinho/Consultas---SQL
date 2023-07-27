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
