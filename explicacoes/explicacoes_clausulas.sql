USE AdventureWorks2017;

--Explica��o do uso da cl�usula SELECT
SELECT * FROM Person.Person;

SELECT Title FROM Person.Person;

SELECT * FROM Person.EmailAddress;

--Explica��o DISTINCT => n�o retorna os dados duplicados
SELECT DISTINCT coluna1, coluna2 FROM tabela;

SELECT DISTINCT FirstName, LastName FROM Person.Person;

--Explica��o WHERE => filtra informa��es da tabela 
/*OPERADORES L�GICOS QUE ACOMPANHAM O WHERE:
	=		igual
	>		maior
	<		menor
	>=		maior ou igual
	<=		menor ou igual
	<>		diferente
	AND		operador l�gico "E"
	OR		operador l�gico "OU"
*/
SELECT coluna1, coluna2, colunaN FROM tabela WHERE condicao;

SELECT * FROM Person.Person WHERE LastName = 'Miller';

SELECT * FROM Person.Person WHERE LastName = 'Miller' AND FirstName = 'Anna';

SELECT * FROM Production.Product;

SELECT * FROM Production.Product WHERE Color = 'blue' OR Color = 'red';

SELECT * FROM Production.Product WHERE ListPrice > 1500;

SELECT * FROM Production.Product WHERE ListPrice > 1500 AND ListPrice < 5000;

SELECT * FROM Production.Product WHERE Color <> 'red';

--Explica��o COUNT => retorna o n�mero de linhas que foi definido
SELECT COUNT(coluna) FROM tabela;

SELECT COUNT(*) FROM Person.Person;

SELECT COUNT(Title) FROM Person.Person;

SELECT COUNT(DISTINCT Title) FROM Person.Person;

--Explica��o TOP => limita a quantidade de dados que retornam de uma busca
SELECT TOP 10 * FROM tabela;

SELECT TOP 10 * FROM Production.Product;

--Explica��o ORDER BY => permite a ordena��o dos resultados em uma coluna em ordem crescente ou decrescente
SELECT coluna1, coluna2 FROM tabela ORDER BY coluna1 ASC/DESC;

SELECT * FROM Person.Person ORDER BY FirstName ASC;

SELECT * FROM Person.Person ORDER BY FirstName DESC;

--Explica��o BETWEEN => usado para encontrar um valor entre um valor m�nimo e um valor m�ximo
SELECT * FROM tabela WHERE condicao BETWEEN x AND y;

SELECT ProductID, Name, ListPrice 
FROM Production.Product 
WHERE ListPrice BETWEEN 1000 AND 1500;

SELECT * FROM HumanResources.Employee;

SELECT BusinessEntityID, HireDate
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009-01-01' AND '2010-01-01'
ORDER BY HireDate ASC;

--Explica��o IN => � usado junto com o WHERE para verificar se um valor corresponde a qualquer valor passado na lista de valores
valor IN (valor1, valor2);

valor IN (SELECT valor FROM tabela) --subquery

SELECT * FROM Person.Person WHERE BusinessEntityId IN (2, 7, 13);

--Explica��o LIKE => usado quando se tem a informa��o incerta; n�o � case sensitive
SELECT * FROM Person.Person WHERE FirstName LIKE 'ovi%';

SELECT * FROM Person.Person WHERE FirstName LIKE '%to';

SELECT * FROM Person.Person WHERE FirstName LIKE '%essa%';

SELECT * FROM Person.Person WHERE FirstName LIKE '%ro_'; --se limita a apenas um caracter ap�s a sequ�ncia "ro"

--Cl�usulas MIN, MAX, SUM, AVG => s�o fun��es de agrega��o, ou seja, agregam ou combinam dados de uma tabela em um �nico resultado
SELECT TOP 10 * FROM Sales.SalesOrderDetail;

