# Fundamentos de Bases de Datos
## Introducción

A continuación se presentan comandos y conceptos básicos para la gestión de bases de datos relacionales en SQL.

### Comandos SQL básicos

```sql
-- Crear una nueva base de datos llamada 'name'
CREATE DATABASE name;
```

```sql
-- Seleccionar la base de datos 'name' para usarla
USE name;
```

```sql
-- Mostrar el nombre de la base de datos actualmente seleccionada
SELECT DATABASE();
```

```sql
-- Listar todas las bases de datos disponibles
SHOW DATABASES;
```

```sql
-- Mostrar todas las tablas de la base de datos seleccionada
SHOW TABLES;
```

```sql
-- Crear una nueva tabla llamada 'client' con los atributos especificados
CREATE TABLE client (
    -- atributos
);
```

```sql
-- Mostrar la estructura (columnas, tipos de datos, etc.) de la tabla 'client'
DESCRIBE client;
```

```sql
-- Mostrar el comando SQL necesario para crear la base de datos 'client'
SHOW CREATE DATABASE client;
```

```sql
-- Eliminar la tabla 'client' de la base de datos
DROP TABLE client;
```

```sql
-- Seleccionar y mostrar todos los registros de la tabla 'clients'
SELECT * FROM clients;
```

```sql
-- Mostrar la estructura de la tabla 'clients' (forma abreviada)
DESC clients;
```

```sql
-- Insertar un registro en la tabla 'name'
INSERT INTO name VALUES ('Hola Juarez');
```

### Tipos de datos comunes en SQL

- **INT**: Números enteros
- **DECIMAL(p,s)**: Números decimales con precisión y escala
- **FLOAT, DOUBLE**: Números de punto flotante
- **CHAR(n)**: Cadena de texto de longitud fija
- **VARCHAR(n)**: Cadena de texto de longitud variable
- **TEXT**: Texto largo
- **DATE**: Fecha (`AAAA-MM-DD`)
- **TIME**: Hora (`HH:MM:SS`)
- **DATETIME**: Fecha y hora
- **TIMESTAMP**: Marca de tiempo
- **BOOLEAN**: Verdadero o falso (puede ser `TINYINT(1)` en MySQL)

---

## Apuntes 1

La gestión eficiente de bases de datos relacionales implica dominar dos conceptos fundamentales: **normalización** y **relaciones**. Ambos mejoran el rendimiento, la integridad y la facilidad para mantener información precisa, organizada y sin duplicidades.

### ¿Qué es la normalización y por qué es importante?

La normalización consiste en guardar un dato una sola vez, evitando redundancias y duplicidades. Esto facilita mantener la información actualizada sin esfuerzos adicionales.

**Ejemplo:**  
En una tienda, registrar productos o clientes en múltiples lugares es propenso a errores y difícil de actualizar.  
- Registrar al cliente (Juan) una única vez.
- Anotar productos como Coca-Cola solo una vez, aunque se adquieran múltiples veces.
- Guardar compras en tablas relacionadas por identificación y cantidad.

### ¿Qué tipos de relaciones existen en bases de datos relacionales?

Las relaciones en bases de datos permiten vincular entidades eficientemente.

#### Relaciones uno a uno

Cada registro de una entidad corresponde exactamente a un registro en otra entidad.

**Ejemplos:**
- Usuarios y sus pasaportes: cada usuario puede tener exactamente un pasaporte válido.
- Tarjetas de puntos asignadas a un cliente.

**Soluciones prácticas:**
- Crear una tabla separada.
- Agregar atributos en tablas existentes.
- Incorporar columnas JSON.

#### Relaciones uno a muchos

Un registro puede vincularse con múltiples registros en otra tabla.

**Ejemplos:**
- Un cliente realiza múltiples compras (bills).
- Un producto aparece en múltiples líneas de compra (bill items).

Esto permite actualizar información, como nombres o precios, desde un único lugar y que se propague automáticamente a registros relacionados.

#### Relaciones muchos a muchos

