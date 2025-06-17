# Guía Completa de SQL: De Apuntes a Experto

## 1. Introducción a SQL y Estructura del Documento

SQL (Structured Query Language) es el lenguaje estándar para la gestión y manipulación de bases de datos relacionales. Permite realizar operaciones como consulta, inserción, actualización y eliminación de datos, así como definir la estructura de la base de datos.

La estandarización de SQL facilita la transferencia de conocimientos entre diferentes sistemas de gestión de bases de datos (DBMS) como MySQL, PostgreSQL, Oracle y SQL Server. Su naturaleza declarativa permite especificar qué datos se necesitan sin dictar cómo recuperarlos, delegando la optimización al motor de la base de datos.

Esta guía está estructurada en formato Markdown para facilitar la lectura, navegación y replicabilidad de los ejemplos, usando encabezados, listas y bloques de código para mayor claridad.

---

## 2. Fundamentos de SQL: Tipos de Datos

### Tipos Numéricos

| Tipo         | Descripción                       | Rango/Notas                                  |
|--------------|-----------------------------------|----------------------------------------------|
| TINYINT      | Entero muy pequeño                | -128 a 127 (signed), 0 a 255 (unsigned)      |
| SMALLINT     | Entero pequeño                    | -32,768 a 32,767 (signed), 0 a 65,535 (unsigned) |
| MEDIUMINT    | Entero mediano                    | -8,388,608 a 8,388,607 (signed)              |
| INT/INTEGER  | Entero general                    | -2,147,483,648 a 2,147,483,647 (signed)      |
| BIGINT       | Entero muy grande                 | -2^63 a 2^63-1 (signed)                      |
| FLOAT(m,d)   | Punto flotante simple             | Precisión de 4 bytes                         |
| DOUBLE(m,d)  | Punto flotante doble              | Precisión de 8 bytes                         |
| DECIMAL(m,d) | Decimal de precisión fija         | Ideal para moneda                            |
| BIT(m)       | Valor binario                     | 1 a 64 bits                                  |

### Tipos de Cadena

| Tipo         | Descripción                       | Rango/Notas                                  |
|--------------|-----------------------------------|----------------------------------------------|
| CHAR(n)      | Cadena de longitud fija           | 0-255 caracteres                             |
| VARCHAR(n)   | Cadena de longitud variable       | 0-65,535 caracteres                          |
| TEXT         | Texto largo                      | Hasta 65,535 caracteres                      |
| BLOB         | Binario grande                   | Hasta 65,535 bytes                           |
| ENUM         | Valor de lista predefinida        | Un solo valor de una lista                   |
| SET          | Cero o más valores de lista       | Hasta 64 valores                             |

### Tipos de Fecha y Hora

| Tipo         | Descripción                       | Rango/Notas                                  |
|--------------|-----------------------------------|----------------------------------------------|
| DATE         | Solo fecha                        | '1000-01-01' a '9999-12-31'                  |
| TIME(p)      | Solo hora                         | '-838:59:59' a '838:59:59'                   |
| DATETIME(p)  | Fecha y hora                      | '1000-01-01 00:00:00' a '9999-12-31 23:59:59'|
| TIMESTAMP(p) | Fecha y hora (UTC)                | '1970-01-01' a '2038-01-19'                  |
| YEAR         | Año                               | 1901 a 2155 (y 0000)                         |

### Otros Tipos

| Tipo         | Descripción                       |
|--------------|-----------------------------------|
| JSON         | Documentos JSON                   |
| GEOMETRY     | Objeto espacial                   |

---

## 3. Comandos SQL Esenciales: Clasificación y Uso

### Clasificación de Comandos

- **DDL (Data Definition Language):** Definición de estructura (CREATE, ALTER, DROP, TRUNCATE, RENAME, COMMENT)
- **DML (Data Manipulation Language):** Manipulación de datos (INSERT, UPDATE, DELETE, LOCK, CALL)
- **DQL (Data Query Language):** Consulta de datos (SELECT)
- **DCL (Data Control Language):** Control de permisos (GRANT, REVOKE)
- **TCL (Transaction Control Language):** Control de transacciones (BEGIN, COMMIT, ROLLBACK, SAVEPOINT)

---

### 3.1. DDL: Definición de Datos

#### CREATE

```sql
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT
);
```

#### ALTER

```sql
ALTER TABLE Productos ADD COLUMN descripcion VARCHAR(255);
ALTER TABLE Productos MODIFY COLUMN nombre VARCHAR(100);
```

#### DROP

```sql
DROP TABLE Productos;
DROP DATABASE MiTienda;
```

#### TRUNCATE

```sql
TRUNCATE TABLE LogErrores;
```

#### RENAME

```sql
RENAME TABLE Productos TO Inventario;
ALTER TABLE Inventario RENAME COLUMN nombre TO nombre_producto;
```

#### COMMENT

```sql
COMMENT ON TABLE Inventario IS 'Tabla que almacena la información de los productos en stock.';
COMMENT ON COLUMN Inventario.precio IS 'Precio unitario del producto en la moneda local.';
```

---

### 3.2. DML: Manipulación de Datos

#### INSERT

```sql
INSERT INTO Productos (producto_id, nombre, precio, stock)
VALUES (101, 'Laptop Gaming', 1200.00, 5);
```

#### UPDATE

```sql
UPDATE Productos SET stock = 3 WHERE producto_id = 101;
```

#### DELETE

```sql
DELETE FROM Productos WHERE producto_id = 102;
```

#### LOCK TABLE