SELECT TOP 10 SUM(LineTotal) AS 'Soma' 
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MIN(LineTotal) AS 'ValorM�nimo'
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MAX(LineTotal) AS 'ValorM�ximo'
FROM Sales.SalesOrderDetail;

SELECT TOP 10 AVG(LineTotal) AS 'M�dia'
FROM Sales.SalesOrderDetail;

--Cl�usula GROUP BY => divide o resultado da pesquisa em grupos
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

SELECT Color, AVG(ListPrice) AS 'M�diaPre�o'
FROM Production.Product
WHERE Color = 'silver'
GROUP BY Color;

--Cl�usula HAVING => usado junto com o GROUP BY para filtrar resultados de um agrupamento (� um "WHERE" para dados agrupados)
/*Diferen�a entre 'HAVING' e 'WHERE' => o 'HAVING' � usado depois que os dados foram agrupados enquanto o 'WHERE' � aplicado antes de agrup�-los */
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

--Cl�usula AS => renomear (apelidar) colunas com um termo espec�fico
SELECT TOP 10 * FROM Production.Product;

SELECT TOP 10 AVG(ListPrice) AS 'Pre�oM�dio'
FROM Production.Product;

--Cl�usula INNER JOIN => junta informa��es de duas tabelas
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
SELECT Produto.Name AS 'Nome do Produto',  
	Subcategoria.Name AS 'Nome da Subcategoria', Produto.ListPrice
FROM Production.Product AS Produto
	INNER JOIN  Production.ProductSubcategory AS Subcategoria
		ON Produto.ProductSubcategoryID = Subcategoria.ProductSubcategoryID;

SELECT * FROM Person.BusinessEntityAddress;
SELECT * FROM Person.Address;
SELECT * FROM Person.BusinessEntityAddress AS BAddress
	INNER JOIN Person.Address AS PAddress 
		ON PAddress.AddressID = BAddress.AddressID;

--Outros tipos de JOIN
/*	INNER JOIN => retorna apenas o que existem tanto na tabela1 quanto na tabela2 (interse��o)
	(FULL) OUTER JOIN => retorna o conjunto de todos os registros da tabela1 e tabela2 quando forem iguais e, caso n�o haja correspondente equivalente, retorna null
	LEFT (OUTER) JOIN => retorna todos os registros da tabela1 e os registros correspondentes da tabela2; caso n�o haja registros correspondentes, retorna null
	RIGHT JOIN => retorna todos os registros da tabela2 e os registros correspondentes da tabela1; caso n�o haja registros correspondentes, retorna null
*/
SELECT * FROM Person.Person AS PP
	INNER JOIN Sales.PersonCreditCard AS PC
		ON PP.BusinessEntityID = PC.BusinessEntityID; -- 19118 LINHAS

SELECT * FROM Person.Person AS PP
	LEFT JOIN Sales.PersonCreditCard AS PC
		ON PP.BusinessEntityID = PC.BusinessEntityID -- 19972 LINHAS
WHERE PC.BusinessEntityID IS NULL; --COM A CL�USULA WHERE => 854 LINHAS

--Cl�usula UNION => combina dois ou mais resultados de um SELECT em um �nico resultado, removendo os resultados duplicados
	--UNION ALL => mant�m os resultados duplicados
SELECT coluna1, coluna2 FROM tabela1
UNION
SELECT coluna1, coluna2 FROM tabela2;

SELECT [ProductID], [Name], [ProductNumber] FROM Production.Product WHERE Name LIKE '%Chain%'
UNION
SELECT [ProductID], [Name], [ProductNumber] FROM Production.Product WHERE Name LIKE '%Decal%';

SELECT FirstName, Title FROM Person.Person WHERE Title = 'Mr.'
UNION
SELECT FirstName, Title FROM Person.Person WHERE MiddleName = 'A';

--Cl�usula SELF JOIN => junta dados de uma mesma tabela
SELECT coluna1 FROM tabelaA as A, tabelaB as B where condicao;