Registros múltiples de dos tablas están vinculados entre sí, típicamente mediante una tabla intermedia.

**Ejemplos:**
- Estudiantes y clases: un estudiante puede asistir a varias clases, y una clase puede tener muchos estudiantes.
- Proyectos y desarrolladores: un proyecto involucra a varios desarrolladores, y un desarrollador participa en diversos proyectos.

**Resumen:**  
Reconocer cuándo implementar relaciones muchos a muchos evita estructuras ineficientes en bases de datos al centralizar conexiones complejas en una tabla intermedia.

### Recursos 1
https://dbdiagram.io/

## Apuntes 2
select * from clients;

update clients set client_id = 2 where client_id = 1;

DELETE FROM bill_products WHERE bill_product_id = 1;

SELECT column1, column2, ...
FROM table_name;

SELECT DISTINCT column1, column2, ...
FROM table_name;

SELECT COUNT(DISTINCT Country) FROM Customers;

SELECT column1, column2, ...
FROM table_name
WHERE condition;

Operadores en la cláusula WHERE
Los siguientes operadores se pueden utilizar en la WHEREcláusula:

Operator	Description	Example
=	Equal	
>	Greater than	
<	Less than	
>=	Greater than or equal	
<=	Less than or equal	
<>	Not equal. Note: In some versions of SQL this operator may be written as !=	
BETWEEN	Between a certain range	
LIKE	Search for a pattern	
IN	To specify multiple possible values for a column

SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');

SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');

SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

SELECT * FROM Customers
ORDER BY Country;

SELECT * FROM Customers
ORDER BY Country DESC;

SELECT * FROM Customers
ORDER BY Country, CustomerName;

SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

INSERT INTO table_name
VALUES (value1, value2, value3, ...);

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

SELECT column_names
FROM table_name
WHERE column_name IS NULL;

SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

UPDATE Customers
SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
WHERE CustomerID = 1;

DELETE FROM table_name WHERE condition;

DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

DELETE FROM table_name;

SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;

SELECT * FROM Customers
LIMIT 3;

SELECT * FROM Customers
LIMIT 3 OFFSET 3;

SELECT * FROM Customers
WHERE Country='Germany'
LIMIT 3;

SELECT * FROM Customers
ORDER BY Country
LIMIT 3;

SELECT MIN(column_name)
FROM table_name
WHERE condition;

SELECT MAX(column_name)
FROM table_name
WHERE condition;

SELECT MIN(Price) AS SmallestPrice
FROM Products;

SELECT MAX(Price) AS LargestPrice
FROM Products;

SELECT COUNT(column_name)
FROM table_name
WHERE condition;

SELECT AVG(column_name)
FROM table_name
WHERE condition;

SELECT SUM(column_name)
FROM table_name
WHERE condition;

SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

A continuación se muestran algunos ejemplos que muestran diferentes LIKEoperadores con comodines '%' y '_':
LIKE Operator	Description
WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length
WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"

Caracteres comodín en MySQL
Symbol	Description	Example
%	Represents zero or more characters	bl% finds bl, black, blue, and blob
_	Represents a single character	h_t finds hot, hat, and hit

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);

SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);

SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT * FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

SELECT column_name AS alias_name
FROM table_name;

SELECT column_name(s)
FROM table_name AS alias_name;

SELECT CustomerName AS Customer, ContactName AS "Contact Person"
FROM Customers;

SELECT CustomerName, CONCAT_WS(', ', Address, PostalCode, City, Country) AS Address
FROM Customers;

SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

