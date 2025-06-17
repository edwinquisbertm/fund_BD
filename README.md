necesito que me ayudes a reorganizar, mejorar y reconstruir mis apuntes realizados en un archivo readme.md utilizando las ventajas de este tipo de archivo, necesito que crees 2 ejemplos de cada comando de sql pero que las tablas resultantes no muestren mas de 5 datos, pueden inventarte las tablas con los datos necesarios que se usen en todo el documento. tambien necesito que expliques cada comando el para que sirven y que cuidados se debe tener tambien encontraras lugares donde las descripciones de los comandos sql se encuentran en ingles quiero que lo traduscas al español (no traduscas los comandos).

trata de utilizar los siguientes apuntes para crear un guia sobre sql y tambien agrega todo lo que veas faltante, esta es la información del documento a mejorar:

" # Fundamentos de Bases de Datos
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

Tipos de datos numéricos
Data type	Description

Tipos de datos de fecha y hora
Data type	Description

Funciones de cadena de MySQL
Function	Description

Funciones numéricas de MySQL
Function	Description

Funciones de fecha de MySQL
Function	Description

Funciones avanzadas de MySQL
Function	Description
"

necesito que toda la guia, incluido los ejemplos comandos esten en formato markdown para copiarlo y pegarlo directamente.