SELECT * FROM Customers;

SELECT A.ContactName, A.Region, B.ContactName, B.Region
FROM Customers A, Customers B
WHERE A.Region = B.Region;

--Subquery (SUBSELECT) => � um SELECT dentro de outro SELECT
SELECT colunas 
FROM tabela
WHERE colunaX (condi��o) (SELECT condi��oASerTestada FROM tabela);

--Cl�usula DATEPART => extrai informa��es de um dado em formato de data
SELECT * FROM Sales.SalesOrderHeader;

SELECT SalesOrderID, DATEPART(MONTH, OrderDate) AS 'M�s'
FROM Sales.SalesOrderHeader;

SELECT AVG(TotalDue) AS 'M�dia', DATEPART(MONTH, OrderDate) as 'M�s'
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(MONTH, OrderDate)
ORDER BY M�s;

--Opera��es em Strings
SELECT * FROM Person.Person;

SELECT CONCAT(FirstName, ' ', LastName)
FROM Person.Person;

SELECT UPPER(FirstName), LOWER(FirstName)
FROM Person.Person;

SELECT FirstName, LEN(FirstName)
FROM Person.Person;

SELECT FirstName, SUBSTRING(FirstName, 1, 3)
FROM Person.Person;

SELECT ProductNumber, REPLACE(ProductNumber, '-', '#')
FROM Production.Product;

--Opera��es Matem�ticas
SELECT * FROM Sales.SalesOrderDetail;

SELECT (UnitPrice + LineTotal) FROM Sales.SalesOrderDetail;

SELECT (LineTotal - UnitPrice) FROM Sales.SalesOrderDetail;

SELECT (UnitPrice * LineTotal) FROM Sales.SalesOrderDetail;

SELECT (UnitPrice / LineTotal) FROM Sales.SalesOrderDetail;

SELECT AVG(LineTotal) FROM Sales.SalesOrderDetail;

SELECT SUM(LineTotal) FROM Sales.SalesOrderDetail;

SELECT MIN(LineTotal) FROM Sales.SalesOrderDetail;

SELECT MAX(LineTotal) FROM Sales.SalesOrderDetail;

SELECT ROUND(LineTotal, 2) FROM Sales.SalesOrderDetail; --o segundo valor contido no round � a precis�o do arredondamento

SELECT SQRT(LineTotal) FROM Sales.SalesOrderDetail;

--Tipos de Dados
/*
 * 1 - Booleanos
	-inicializado como nulo
	-pode receber 1 ou 0
	-no SQL Server, para representar um tipo booleano, usa-se o BIT

 * 2 - Caractere
	-usa-se o char (tamanho fixo) => permite inserir uma quantidade fixa de caracteres e sempre ocupa todo espa�o reservado (se reservei 50 espa�os, ocupar� 50 espa�os na mem�ria mesmo que s� sejam usados 10 espa�os)
	-varchar ou nvarchar (tamanho vari�vel) => permite inserir at� uma quantidade que foi definida; por�m s� usa o espa�o que for preenchido

 * 3 - Num�rico
	-valores exatos=>
		-n�o permitem valores fracionados =>
			-TINYINT => menor limite de valor
			-SMALLINT => limite maior que o TINYINT
			-INT => limite maior que o SMALLINT
			-BIGINT => limite maior que o INT
		-permitem valores fracionados =>
			-NUMERIC ou DECIMAL => 
				-valores exatos que permitem o armazenamento da parte fracionada
				-aceitam a especifica��o da precis�o (quantidade de d�gitos que podem ser armazenados) e da escala(n�mero de d�gitos na parte fracionada)
	-valores aproximados =>
		-REAL => precis�o de at� 15 d�gitos
		-FLOAT => mesmo conceito de REAL

 * 4 - Temporais
	-DATE => armazena data no formato aaaa/mm/dd
	-DATETIME => armazena data e hora no formato aaaa/mm/dd:hh:mm:ss
	-DATETIME2 => armazena data e hora com adi��o de milissegundos no formato aaaa/mm/dd:hh:mm:sssssss
	-SMALLDATETIME => data e hora respeitando o limite entre '1900-01-01:00:00:00' at� '2079-06-06:23:59:59'
	-TIME =>horas, minutos, segundos e milissegundos respeitando o limite de '00:00:00.0000000' at� '23:59:59.9999999'
	-DATETIMEOFFSET => permite armazenar informa��es de data e hora, incluindo o fuso hor�rio
*/