Tipos de uniones admitidos en MySQL
INNER JOIN: Devuelve registros que tienen valores coincidentes en ambas tablas
LEFT JOIN: Devuelve todos los registros de la tabla izquierda y los registros coincidentes de la tabla derecha
RIGHT JOIN: Devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda
CROSS JOIN:Devuelve todos los registros de ambas tablas
![image](https://github.com/user-attachments/assets/36eec2f9-7a2d-4315-b353-79a56507bdef)
![image](https://github.com/user-attachments/assets/c7541733-67b8-4c54-a6dc-529ab5ae0b6a) 
![image](https://github.com/user-attachments/assets/15556f55-e400-46df-ac94-259d6a12ffae)
![image](https://github.com/user-attachments/assets/10eceb5e-a00e-48a0-9aaf-c8976a60edf9)

La INNER JOINpalabra clave selecciona registros que tienen valores coincidentes en ambas tablas.
![image](https://github.com/user-attachments/assets/d7f3e938-603e-4d6c-860d-4b2937493028)

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

La LEFT JOINpalabra clave devuelve todos los registros de la tabla izquierda (tabla1) y los registros coincidentes (si los hay) de la tabla derecha (tabla2).

![image](https://github.com/user-attachments/assets/602d191c-af14-4ebb-97d9-69f72a5e6975)

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

La RIGHT JOINpalabra clave devuelve todos los registros de la tabla derecha (tabla2) y los registros coincidentes (si los hay) de la tabla izquierda (tabla1).

![image](https://github.com/user-attachments/assets/b4b37a26-e8ba-4670-83e0-7c619d6f1c62)

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

La CROSS JOINpalabra clave devuelve todos los registros de ambas tablas (tabla1 y tabla2).

![image](https://github.com/user-attachments/assets/dfe324c4-5cfe-45a2-bb57-698d2faa04c2)

SELECT column_name(s)
FROM table1
CROSS JOIN table2;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders
WHERE Customers.CustomerID=Orders.CustomerID;


SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

El UNIONoperador se utiliza para combinar el conjunto de resultados de dos o más SELECT declaraciones.

Cada SELECTdeclaración dentro UNIONdebe tener el mismo número de columnas
Las columnas también deben tener tipos de datos similares
Las columnas de cada SELECTdeclaración también deben estar en el mismo orden.

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;

SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22);

SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition);

SELECT ALL column_name(s)
FROM table_name
WHERE condition;

SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
  (SELECT column_name
  FROM table_name
  WHERE condition);

INSERT INTO table2
SELECT * FROM table1
WHERE condition;

INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder)
FROM Products;

SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
FROM Products;

SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
FROM Products;

Comentarios de una sola línea
Los comentarios de una sola línea comienzan con --
-- Select all:
SELECT * FROM Customers;
SELECT * FROM Customers -- WHERE City='Berlin';
-- SELECT * FROM Customers;
SELECT * FROM Products;

Comentarios de varias líneas
Los comentarios de varias líneas comienzan con /*y terminan con */
/*Select all the columns
of all the records

SELECT CustomerName, /*City,*/ Country FROM Customers;

Operadores aritméticos de MySQL
Operator	Description	Example
+	Add	
-	Subtract	
*	Multiply	
/	Divide	
%	Modulo	
Operadores bit a bit de MySQL
Operator	Description
&	Bitwise AND
|	Bitwise OR
^	Bitwise exclusive OR
Operadores de comparación de MySQL
Operator	Description	Example
=	Equal to	
>	Greater than	
<	Less than	
>=	Greater than or equal to	
<=	Less than or equal to	
<>	Not equal to	
Operadores compuestos de MySQL
Operator	Description
+=	Add equals
-=	Subtract equals
*=	Multiply equals
/=	Divide equals
%=	Modulo equals
&=	Bitwise AND equals
^-=	Bitwise exclusive equals
|*=	Bitwise OR equals
Operadores lógicos de MySQL
Operator	Description	Example
ALL	TRUE if all of the subquery values meet the condition	
AND	TRUE if all the conditions separated by AND is TRUE	
ANY	TRUE if any of the subquery values meet the condition	
BETWEEN	TRUE if the operand is within the range of comparisons	
EXISTS	TRUE if the subquery returns one or more records	
IN	TRUE if the operand is equal to one of a list of expressions	
LIKE	TRUE if the operand matches a pattern	
NOT	Displays a record if the condition(s) is NOT TRUE	
OR	TRUE if any of the conditions separated by OR is TRUE	
SOME	TRUE if any of the subquery values meet the condition	

CREATE DATABASE testDB;

DROP DATABASE databasename;

DROP DATABASE testDB;

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;

CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;

DROP TABLE table_name;

TRUNCATE TABLE table_name;

ALTER TABLE table_name
ADD column_name datatype;

ALTER TABLE Customers
ADD Email varchar(255);

ALTER TABLE table_name
DROP COLUMN column_name;

ALTER TABLE Customers
DROP COLUMN Email;

ALTER TABLE table_name
MODIFY COLUMN column_name datatype;

ALTER TABLE Persons
ADD DateOfBirth date;

ALTER TABLE Persons
MODIFY COLUMN DateOfBirth year;

ALTER TABLE Persons
DROP COLUMN DateOfBirth;

CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);

Restricciones de MySQL
Las restricciones SQL se utilizan para especificar reglas para los datos de una tabla.
Las restricciones se utilizan para limitar el tipo de datos que se pueden incluir en una tabla. Esto garantiza la precisión y fiabilidad de los datos de la tabla. Si se produce alguna violación entre la restricción y la acción de datos, esta se cancela.
Las restricciones pueden ser a nivel de columna o de tabla. Las restricciones a nivel de columna se aplican a una columna, mientras que las restricciones a nivel de tabla se aplican a toda la tabla.
Las siguientes restricciones se utilizan comúnmente en SQL:
NOT NULL- Asegura que una columna no pueda tener un valor NULL
UNIQUE- Asegura que todos los valores de una columna sean diferentes
PRIMARY KEY- Una combinación de a NOT NULLy UNIQUE. Identifica de forma única cada fila de una tabla.
FOREIGN KEY - Evita acciones que destruirían vínculos entre tablas
CHECK- Asegura que los valores de una columna satisfacen una condición específica
DEFAULT- Establece un valor predeterminado para una columna si no se especifica ningún valor
CREATE INDEX- Se utiliza para crear y recuperar datos de la base de datos muy rápidamente.

Restricción NOT NULL de MySQL
De forma predeterminada, una columna puede contener valores NULL.
La NOT NULLrestricción obliga a una columna a NO aceptar valores NULOS.
Esto obliga a que un campo siempre contenga un valor, lo que significa que no puede insertar un nuevo registro ni actualizar un registro sin agregar un valor a este campo.

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

ALTER TABLE Persons
MODIFY Age int NOT NULL;

Restricción UNIQUE de MySQL
La UNIQUErestricción asegura que todos los valores de una columna sean diferentes.
Tanto las restricciones UNIQUEcomo PRIMARY KEYproporcionan una garantía de unicidad para una columna o un conjunto de columnas.
Una PRIMARY KEYrestricción automáticamente tiene una UNIQUErestricción.
Sin embargo, puede tener muchas UNIQUErestricciones por tabla, pero solo una PRIMARY KEYrestricción por tabla.

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

ALTER TABLE Persons
ADD UNIQUE (ID);

ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);

ALTER TABLE Persons
DROP INDEX UC_Person;

Restricción de CLAVE PRINCIPAL de MySQL
La PRIMARY KEYrestricción identifica de forma única cada registro de una tabla.
Las claves primarias deben contener valores ÚNICOS y no pueden contener valores NULOS.
Una tabla puede tener solo UNA clave principal; y en la tabla, esta clave principal puede constar de una o varias columnas (campos).

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);

ALTER TABLE Persons
ADD PRIMARY KEY (ID);

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);

ALTER TABLE Persons
DROP PRIMARY KEY;

Restricción de clave externa de MySQL
La FOREIGN KEYrestricción se utiliza para evitar acciones que podrían destruir vínculos entre tablas.
A FOREIGN KEYes un campo (o colección de campos) en una tabla, que hace referencia a PRIMARY KEYotra tabla.
La tabla con la clave externa se denomina tabla secundaria y la tabla con la clave principal se denomina tabla referenciada o tabla principal.
Observa las dos tablas siguientes:

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

Restricción CHECK de MySQL
La CHECKrestricción se utiliza para limitar el rango de valores que se puede colocar en una columna.
Si define una CHECKrestricción en una columna, solo se permitirán ciertos valores para esa columna.
Si define una CHECKrestricción en una tabla, puede limitar los valores en ciertas columnas en función de los valores de otras columnas en la fila.

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

ALTER TABLE Persons
ADD CHECK (Age>=18);

ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');

ALTER TABLE Persons
DROP CHECK CHK_PersonAge;

Restricción DEFAULT de MySQL
La DEFAULTrestricción se utiliza para establecer un valor predeterminado para una columna.
El valor predeterminado se agregará a todos los registros nuevos, si no se especifica ningún otro valor.

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT CURRENT_DATE()
);

ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';

