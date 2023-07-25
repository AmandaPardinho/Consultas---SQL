SELECT * FROM SalesLT.Product;

SELECT Name, StandardCost, ListPrice FROM SalesLT.Product;

SELECT Name AS ProductName,
ListPrice - StandardCost AS Markup
FROM SalesLT.Product;

SELECT ProductNumber, 
	Color, Size, Color + 
	', ' + Size AS ProductDetails
FROM SalesLT.Product;

SELECT ProductID + ': ' + Name AS ProductName FROM SalesLT.Product;

SELECT CAST(ProductID AS varchar(5)) + ': ' + Name AS ProductName
FROM SalesLT.Product; 

SELECT CONVERT(varchar(5), ProductID) + ': ' + Name AS ProductName
FROM SalesLT.Product; 

SELECT SellStartDate, 
	CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,   
	CONVERT(nvarchar(30), SellStartDate, 126) AS ISO8601FormatDate
FROM SalesLT.Product; 

SELECT Name, 
	CAST(Size AS Integer) AS NumericSize
FROM SalesLT.Product; 

SELECT Name, 
	TRY_CAST(Size AS Integer) AS NumericSize
FROM SalesLT.Product; 

SELECT Name, 
	ISNULL(TRY_CAST(Size AS Integer),0) AS NumericSize
FROM SalesLT.Product;

SELECT ProductNumber, ISNULL(Color, '') + ', ' + 
	ISNULL(Size, '') AS ProductName,    
	CASE        
		WHEN SellEndDate IS NULL THEN 'Currently for sale'        
		ELSE 'No longer available'    
	END AS SalesStatus
FROM SalesLT.Product;

SELECT Name,    
	CASE Size
		WHEN 'S' THEN 'Small'        
		WHEN 'M' THEN 'Medium'        
		WHEN 'L' THEN 'Large'        
		WHEN 'XL' THEN 'Extra-Large'        
		ELSE ISNULL(Size, 'n/a')    
	END AS ProductSizeFROM SalesLT.Product;