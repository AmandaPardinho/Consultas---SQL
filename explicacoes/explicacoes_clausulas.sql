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

--Cláusula HAVING => usado junto com o GROUP BY para filtrar resultados de um agrupamento (é um "WHERE" para dados agrupados)
/*Diferença entre 'HAVING' e 'WHERE' => o 'HAVING' é usado depois que os dados foram agrupados enquanto o 'WHERE' é aplicado antes de agrupá-los */
SELECT coluna1, funcaoAgregacao (coluna2)
FROM tabela
GROUP BY coluna1 HAVING condicao;

SELECT FirstName, COUNT(FirstName) AS 'Quantidade'
FROM Person.Person
GROUP BY FirstName HAVING COUNT(FirstName) > 10;

SELECT ProductID, SUM(LineTotal) AS 'SomaTotal'
FROM Sales.SalesOrderDetail
GROUP BY ProductID 
HAVING SUM(LineTotal) BETWEEN 162000 AND 500000;

SELECT FirstName, COUNT(FirstName) AS 'Quantidade'
FROM Person.Person
WHERE Title = 'Mr.'
GROUP BY FirstName HAVING COUNT(FirstName) > 10;

--Cláusula AS => renomear (apelidar) colunas com um termo específico
SELECT TOP 10 * FROM Production.Product;

SELECT TOP 10 AVG(ListPrice) AS 'PreçoMédio'
FROM Production.Product;

--Cláusula INNER JOIN => junta informações de duas tabelas
SELECT tabela1.colunaPK1, tabela1.coluna2, tabela2.coluna1, tabela2.coluna2
FROM tabela1
INNER JOIN tabela2 ON tabela2.colunaPK2 = tabela1(tabela2.colunaPK2);

SELECT * FROM Person.Person;
SELECT * FROM Person.EmailAddress;
SELECT Pessoa.BusinessEntityID, FirstName, LastName, EmailPessoa.EmailAddress
FROM Person.Person AS Pessoa
	INNER JOIN Person.EmailAddress AS EmailPessoa
		ON Pessoa.BusinessEntityID = EmailPessoa.BusinessEntityID;

SELECT * FROM Production.Product;
SELECT * FROM Production.ProductSubcategory;
SELECT Produto.Name AS 'Nome do Produto', Produto.ListPrice, 
	Subcategoria.Name AS 'Nome da Subcategoria'
FROM Production.Product AS Produto
	INNER JOIN  Production.ProductSubcategory AS Subcategoria
		ON Produto.ProductSubcategoryID = Subcategoria.ProductSubcategoryID;

SELECT * FROM Person.BusinessEntityAddress;
SELECT * FROM Person.Address;
SELECT * FROM Person.BusinessEntityAddress AS BAddress
	INNER JOIN Person.Address AS PAddress 
		ON PAddress.AddressID = BAddress.AddressID;

--Outros tipos de JOIN
/*	INNER JOIN => retorna apenas o que existem tanto na tabela1 quanto na tabela2 (interseção)
	(FULL) OUTER JOIN => retorna o conjunto de todos os registros da tabela1 e tabela2 quando forem iguais e, caso não haja correspondente equivalente, retorna null
	LEFT (OUTER) JOIN => retorna todos os registros da tabela1 e os registros correspondentes da tabela2; caso não haja registros correspondentes, retorna null
	RIGHT JOIN 
*/
SELECT * FROM Person.Person AS PP
	INNER JOIN Sales.PersonCreditCard AS PC
		ON PP.BusinessEntityID = PC.BusinessEntityID; -- 19118 LINHAS

SELECT * FROM Person.Person AS PP
	LEFT JOIN Sales.PersonCreditCard AS PC
		ON PP.BusinessEntityID = PC.BusinessEntityID -- 19972 LINHAS
WHERE PC.BusinessEntityID IS NULL; --COM A CLÁUSULA WHERE => 854 LINHAS

--Cláusula UNION => combina dois ou mais resultados de um SELECT em um único resultado, removendo os resultados duplicados
	--UNION ALL => mantém os resultados duplicados
SELECT coluna1, coluna2 FROM tabela1
UNION
SELECT coluna1, coluna2 FROM tabela2;

SELECT [ProductID], [Name], [ProductNumber] FROM Production.Product WHERE Name LIKE '%Chain%'
UNION
SELECT [ProductID], [Name], [ProductNumber] FROM Production.Product WHERE Name LIKE '%Decal%';

SELECT FirstName, Title FROM Person.Person WHERE Title = 'Mr.'
UNION
SELECT FirstName, Title FROM Person.Person WHERE MiddleName = 'A';

--Cláusula SELF JOIN => junta dados de uma mesma tabela