ALTER TABLE Persons
ALTER City DROP DEFAULT;

Sentencia CREATE INDEX de MySQL
La CREATE INDEXdeclaración se utiliza para crear índices en tablas.
Los índices se utilizan para recuperar datos de la base de datos con mayor rapidez. Los usuarios no pueden verlos; simplemente se utilizan para agilizar las búsquedas y consultas.

CREATE INDEX index_name
ON table_name (column1, column2, ...);

CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);

CREATE INDEX idx_lastname
ON Persons (LastName);

ALTER TABLE table_name
DROP INDEX index_name;

Palabra clave AUTO_INCREMENT de MySQL
MySQL utiliza la AUTO_INCREMENTpalabra clave para realizar una función de incremento automático.
De forma predeterminada, el valor inicial AUTO_INCREMENTes 1 y se incrementará en 1 para cada nuevo registro.
La siguiente declaración SQL define la columna "Personid" como un campo de clave principal de incremento automático en la tabla "Persons":

CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
);

ALTER TABLE Persons AUTO_INCREMENT=100;

INSERT INTO Persons (FirstName,LastName)
VALUES ('Lars','Monsen');

Tipos de datos de fecha de MySQL
MySQL viene con los siguientes tipos de datos para almacenar una fecha o un valor de fecha/hora en la base de datos:
DATE- formato AAAA-MM-DD
DATETIME- formato: AAAA-MM-DD HH:MI:SS
TIMESTAMP- formato: AAAA-MM-DD HH:MI:SS
YEAR- formato AAAA o AA
Nota: ¡Los tipos de datos de fecha se establecen para una columna cuando crea una nueva tabla en su base de datos!

