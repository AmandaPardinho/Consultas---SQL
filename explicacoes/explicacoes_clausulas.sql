USE AdventureWorks2017;

--Explicação do uso da cláusula SELECT
SELECT * FROM Person.Person;

SELECT Title FROM Person.Person;

SELECT * FROM Person.EmailAddress;

--Explicação DISTINCT => não retorna os dados duplicados
SELECT DISTINCT coluna1, coluna2 FROM tabela;

SELECT DISTINCT FirstName, LastName FROM Person.Person;

--Explicação WHERE => filtra informações da tabela 
/*OPERADORES LÓGICOS QUE ACOMPANHAM O WHERE:
	=		igual
	>		maior
	<		menor
	>=		maior ou igual
	<=		menor ou igual
	<>		diferente
	AND		operador lógico "E"
	OR		operador lógico "OU"
*/
SELECT coluna1, coluna2, colunaN FROM tabela WHERE condicao;

SELECT * FROM Person.Person WHERE LastName = 'Miller';

SELECT * FROM Person.Person WHERE LastName = 'Miller' AND FirstName = 'Anna';

SELECT * FROM Production.Product;

SELECT * FROM Production.Product WHERE Color = 'blue' OR Color = 'red';

SELECT * FROM Production.Product WHERE ListPrice > 1500;

SELECT * FROM Production.Product WHERE ListPrice > 1500 AND ListPrice < 5000;

SELECT * FROM Production.Product WHERE Color <> 'red';

--Explicação COUNT => retorna o número de linhas que foi definido
SELECT COUNT(coluna) FROM tabela;

SELECT COUNT(*) FROM Person.Person;

SELECT COUNT(Title) FROM Person.Person;

SELECT COUNT(DISTINCT Title) FROM Person.Person;

--Explicação TOP => limita a quantidade de dados que retornam de uma busca
SELECT TOP 10 * FROM tabela;

SELECT TOP 10 * FROM Production.Product;

--Explicação ORDER BY => permite a ordenação dos resultados em uma coluna em ordem crescente ou decrescente
SELECT coluna1, coluna2 FROM tabela ORDER BY coluna1 ASC/DESC;

SELECT * FROM Person.Person ORDER BY FirstName ASC;

SELECT * FROM Person.Person ORDER BY FirstName DESC;

--Explicação BETWEEN => usado para encontrar um valor entre um valor mínimo e um valor máximo
SELECT * FROM tabela WHERE condicao BETWEEN x AND y;

SELECT ProductID, Name, ListPrice 
FROM Production.Product 
WHERE ListPrice BETWEEN 1000 AND 1500;

SELECT * FROM HumanResources.Employee;

SELECT BusinessEntityID, HireDate
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009-01-01' AND '2010-01-01'
ORDER BY HireDate ASC;

--Explicação IN => é usado junto com o WHERE para verificar se um valor corresponde a qualquer valor passado na lista de valores
valor IN (valor1, valor2);

valor IN (SELECT valor FROM tabela) --subquery

SELECT * FROM Person.Person WHERE BusinessEntityId IN (2, 7, 13);

--Explicação LIKE => usado quando se tem a informação incerta; não é case sensitive
SELECT * FROM Person.Person WHERE FirstName LIKE 'ovi%';

SELECT * FROM Person.Person WHERE FirstName LIKE '%to';

SELECT * FROM Person.Person WHERE FirstName LIKE '%essa%';

SELECT * FROM Person.Person WHERE FirstName LIKE '%ro_'; --se limita a apenas um caracter após a sequência "ro"

--Cláusulas MIN, MAX, SUM, AVG => são funções de agregação, ou seja, agregam ou combinam dados de uma tabela em um único resultado
SELECT TOP 10 * FROM Sales.SalesOrderDetail;

SELECT TOP 10 SUM(LineTotal) AS 'Soma' 
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MIN(LineTotal) AS 'ValorMínimo'
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MAX(LineTotal) AS 'ValorMáximo'
FROM Sales.SalesOrderDetail;

SELECT TOP 10 AVG(LineTotal) AS 'Média'
FROM Sales.SalesOrderDetail;

--Cláusula GROUP BY => divide o resultado da pesquisa em grupos
SELECT coluna1, funcaoDeAgregacao(coluna2) FROM tabela GROUP BY coluna1;

SELECT * FROM Sales.SalesOrderDetail

SELECT SpecialOfferID, SUM(UnitPrice) AS 'SomaUnitPrice'
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID;

SELECT ProductID, COUNT(ProductID) AS 'ContagemProduto'
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT * FROM Person.Person;

SELECT FirstName, COUNT(FirstName) AS 'Nome'
FROM Person.Person
GROUP BY FirstName;

SELECT * FROM Production.Product;

SELECT Color, AVG(ListPrice) AS 'MédiaPreço'
FROM Production.Product
WHERE Color = 'silver'
GROUP BY Color;

--