```sql
LOCK TABLES Productos WRITE;
-- operaciones
UNLOCK TABLES;
```

#### CALL

```sql
CALL ActualizarStock(101, 1);
```

#### EXPLAIN PLAN

```sql
EXPLAIN PLAN FOR
SELECT nombre, precio FROM Productos WHERE producto_id = 101;
```

---

### 3.3. DQL: Consulta de Datos

#### SELECT

```sql
SELECT * FROM Productos;
SELECT nombre, precio FROM Productos;
```

#### WHERE

```sql
SELECT nombre, stock FROM Productos WHERE stock < 5;
```

#### ORDER BY

```sql
SELECT nombre, precio FROM Productos ORDER BY precio ASC;
```

#### DISTINCT

```sql
SELECT DISTINCT categoria FROM Productos_Categorias;
```

#### LIMIT / TOP / FETCH FIRST

```sql
SELECT nombre, precio FROM Productos ORDER BY precio DESC LIMIT 3;
SELECT TOP 2 nombre, stock FROM Productos ORDER BY stock ASC;
```

#### Operadores Lógicos y de Comparación

```sql
SELECT nombre, categoria, stock FROM Productos_Categorias
WHERE categoria = 'Electrónica' AND stock >= 5;
```

#### GROUP BY

```sql
SELECT categoria, COUNT(producto_id) AS total_productos
FROM Productos_Categorias
GROUP BY categoria;
```

#### HAVING

```sql
SELECT categoria, COUNT(producto_id) AS total_productos
FROM Productos_Categorias
GROUP BY categoria
HAVING COUNT(producto_id) > 2;
```

#### JOINS

- **INNER JOIN**

    ```sql
    SELECT E.nombre, D.nombre_departamento
    FROM Empleados E
    INNER JOIN Departamentos D ON E.departamento_id = D.departamento_id;
    ```

- **LEFT JOIN**

    ```sql
    SELECT E.nombre, D.nombre_departamento
    FROM Empleados E
    LEFT JOIN Departamentos D ON E.departamento_id = D.departamento_id;
    ```

- **RIGHT JOIN**

    ```sql
    SELECT D.nombre_departamento, E.nombre
    FROM Empleados E
    RIGHT JOIN Departamentos D ON E.departamento_id = D.departamento_id;
    ```

- **FULL OUTER JOIN**

    ```sql
    SELECT E.nombre, D.nombre_departamento
    FROM Empleados E
    FULL OUTER JOIN Departamentos D ON E.departamento_id = D.departamento_id;
    ```

- **CROSS JOIN**

    ```sql
    SELECT E.nombre, D.nombre_departamento
    FROM Empleados E
    CROSS JOIN Departamentos D;
    ```

- **SELF JOIN**

    ```sql
    SELECT E.nombre AS Empleado, S.nombre AS Supervisor
    FROM Empleados E
    LEFT JOIN Empleados S ON E.supervisor_id = S.empleado_id;
    ```

#### UNION

```sql
SELECT nombre FROM Clientes_USA
UNION
SELECT nombre FROM Clientes_Canada;
```

#### Subconsultas

```sql
SELECT nombre, precio
FROM Productos
WHERE precio > (SELECT AVG(precio) FROM Productos);
```

---

### 3.4. DCL: Control de Permisos

#### GRANT

```sql
GRANT SELECT ON Productos TO analista_ventas;
GRANT INSERT, UPDATE ON Pedidos TO gestor_pedidos WITH GRANT OPTION;
```

#### REVOKE

```sql
REVOKE INSERT ON Pedidos FROM gestor_pedidos;
REVOKE SELECT ON Productos FROM analista_ventas;
```

---

### 3.5. TCL: Control de Transacciones

#### BEGIN TRANSACTION

```sql
BEGIN TRANSACTION;
-- operaciones DML
```

#### COMMIT

```sql
COMMIT;
```

#### ROLLBACK

```sql
ROLLBACK;
```

#### SAVEPOINT

```sql
SAVEPOINT nombre_punto;
ROLLBACK TO SAVEPOINT nombre_punto;
```

---

## 4. Funciones Avanzadas de SQL

### Funciones de Cadena

- `CONCAT()`, `LENGTH()`, `CHARACTER_LENGTH()`, `SUBSTRING()`, `UPPER()`, `LOWER()`, `REPLACE()`

### Funciones Numéricas

- `ABS()`, `ROUND()`, `CEILING()`, `FLOOR()`, `POWER()`, `SQRT()`

### Funciones de Fecha y Hora

- `NOW()`, `CURDATE()`, `DATE()`, `YEAR()`, `MONTH()`, `DAY()`, `DATE_ADD()`, `DATEDIFF()`

### Funciones Agregadas

- `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()`

### Funciones de Ventana

```sql
SELECT Name, Age, Department, Salary,
       AVG(Salary) OVER(PARTITION BY Department) AS Avg_Salary
FROM employee;
```

- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LEAD()`, `LAG()`

### Common Table Expressions (CTEs)

```sql
WITH Supervisores AS (
    SELECT e.empleado_id, e.nombre AS nombre_empleado, s.nombre AS nombre_supervisor
    FROM Empleados e
    LEFT JOIN Empleados s ON e.supervisor_id = s.empleado_id
)
SELECT empleado_id, nombre_empleado, nombre_supervisor
FROM Supervisores;
```

---

> **Nota:** Para ejemplos completos, tablas de resultados y advertencias sobre cada comando, consulta las secciones detalladas en el documento.