SELECT * FROM Orders WHERE OrderDate='2008-11-11'

SELECT * FROM Orders WHERE OrderDate='2008-11-11'

Declaración CREATE VIEW de MySQL
En SQL, una vista es una tabla virtual basada en el conjunto de resultados de una declaración SQL.
Una vista contiene filas y columnas, al igual que una tabla real. Los campos de una vista pertenecen a una o más tablas reales de la base de datos.
Puede agregar declaraciones y funciones SQL a una vista y presentar los datos como si provinieran de una sola tabla.
Se crea una vista con la CREATE VIEWdeclaración.

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';

SELECT * FROM [Brazil Customers];

CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

SELECT * FROM [Products Above Average Price];

CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';

DROP VIEW view_name;

DROP VIEW [Brazil Customers];

Tipos de datos de MySQL (versión 8.0)
Cada columna de una tabla de base de datos debe tener un nombre y un tipo de dato.

Al crear una tabla, un desarrollador de SQL debe decidir qué tipo de datos se almacenarán en cada columna. El tipo de dato sirve de guía para que SQL comprenda qué tipo de datos se espera en cada columna y también identifica cómo interactuará SQL con los datos almacenados.

En MySQL hay tres tipos de datos principales: cadena, numéricos y fecha y hora.

Tipos de datos de cadena
Data type	Description
CHAR(size)	A FIXED length string (can contain letters, numbers, and special characters). The size parameter specifies the column length in characters - can be from 0 to 255. Default is 1
VARCHAR(size)	A VARIABLE length string (can contain letters, numbers, and special characters). The size parameter specifies the maximum column length in characters - can be from 0 to 65535
BINARY(size)	Equal to CHAR(), but stores binary byte strings. The size parameter specifies the column length in bytes. Default is 1
VARBINARY(size)	Equal to VARCHAR(), but stores binary byte strings. The size parameter specifies the maximum column length in bytes.
TINYBLOB	For BLOBs (Binary Large OBjects). Max length: 255 bytes
TINYTEXT	Holds a string with a maximum length of 255 characters
TEXT(size)	Holds a string with a maximum length of 65,535 bytes
BLOB(size)	For BLOBs (Binary Large OBjects). Holds up to 65,535 bytes of data
MEDIUMTEXT	Holds a string with a maximum length of 16,777,215 characters
MEDIUMBLOB	For BLOBs (Binary Large OBjects). Holds up to 16,777,215 bytes of data
LONGTEXT	Holds a string with a maximum length of 4,294,967,295 characters
LONGBLOB	For BLOBs (Binary Large OBjects). Holds up to 4,294,967,295 bytes of data
ENUM(val1, val2, val3, ...)	A string object that can have only one value, chosen from a list of possible values. You can list up to 65535 values in an ENUM list. If a value is inserted that is not in the list, a blank value will be inserted. The values are sorted in the order you enter them
SET(val1, val2, val3, ...)	A string object that can have 0 or more values, chosen from a list of possible values. You can list up to 64 values in a SET list
Tipos de datos numéricos
Data type	Description
BIT(size)	A bit-value type. The number of bits per value is specified in size. The size parameter can hold a value from 1 to 64. The default value for size is 1.
TINYINT(size)	A very small integer. Signed range is from -128 to 127. Unsigned range is from 0 to 255. The size parameter specifies the maximum display width (which is 255)
BOOL	Zero is considered as false, nonzero values are considered as true.
BOOLEAN	Equal to BOOL
SMALLINT(size)	A small integer. Signed range is from -32768 to 32767. Unsigned range is from 0 to 65535. The size parameter specifies the maximum display width (which is 255)
MEDIUMINT(size)	A medium integer. Signed range is from -8388608 to 8388607. Unsigned range is from 0 to 16777215. The size parameter specifies the maximum display width (which is 255)
INT(size)	A medium integer. Signed range is from -2147483648 to 2147483647. Unsigned range is from 0 to 4294967295. The size parameter specifies the maximum display width (which is 255)
INTEGER(size)	Equal to INT(size)
BIGINT(size)	A large integer. Signed range is from -9223372036854775808 to 9223372036854775807. Unsigned range is from 0 to 18446744073709551615. The size parameter specifies the maximum display width (which is 255)
FLOAT(size, d)	A floating point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. This syntax is deprecated in MySQL 8.0.17, and it will be removed in future MySQL versions
FLOAT(p)	A floating point number. MySQL uses the p value to determine whether to use FLOAT or DOUBLE for the resulting data type. If p is from 0 to 24, the data type becomes FLOAT(). If p is from 25 to 53, the data type becomes DOUBLE()
DOUBLE(size, d)	A normal-size floating point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter
DOUBLE PRECISION(size, d)	 
DECIMAL(size, d)	An exact fixed-point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. The maximum number for size is 65. The maximum number for d is 30. The default value for size is 10. The default value for d is 0.
DEC(size, d)	Equal to DECIMAL(size,d)
Nota: Todos los tipos de datos numéricos pueden tener una opción adicional: UNSIGNED o ZEROFILL. Si agrega la opción UNSIGNED, MySQL no permite valores negativos en la columna. Si agrega la opción ZEROFILL, MySQL también agrega automáticamente el atributo UNSIGNED a la columna.

