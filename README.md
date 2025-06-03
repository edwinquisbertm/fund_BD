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

## Recursos 1
https://dbdiagram.io/


select * from clients;

update clients set client_id = 2 where client_id = 1;

DELETE FROM bill_products WHERE bill_product_id = 1;