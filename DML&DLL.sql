

-----------------DDL-----------------------------------
ALTER TABLE Product ADD Rating INT DEFAULT 0;

ALTER TABLE Product ADD DEFAULT 'New' FOR Category;

ALTER TABLE Product DROP COLUMN Rating;

DROP TABLE IF EXISTS Users;

DROP DATABASE IF EXISTS SocialMediaPlatform;


-----------------DML------------------------------
UPDATE Orders
SET OrderDate = GETDATE() 
WHERE OrderID > 0;

DELETE FROM Product 
WHERE Name IS NOT NULL AND Name <> 'Null';