Tipos de datos de fecha y hora
Data type	Description
DATE	A date. Format: YYYY-MM-DD. The supported range is from '1000-01-01' to '9999-12-31'
DATETIME(fsp)	A date and time combination. Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'. Adding DEFAULT and ON UPDATE in the column definition to get automatic initialization and updating to the current date and time
TIMESTAMP(fsp)	A timestamp. TIMESTAMP values are stored as the number of seconds since the Unix epoch ('1970-01-01 00:00:00' UTC). Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC. Automatic initialization and updating to the current date and time can be specified using DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP in the column definition
TIME(fsp)	A time. Format: hh:mm:ss. The supported range is from '-838:59:59' to '838:59:59'
YEAR	A year in four-digit format. Values allowed in four-digit format: 1901 to 2155, and 0000.
MySQL 8.0 does not support year in two-digit format.

Funciones de cadena de MySQL
Function	Description
ASCII	Returns the ASCII value for the specific character
CHAR_LENGTH	Returns the length of a string (in characters)
CHARACTER_LENGTH	Returns the length of a string (in characters)
CONCAT	Adds two or more expressions together
CONCAT_WS	Adds two or more expressions together with a separator
FIELD	Returns the index position of a value in a list of values
FIND_IN_SET	Returns the position of a string within a list of strings
FORMAT	Formats a number to a format like "#,###,###.##", rounded to a specified number of decimal places
INSERT	Inserts a string within a string at the specified position and for a certain number of characters
INSTR	Returns the position of the first occurrence of a string in another string
LCASE	Converts a string to lower-case
LEFT	Extracts a number of characters from a string (starting from left)
LENGTH	Returns the length of a string (in bytes)
LOCATE	Returns the position of the first occurrence of a substring in a string
LOWER	Converts a string to lower-case
LPAD	Left-pads a string with another string, to a certain length
LTRIM	Removes leading spaces from a string
MID	Extracts a substring from a string (starting at any position)
POSITION	Returns the position of the first occurrence of a substring in a string
REPEAT	Repeats a string as many times as specified
REPLACE	Replaces all occurrences of a substring within a string, with a new substring
REVERSE	Reverses a string and returns the result
RIGHT	Extracts a number of characters from a string (starting from right)
RPAD	Right-pads a string with another string, to a certain length
RTRIM	Removes trailing spaces from a string
SPACE	Returns a string of the specified number of space characters
STRCMP	Compares two strings
SUBSTR	Extracts a substring from a string (starting at any position)
SUBSTRING	Extracts a substring from a string (starting at any position)
SUBSTRING_INDEX	Returns a substring of a string before a specified number of delimiter occurs
TRIM	Removes leading and trailing spaces from a string
UCASE	Converts a string to upper-case
UPPER	Converts a string to upper-case
Funciones numéricas de MySQL
Function	Description
ABS	Returns the absolute value of a number
ACOS	Returns the arc cosine of a number
ASIN	Returns the arc sine of a number
ATAN	Returns the arc tangent of one or two numbers
ATAN2	Returns the arc tangent of two numbers
AVG	Returns the average value of an expression
CEIL	Returns the smallest integer value that is >= to a number
CEILING	Returns the smallest integer value that is >= to a number
COS	Returns the cosine of a number
COT	Returns the cotangent of a number
COUNT	Returns the number of records returned by a select query
DEGREES	Converts a value in radians to degrees
DIV	Used for integer division
EXP	Returns e raised to the power of a specified number
FLOOR	Returns the largest integer value that is <= to a number
GREATEST	Returns the greatest value of the list of arguments
LEAST	Returns the smallest value of the list of arguments
LN	Returns the natural logarithm of a number
LOG	Returns the natural logarithm of a number, or the logarithm of a number to a specified base
LOG10	Returns the natural logarithm of a number to base 10
LOG2	Returns the natural logarithm of a number to base 2
MAX	Returns the maximum value in a set of values
MIN	Returns the minimum value in a set of values
MOD	Returns the remainder of a number divided by another number
PI	Returns the value of PI
POW	Returns the value of a number raised to the power of another number
POWER	Returns the value of a number raised to the power of another number
RADIANS	Converts a degree value into radians
RAND	Returns a random number
ROUND	Rounds a number to a specified number of decimal places
SIGN	Returns the sign of a number
SIN	Returns the sine of a number
SQRT	Returns the square root of a number
SUM	Calculates the sum of a set of values
TAN	Returns the tangent of a number
TRUNCATE	Truncates a number to the specified number of decimal places
Funciones de fecha de MySQL
Function	Description
ADDDATE	Adds a time/date interval to a date and then returns the date
ADDTIME	Adds a time interval to a time/datetime and then returns the time/datetime
CURDATE	Returns the current date
CURRENT_DATE	Returns the current date
CURRENT_TIME	Returns the current time
CURRENT_TIMESTAMP	Returns the current date and time
CURTIME	Returns the current time
DATE	Extracts the date part from a datetime expression
DATEDIFF	Returns the number of days between two date values
DATE_ADD	Adds a time/date interval to a date and then returns the date
DATE_FORMAT	Formats a date
DATE_SUB	Subtracts a time/date interval from a date and then returns the date
DAY	Returns the day of the month for a given date
DAYNAME	Returns the weekday name for a given date
DAYOFMONTH	Returns the day of the month for a given date
DAYOFWEEK	Returns the weekday index for a given date
DAYOFYEAR	Returns the day of the year for a given date
EXTRACT	Extracts a part from a given date
FROM_DAYS	Returns a date from a numeric datevalue
HOUR	Returns the hour part for a given date
LAST_DAY	Extracts the last day of the month for a given date
LOCALTIME	Returns the current date and time
LOCALTIMESTAMP	Returns the current date and time
MAKEDATE	Creates and returns a date based on a year and a number of days value
MAKETIME	Creates and returns a time based on an hour, minute, and second value
MICROSECOND	Returns the microsecond part of a time/datetime
MINUTE	Returns the minute part of a time/datetime
MONTH	Returns the month part for a given date
MONTHNAME	Returns the name of the month for a given date
NOW	Returns the current date and time
PERIOD_ADD	Adds a specified number of months to a period
PERIOD_DIFF	Returns the difference between two periods
QUARTER	Returns the quarter of the year for a given date value
SECOND	Returns the seconds part of a time/datetime
SEC_TO_TIME	Returns a time value based on the specified seconds
STR_TO_DATE	Returns a date based on a string and a format
SUBDATE	Subtracts a time/date interval from a date and then returns the date
SUBTIME	Subtracts a time interval from a datetime and then returns the time/datetime
SYSDATE	Returns the current date and time
TIME	Extracts the time part from a given time/datetime
TIME_FORMAT	Formats a time by a specified format
TIME_TO_SEC	Converts a time value into seconds
TIMEDIFF	Returns the difference between two time/datetime expressions
TIMESTAMP	Returns a datetime value based on a date or datetime value
TO_DAYS	Returns the number of days between a date and date "0000-00-00"
WEEK	Returns the week number for a given date
WEEKDAY	Returns the weekday number for a given date
WEEKOFYEAR	Returns the week number for a given date
YEAR	Returns the year part for a given date
YEARWEEK	Returns the year and week number for a given date
Funciones avanzadas de MySQL
Function	Description
BIN	Returns a binary representation of a number
BINARY	Converts a value to a binary string
CASE	Goes through conditions and return a value when the first condition is met
CAST	Converts a value (of any type) into a specified datatype
COALESCE	Returns the first non-null value in a list
CONNECTION_ID	Returns the unique connection ID for the current connection
CONV	Converts a number from one numeric base system to another
CONVERT	Converts a value into the specified datatype or character set
CURRENT_USER	Returns the user name and host name for the MySQL account that the server used to authenticate the current client
DATABASE	Returns the name of the current database
IF	Returns a value if a condition is TRUE, or another value if a condition is FALSE
IFNULL	Return a specified value if the expression is NULL, otherwise return the expression
ISNULL	Returns 1 or 0 depending on whether an expression is NULL
LAST_INSERT_ID	Returns the AUTO_INCREMENT id of the last row that has been inserted or updated in a table
NULLIF	Compares two expressions and returns NULL if they are equal. Otherwise, the first expression is returned
SESSION_USER	Returns the current MySQL user name and host name
SYSTEM_USER	Returns the current MySQL user name and host name
USER	Returns the current MySQL user name and host name
VERSION	Returns the current version of the MySQL database