--Chave Prim�ria e Chave Estrangeira
/*
* CHAVE PRIM�RIA =>
	-coluna (ou grupo de colunas) usada para identificar unicamente uma linha em uma tabela
	-� poss�vel cri�-las atrav�s de restri��es (constraints) =>
		-restri��es s�o regras definidas ao criar uma coluna
		-ao definir a restri��o, cria-se um �ndice �nico para a coluna ou grupo de colunas

* CHAVE ESTRANGEIRA =>
	-coluna (ou grupo de colunas) em uma tabela que identificam unicamente uma linha em outra tabela
	-� definida em uma tabela em que ela � apenas uma refer�ncia e n�o cont�m todos os dados ali
	-� a chave prim�ria de outra tabela
	-a tabela que cont�m a chave estrangeira � chamada de tabela referenciadoura ou tabela filha
	-a tabela que cont�m a chave estrangeira referenciada � chamada de tabela referenciada ou tabela pai
	-uma tabela pode ter mais de uma chave estrangeira dependendo do seu relacionamento com as outras tabelas
	-no SQL Server, uma chave estrangeira � definida atrav�s de um 'Foreign Key Constraint' (restri��o de chave estrangeira)
	-uma restri��o de chave estrangeira indica que os valores em uma coluna (ou grupo de colunas) na tabela filho correspondem aos valores na tabela pai
	-� poss�vel assumir que uma chave estrangeira mant�m a integridade referencial
*/

--CREATE TABLE
CREATE TABLE nomeTabela(
	coluna1 tipo restricaoDaColuna (se houver),
	coluna2 tipo restricaoDaColuna,
	coluna3 tipo restricaoDaColuna,
	...
);

	--Principais restri��es que podem ser aplicadas =>
	/*
	* NOT NULL => n�o permite nulos
	* UNIQUE => for�a que todos os valores em uma coluna sejam diferentes
	* PRIMARY KEY => jun��o de NOT NULL e UNIQUE; identifica unicamente uma linha em uma tabela
	* FOREIGN KEY => identifica unicamente uma linha em outra tabela
	* CHECK => for�a uma condi��o espec�fica em uma coluna
	* DEFAULT => for�a um valor padr�o quando nenhum valor � passado
	*/

CREATE TABLE Canal(
	CanalId INT PRIMARY KEY,
	NOME VARCHAR(150) NOT NULL,
	ContagemInscritos INT DEFAULT 0,
	DataCriacao DATETIME NOT NULL
);

SELECT * FROM Canal;

CREATE TABLE Video(
	VideoId INT PRIMARY KEY,
	Nome VARCHAR(150) NOT NULL,
	Visualizacoes INT DEFAULT 0,
	LIKES INT DEFAULT 0,
	Dislikes INT DEFAULT 0,
	Duracao INT NOT NULL,
	CanalId INT FOREIGN KEY REFERENCES Canal(CanalId)
);

SELECT * FROM Video;

--INSERT INTO
INSERT INTO tabela(coluna1, coluna2, ...) VALUES (valor1, valor2, ...);

INSERT INTO tabelaA (coluna1) SELECT coluna2 FROM tabelaB;

INSERT INTO Canal (CanalId, NOME, DataCriacao) VALUES (1, 'MeuCanal', 14/08/2023);

UPDATE Canal SET DataCriacao = CURRENT_TIMESTAMP;
