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

--Explicação IN