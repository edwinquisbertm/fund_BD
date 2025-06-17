# Guía Completa de SQL: De Apuntes a Experto

## 1. Introducción a SQL y Estructura del Documento
SQL, o Structured Query Language, representa el lenguaje estándar universalmente reconocido para la gestión y manipulación de bases de datos relacionales. Su relevancia radica en la capacidad que otorga a los usuarios para interactuar directamente con los datos, facilitando operaciones cruciales como la consulta, inserción, actualización y eliminación de información, además de la definición precisa de la estructura de la base de datos. El dominio de SQL es, por tanto, una habilidad indispensable para cualquier profesional que trabaje con datos, abarcando roles desde desarrolladores y analistas hasta administradores de bases de datos.   

La designación de SQL como "lenguaje estándar" para bases de datos relacionales conlleva implicaciones significativas para los profesionales del sector. Esta estandarización asegura que los conocimientos adquiridos en SQL sean altamente transferibles entre una diversidad de sistemas de gestión de bases de datos (DBMS), incluyendo plataformas tan dispares como MySQL, PostgreSQL, Oracle y SQL Server. Tal interoperabilidad reduce drásticamente la curva de aprendizaje al transicionar entre diferentes entornos de bases de datos y, consecuentemente, mejora la empleabilidad del profesional. La naturaleza declarativa de SQL, que permite a los usuarios especificar    

qué datos necesitan sin dictar cómo deben ser recuperados, delega la optimización al motor de la base de datos. Esta característica ha sido un factor determinante en la persistencia y predominio de los modelos de bases de datos relacionales en la industria, incluso frente al surgimiento de bases de datos NoSQL. La robustez y la vasta cantidad de recursos disponibles en la comunidad de SQL, fomentadas por su estandarización, aceleran el aprendizaje y la resolución de problemas, consolidando su posición como una herramienta fundamental en la gestión de datos.

Esta guía ha sido meticulosamente estructurada en formato Markdown, aprovechando las ventajas inherentes de este formato para optimizar la lectura, la navegación y la replicabilidad de los ejemplos presentados. La elección de Markdown garantiza una claridad y organización superiores mediante el uso consistente de encabezados, listas y bloques de código, lo que facilita una estructura lógica y fácil de seguir. Los comandos SQL y sus resultados se presentarán en bloques de código, permitiendo una copia y prueba sencilla por parte del lector. Además, la accesibilidad es una característica clave, ya que Markdown es un formato de texto plano que puede ser visualizado en cualquier editor de texto o plataforma compatible, como GitHub o Bitbucket.

## 2. Fundamentos de SQL: Tipos de Datos
En SQL, la asignación de un tipo de dato específico a cada columna de una tabla es un pilar fundamental del diseño de bases de datos. Este tipo de dato no solo define la naturaleza de los valores que la columna puede almacenar (como números, texto o fechas), sino que también determina la cantidad de espacio de almacenamiento requerido y las operaciones lógicas y aritméticas que se pueden realizar con esos datos. La selección adecuada de tipos de datos es crucial para la eficiencia del almacenamiento, el rendimiento óptimo de las consultas y la integridad inquebrantable de los datos.   

La elección de un tipo de dato impacta directamente en el rendimiento y la integridad de la base de datos. Un tipo de dato incorrecto, como el uso de VARCHAR(255) para una columna que solo almacena valores binarios de "Sí" o "No", puede resultar en un uso ineficiente del espacio de almacenamiento, lo que a su vez incrementa el tamaño de la base de datos y la cantidad de operaciones de entrada/salida (I/O) necesarias para leer los datos. El tamaño de los datos influye directamente en el rendimiento de las consultas, ya que una mayor cantidad de datos requiere más lectura de disco y una mayor capacidad de memoria caché. Además, un tipo de dato inapropiado puede comprometer la integridad de los datos, por ejemplo, al intentar almacenar texto en una columna numérica o una fecha fuera de su rango permitido. La optimización a nivel de tipo de dato constituye una de las primeras y más importantes capas de optimización en el diseño de bases de datos. Una práctica de diseño de esquemas sólida comienza con la selección meticulosa de tipos de datos para cada columna, considerando tanto los requisitos actuales como las proyecciones de crecimiento futuro de los datos. Esta decisión también influye en la eficacia de los índices, ya que los índices sobre columnas con tipos de datos más pequeños y consistentes suelen ser intrínsecamente más eficientes.

## Tipos Numéricos
Los tipos de datos numéricos se emplean para almacenar valores enteros y decimales con diversas precisiones.  

- **TINYINT**: Diseñado para enteros muy pequeños, ocupa 1 byte. Su rango es de -128 a 127 con signo, y de 0 a 255 sin signo.  
- **SMALLINT**: Para enteros pequeños, utiliza 2 bytes. Su rango es de -32,768 a 32,767 con signo, y de 0 a 65,535 sin signo.  
- **MEDIUMINT**: Apto para enteros de tamaño medio, con 3 bytes de almacenamiento. Su rango es de -8,388,608 a 8,388,607 con signo, y de 0 a 16,777,215 sin signo.  
- **INT/INTEGER**: Un tipo de entero de propósito general, que consume 4 bytes. Su rango abarca desde -2,147,483,648 hasta 2,147,483,647 con signo, y de 0 a 4,294,967,295 sin signo.  
- **BIGINT**: Para enteros muy grandes, utiliza 8 bytes. Su rango es de -2^63^ a 2^63^-1 con signo, y de 0 a 2^64^-1 sin signo.  
- **FLOAT(m,d)**: Representa números de punto flotante de precisión simple, con 4 bytes de almacenamiento. La p en FLOAT(p) especifica la precisión, donde valores de 0 a 23 resultan en una columna de precisión simple.  
- **DOUBLE(m,d)**: Para números de punto flotante de precisión doble, con 8 bytes. Valores de p de 24 a 53 resultan en una columna de doble precisión.  
- **DECIMAL(m,d)**: Permite valores decimales con una precisión definida por el usuario. Es el tipo ideal para datos monetarios o cualquier situación donde la precisión exacta sea crítica, ya que almacena los valores como cadenas de caracteres para evitar errores de redondeo de punto flotante.  
- **BIT(m)**: Almacena valores binarios de m bits, donde m puede variar de 1 a 64.  

## Tipos de Cadena
Estos tipos de datos se emplean para almacenar información textual.  

- **CHAR(n)**: Una cadena de longitud fija. Si el valor es más corto que n, se rellena con espacios a la derecha hasta alcanzar la longitud especificada. Los espacios finales se eliminan automáticamente al recuperar el valor. Su longitud puede ser de 0 a 255 caracteres.  
- **VARCHAR(n)**: Una cadena de longitud variable. Almacena únicamente los caracteres necesarios, lo que lo hace más eficiente en espacio para datos cuya longitud varía. El rango de longitud es de 0 a 65,535 caracteres en MySQL 5.0.3 y versiones posteriores.  
- **BINARY(n)**: Similar a CHAR, pero para cadenas binarias de longitud fija.  
- **VARBINARY(n)**: Similar a VARCHAR, pero para cadenas binarias de longitud variable.  
- **TINYTEXT, TEXT, MEDIUMTEXT, LONGTEXT**: Utilizados para valores textuales de diversas longitudes. TEXT es un tipo de propósito general para texto más largo que VARCHAR.  
- **TINYBLOB, BLOB, MEDIUMBLOB, LONGBLOB**: Diseñados para almacenar grandes datos binarios, como imágenes o archivos. No requieren que se especifique una longitud al crear la columna.  
- **ENUM**: Permite almacenar un único valor de una lista predefinida de elementos, especificada durante la creación de la tabla.  
- **SET**: Permite almacenar cero o más valores de una lista predefinida, también especificada al crear la tabla. Puede contener hasta 64 valores.  

La distinción entre CHAR y VARCHAR, así como entre TEXT y BLOB, tiene implicaciones significativas en el diseño de la base de datos. El uso de CHAR para datos de longitud variable, como nombres, puede resultar en un desperdicio de espacio de almacenamiento y afectar negativamente el rendimiento de los índices si las longitudes de los datos son muy dispares. VARCHAR, al almacenar solo los caracteres necesarios, es inherentemente más eficiente en el uso del espacio para datos de longitud variable. Además, el relleno con espacios de  

CHAR puede llevar a comparaciones inesperadas si no se manejan adecuadamente los espacios finales. Por otro lado, TEXT y BLOB están destinados a datos muy grandes que no se indexan de la misma manera que CHAR o VARCHAR, lo que implica que las consultas WHERE sobre estas columnas pueden ser considerablemente lentas si no se implementan funciones de búsqueda de texto completo o estrategias de indexación especializadas. La elección entre CHAR y VARCHAR es una decisión de diseño de base de datos que busca un equilibrio entre el uso del espacio, el rendimiento de E/S y la simplicidad de la comparación. Para TEXT y BLOB, la implicación es que no deben utilizarse para datos que requieren búsquedas frecuentes y rápidas basadas en su contenido completo, sino más bien para almacenar grandes bloques de datos que se recuperan en su totalidad o se procesan externamente.

## Tipos de Fecha y Hora
Estos tipos se utilizan para almacenar información temporal.  

- **DATE**: Almacena solo la fecha en formato YYYY-MM-DD. Su rango abarca desde '1000-01-01' hasta '9999-12-31'.  
- **TIME(p)**: Almacena solo la hora en formato HH:MM:SS. El rango es de '-838:59:59' a '838:59:59'.  
- **DATETIME(p)**: Almacena tanto la fecha como la hora en formato YYYY-MM-DD HH:MM:SS. Su rango va desde '1000-01-01 00:00:00' hasta '9999-12-31 23:59:59'.  
- **TIMESTAMP(p)**: Almacena fecha y hora, pero con una particularidad crucial: los valores se convierten de la zona horaria actual a UTC (Coordinated Universal Time) al ser almacenados, y se reconvierten de UTC a la zona horaria del servidor al ser recuperados. Su rango es de '1970-01-01 00:00:01' UTC a '2038-01-19 03:14:07' UTC.  
- **YEAR**: Almacena un año en formato YYYY o YY. Su rango es de 1901 a 2155, incluyendo el año 0000.

## Consideraciones sobre TIMESTAMP vs DATETIME
La consideración de la zona horaria al elegir entre TIMESTAMP y DATETIME es un aspecto crítico. TIMESTAMP se convierte a UTC al almacenar y se revierte a la zona horaria local al recuperar, mientras que DATETIME no realiza esta conversión. Para aplicaciones globales o distribuidas donde los usuarios pueden residir en diferentes zonas horarias,  

TIMESTAMP es el tipo preferible para mantener la coherencia de los datos temporales, ya que almacena un punto en el tiempo universalmente consistente. Por el contrario, DATETIME es más adecuado para fechas y horas que no deben verse afectadas por la zona horaria del servidor, como una fecha de nacimiento o un evento programado que ocurre a una hora específica independientemente de la ubicación. No comprender esta diferencia puede llevar a datos de tiempo incorrectos o inconsistentes cuando se interactúa con usuarios en diversas ubicaciones geográficas, lo que afecta directamente la lógica de negocio y la experiencia del usuario. La elección del tipo de dato de tiempo es, por tanto, una decisión de arquitectura de sistema con profundas implicaciones en la precisión y la universalidad de los datos temporales, especialmente en sistemas que operan a través de múltiples regiones.

## Tipos Espaciales y JSON
MySQL ha evolucionado para incorporar tipos de datos que trascienden los modelos relacionales tradicionales, ofreciendo mayor flexibilidad en el manejo de datos complejos.

### Tipos Espaciales
Estos tipos se utilizan para almacenar datos geométricos o geográficos, permitiendo la representación y consulta de información sobre formas y ubicaciones físicas.  

- **GEOMETRY**: Un tipo genérico que puede representar cualquier objeto espacial, como un punto, una línea o un polígono.  
- **POINT**: Representa un solo punto en un sistema de coordenadas, definido por sus valores X e Y.  
- **LINESTRING**: Una serie de puntos conectados que forman una línea o una curva.  
- **POLYGON**: Una serie de puntos conectados que forman un área o superficie cerrada.  
- **GEOMETRYCOLLECTION**: Permite almacenar una colección de diferentes tipos de datos espaciales.  
- **MULTIPOINT, MULTILINE, MULTIPOLYGON**: Representan colecciones de puntos, líneas o polígonos, respectivamente.  

### Tipo JSON
Desde la versión 5.7.8, MySQL incluye soporte para el tipo de dato JSON, lo que permite almacenar y gestionar documentos JSON directamente dentro de la base de datos. MySQL valida automáticamente los documentos JSON para asegurar su corrección y optimiza el formato de almacenamiento para un acceso de lectura rápido.  

La inclusión de tipos de datos espaciales y JSON en MySQL permite a las bases de datos relacionales manejar datos que tradicionalmente eran el dominio exclusivo de bases de datos NoSQL (para JSON) o sistemas de información geográfica (GIS) (para datos espaciales). Si bien estos tipos ofrecen una flexibilidad considerable, su gestión y consulta pueden ser más complejas que las de los tipos escalares tradicionales. Las consultas JSON a menudo requieren funciones específicas como  

JSON_EXTRACT o JSON_CONTAINS, y las consultas espaciales utilizan operadores y funciones geométricas especializadas. Esta complejidad puede afectar el rendimiento si no se utilizan índices espaciales adecuados o si las consultas no están optimizadas. La capacidad de los DBMS relacionales para integrar estos tipos de datos complejos señala una tendencia hacia la convergencia de capacidades entre bases de datos relacionales y NoSQL. Esto permite a los desarrolladores utilizar la base de datos relacional para una gama más amplia de casos de uso, reduciendo la necesidad de implementar múltiples sistemas de bases de datos para diferentes tipos de datos.

## Tabla Esencial: Resumen de Tipos de Datos Comunes
La siguiente tabla proporciona un resumen conciso de los tipos de datos más comunes en MySQL, categorizados para facilitar la referencia rápida.

| Categoría    | Tipo de Dato  | Descripción                          | Rango/Notas                                      |
|--------------|---------------|--------------------------------------|--------------------------------------------------|
| **Numéricos**| TINYINT       | Entero muy pequeño                   | -128 a 127 (signed), 0 a 255 (unsigned)          |
|              | SMALLINT      | Entero pequeño                       | -32,768 a 32,767 (signed), 0 a 65,535 (unsigned)|
|              | INT/INTEGER   | Entero de propósito general          | -2.1B a 2.1B (signed), 0 a 4.2B (unsigned)      |
|              | BIGINT        | Entero muy grande                    | -2^63 a 2^63-1 (signed), 0 a 2^64-1 (unsigned)  |
|              | FLOAT         | Punto flotante simple                | Precisión de 4 bytes                             |
|              | DOUBLE        | Punto flotante doble                 | Precisión de 8 bytes                             |
|              | DECIMAL(m,d)  | Decimal de precisión fija            | Precisión exacta, ideal para moneda              |
| **Cadena**   | CHAR(n)       | Cadena de longitud fija              | 0-255 caracteres, rellena con espacios           |
|              | VARCHAR(n)    | Cadena de longitud variable          | 0-65,535 caracteres (MySQL 5.0.3+)               |
|              | TEXT          | Texto de propósito general           | Hasta 65,535 caracteres                          |
|              | BLOB          | Objeto binario grande                | Hasta 65,535 bytes (para datos binarios)         |
|              | ENUM          | Valor de lista predefinida           | Un solo valor de una lista                       |
|              | SET           | Cero o más valores de lista          | Hasta 64 valores de una lista                    |
| **Fecha/Hora**| DATE         | Solo fecha                           | '1000-01-01' a '9999-12-31'                     |
|              | TIME(p)       | Solo hora                            | '-838:59:59' a '838:59:59'                       |
|              | DATETIME(p)   | Fecha y hora                         | '1000-01-01 00:00:00' a '9999-12-31 23:59:59'   |
|              | TIMESTAMP(p)  | Fecha y hora (UTC)                   | '1970-01-01' a '2038-01-19' (convertido a UTC)   |
|              | YEAR          | Año                                  | 1901 a 2155 (y 0000)                             |
| **Otros**    | JSON          | Documentos JSON                      | Valida y almacena documentos JSON                |
|              | GEOMETRY      | Objeto espacial                      | Punto, línea, polígono, etc.                     |


## 3. Comandos SQL Esenciales: Clasificación y Uso
SQL se organiza en diversas categorías de comandos, cada una orientada a un propósito específico dentro de la gestión de bases de datos. Esta clasificación es fundamental para comprender la funcionalidad y el impacto de cada comando en el ciclo de vida de los datos. Las principales categorías incluyen:

- **DDL (Data Definition Language):** Dedicado a la definición y gestión de la estructura de la base de datos.   
- **DML (Data Manipulation Language):** Enfocado en la manipulación de los datos contenidos en las tablas.   
- **DQL (Data Query Language):** Utilizado para la consulta y recuperación de datos.   
- **DCL (Data Control Language):** Orientado a la gestión de permisos y el control de acceso a los datos.   
- **TCL (Transaction Control Language):** Empleado para gestionar transacciones y asegurar la integridad de los datos.   

### 3.1. Lenguaje de Definición de Datos (DDL)
Los comandos DDL son cruciales para la arquitectura y el mantenimiento de una base de datos, ya que permiten crear, modificar y eliminar objetos como tablas, índices y vistas.   

**CREATE**

El comando **CREATE** se utiliza para establecer nuevas bases de datos o sus componentes, como tablas, índices, funciones, vistas, procedimientos almacenados y triggers. Es la base para construir la estructura de la base de datos.   

**Ejemplo 1: Crear una tabla Productos**

``` SQL
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT
);
```

**Tabla Resultante (Estructura de la tabla Productos):**

| Columna     | Tipo de Dato     | Clave |
| :---------- | :--------------- | :---- |
| producto_id | INT              | PK    |
| nombre      | VARCHAR(50)      |       |
| precio      | DECIMAL(10, 2)   |       |
| stock       | INT              |       |

**Ejemplo 2: Crear una base de datos MiTienda**

``` SQL
CREATE DATABASE MiTienda;
```

**Tabla Resultante (Bases de Datos existentes):**

| Base de Datos       |
|:-------------------:|
| MiTienda            |
| sys                 |
| information_schema  |
| mysql               |
| performance_schema  |

**Precauciones:**  
Es fundamental contar con los permisos apropiados (`CREATE DATABASE`, `CREATE TABLE`) antes de ejecutar estos comandos. La correcta definición de tipos de datos y restricciones (`PRIMARY KEY`, `NOT NULL`, `UNIQUE`) desde el inicio es vital, ya que cualquier modificación posterior puede ser costosa y compleja. Además, es recomendable que los nombres de tablas y columnas sean descriptivos y sigan convenciones de nomenclatura claras para mejorar la legibilidad y mantenibilidad del esquema.  

#### ALTER  
El comando `ALTER` se emplea para modificar la estructura de un objeto de base de datos ya existente. Estas modificaciones pueden incluir la adición, eliminación o cambio de columnas.  

**Ejemplo 1: Añadir una columna descripcion a la tabla Productos**

```SQL

ALTER TABLE Productos
ADD COLUMN descripcion VARCHAR(255);
```

**Tabla Resultante (Estructura de la tabla Productos después de ALTER):**

| Columna     | Tipo de Dato      | Clave |
| :---------- | :--------------- | :---- |
| producto_id | INT              | PK    |
| nombre      | VARCHAR(50)      |       |
| precio      | DECIMAL(10, 2)   |       |
| stock       | INT              |       |
| descripcion | VARCHAR(255)     |       |

**Ejemplo 2: Modificar el tipo de dato de la columna nombre en Productos**

```SQL
ALTER TABLE Productos
MODIFY COLUMN nombre VARCHAR(100); -- O ALTER COLUMN en SQL Server
```

**Tabla Resultante (Estructura de la tabla Productos después de MODIFY):**

| Columna | Tipo de Dato | Clave |
| :---------- | :----------- | :---- |
| producto_id | INT | PK |
| nombre | VARCHAR(100) | |
| precio | DECIMAL(10, 2) | |
| stock | INT | |
| descripcion | VARCHAR(255) | |

Precauciones: Las operaciones ALTER TABLE en tablas de gran tamaño pueden ser extremadamente lentas y bloquear la tabla durante su ejecución, impactando negativamente la disponibilidad de la aplicación. Modificar tipos de datos puede resultar en pérdida de datos si el nuevo tipo es más restrictivo. Siempre es aconsejable realizar copias de seguridad antes de ejecutar comandos ALTER críticos en entornos de producción.

#### DROP
El comando DROP se utiliza para eliminar objetos de la base de datos, como tablas, índices o bases de datos completas.   

Ejemplo 1: Eliminar la tabla Productos

```SQL
DROP TABLE Productos;
```

Tabla Resultante (Tablas existentes en la base de datos):
| Tabla |
| :---- |
| Clientes |
| Pedidos |
| Empleados |

Ejemplo 2: Eliminar la base de datos MiTienda

SQL

DROP DATABASE MiTienda;
Tabla Resultante (Bases de Datos existentes):
| Base de Datos |
| :------------ |
| sys |
| information_schema |
| mysql |
| performance_schema |

Precauciones: DROP es una operación irreversible. Una vez que un objeto es eliminado, su recuperación solo es posible a través de una copia de seguridad. Es crucial asegurarse de que no existan dependencias (como vistas o procedimientos almacenados) del objeto que se va a eliminar, ya que su supresión podría generar errores en otras partes del sistema. Siempre se debe verificar el nombre del objeto dos veces antes de ejecutar DROP.

TRUNCATE
El comando TRUNCATE se utiliza para eliminar todos los registros de una tabla, liberando también todo el espacio de almacenamiento asignado a esos registros. Es considerablemente más rápido que DELETE sin una cláusula WHERE porque no registra las eliminaciones fila por fila.   

Ejemplo 1: Truncar la tabla LogErrores

```SQL
TRUNCATE TABLE LogErrores;
```

Tabla LogErrores antes de TRUNCATE:
| id_error | mensaje | fecha |
| :------- | :------ | :---- |
| 1 | Error de conexión | 2023-01-15 |
| 2 | Datos inválidos | 2023-01-16 |
| 3 | Tiempo de espera | 2023-01-17 |
| 4 | Fallo de autenticación | 2023-01-18 |
| 5 | Desbordamiento de buffer | 2023-01-19 |
Tabla LogErrores después de TRUNCATE:
| id_error | mensaje | fecha |
| :------- | :------ | :---- |
| (vacía) | | |

Ejemplo 2: Truncar la tabla SesionesTemporales

```SQL
TRUNCATE TABLE SesionesTemporales;
```

Tabla SesionesTemporales antes de TRUNCATE:
| id_sesion | usuario | ultima_actividad |
| :-------- | :------ | :--------------- |
| A101 | user_a | 2023-05-01 10:00:00 |
| B202 | user_b | 2023-05-01 10:05:00 |
| C303 | user_c | 2023-05-01 10:10:00 |
| D404 | user_d | 2023-05-01 10:15:00 |
| E505 | user_e | 2023-05-01 10:20:00 |
Tabla SesionesTemporales después de TRUNCATE:
| id_sesion | usuario | ultima_actividad |
| :-------- | :------ | :--------------- |
| (vacía) | | |

Precauciones: TRUNCATE es una operación DDL y, por lo tanto, no puede revertirse con un ROLLBACK en la mayoría de los sistemas de bases de datos, a diferencia de DELETE. Elimina todos los registros de la tabla, por lo que debe usarse con extrema precaución. Además, reinicia los contadores de identidad (como AUTO_INCREMENT) en la tabla.

RENAME
El comando RENAME se utiliza para cambiar el nombre de un objeto existente en la base de datos.   

Ejemplo 1: Renombrar la tabla Productos a Inventario

```SQL
RENAME TABLE Productos TO Inventario;
```
Tabla Resultante (Tablas existentes):
| Tabla |
| :---- |
| Inventario |
| Clientes |
| Pedidos |

Ejemplo 2: Renombrar la columna nombre a nombre_producto en Inventario

SQL

ALTER TABLE Inventario
RENAME COLUMN nombre TO nombre_producto; -- Sintaxis puede variar (ej. CHANGE COLUMN en MySQL)
Tabla Resultante (Estructura de Inventario):
| Columna | Tipo de Dato |
| :---------- | :----------- |
| producto_id | INT |
| nombre_producto | VARCHAR(100) |
| precio | DECIMAL(10, 2) |

Precauciones: Renombrar objetos puede romper aplicaciones o consultas que hacen referencia al nombre antiguo. Es fundamental actualizar todas las referencias en el código de la aplicación, vistas, procedimientos almacenados y scripts para evitar errores.

COMMENT
El comando COMMENT se utiliza para añadir comentarios descriptivos al diccionario de datos sobre tablas, columnas u otros objetos de la base de datos.   

Ejemplo 1: Añadir un comentario a la tabla Inventario

SQL

COMMENT ON TABLE Inventario IS 'Tabla que almacena la información de los productos en stock.';
Tabla Resultante (Metadatos de la tabla Inventario):
| Propiedad | Valor |
| :-------- | :---- |
| Nombre | Inventario |
| Comentario | Tabla que almacena la información de los productos en stock. |

Ejemplo 2: Añadir un comentario a la columna precio en Inventario

SQL

COMMENT ON COLUMN Inventario.precio IS 'Precio unitario del producto en la moneda local.';
Tabla Resultante (Metadatos de la columna precio):
| Columna | Tipo de Dato | Comentario |
| :---------- | :----------- | :--------- |
| precio | DECIMAL(10, 2) | Precio unitario del producto en la moneda local. |

Precauciones: Los comentarios son una herramienta valiosa para la documentación y la comprensión del esquema de la base de datos, pero no deben utilizarse para implementar lógica de negocio crítica. Es importante mantener los comentarios actualizados a medida que la estructura de la base de datos evoluciona para garantizar su utilidad.

3.2. Lenguaje de Manipulación de Datos (DML)
Los comandos DML son la piedra angular para interactuar con los datos dentro de los objetos de la base de datos, permitiendo insertar, actualizar y eliminar información.   

INSERT INTO
El comando INSERT INTO se utiliza para añadir nuevas filas de datos a una tabla existente.   

Ejemplo 1: Insertar un nuevo producto en Productos

SQL

INSERT INTO Productos (producto_id, nombre, precio, stock)
VALUES (101, 'Laptop Gaming', 1200.00, 5);
Tabla Productos después de INSERT:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1200.00 | 5 |

Ejemplo 2: Insertar otro producto, especificando solo algunas columnas

SQL

INSERT INTO Productos (producto_id, nombre, precio)
VALUES (102, 'Teclado Mecánico', 85.50);
Tabla Productos después de INSERT (con NULL en stock):
| producto_id | nombre | precio | stock |
| :---------- | :--------------- | :----- | :---- |
| 101 | Laptop Gaming | 1200.00 | 5 |
| 102 | Teclado Mecánico | 85.50 | NULL |

Precauciones: Es esencial que los valores insertados coincidan con los tipos de datos de las columnas y que se respeten todas las restricciones de la tabla, como claves primarias, claves foráneas, NOT NULL y UNIQUE. Para inserciones masivas de datos, es más eficiente considerar el uso de comandos de carga de datos específicos del sistema de gestión de bases de datos, como LOAD DATA INFILE en MySQL, para un mejor rendimiento.

UPDATE
El comando UPDATE se emplea para modificar datos existentes en una o más filas de una tabla.   

Ejemplo 1: Actualizar el stock de un producto

SQL

UPDATE Productos
SET stock = 3
WHERE producto_id = 101;
Tabla Productos antes de UPDATE:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1200.00 | 5 |
| 102 | Teclado Mecánico | 85.50 | NULL |
Tabla Productos después de UPDATE:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1200.00 | 3 |
| 102 | Teclado Mecánico | 85.50 | NULL |

Ejemplo 2: Aumentar el precio de todos los productos en un 10%

SQL

UPDATE Productos
SET precio = precio * 1.10;
Tabla Productos antes de UPDATE:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1200.00 | 3 |
| 102 | Teclado Mecánico | 85.50 | NULL |
Tabla Productos después de UPDATE:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 3 |
| 102 | Teclado Mecánico | 94.05 | NULL |

Precauciones: Es imperativo siempre utilizar la cláusula WHERE con UPDATE. La omisión de WHERE resultará en que la operación UPDATE afecte a todas las filas de la tabla, lo que puede tener consecuencias catastróficas en un entorno de producción. Se recomienda encarecidamente realizar una copia de seguridad o envolver la operación en una transacción (BEGIN TRANSACTION, COMMIT, ROLLBACK) antes de ejecutar UPDATE en producción. Adicionalmente, es buena práctica verificar los resultados de una consulta SELECT con la misma condición WHERE antes de ejecutar el UPDATE para asegurar que solo las filas deseadas serán modificadas.

DELETE FROM
El comando DELETE FROM se utiliza para eliminar una o más filas de datos de una tabla.   

Ejemplo 1: Eliminar un producto específico

SQL

DELETE FROM Productos
WHERE producto_id = 102;
Tabla Productos antes de DELETE:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 3 |
| 102 | Teclado Mecánico | 94.05 | NULL |
Tabla Productos después de DELETE:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 3 |

Ejemplo 2: Eliminar todos los productos con stock cero o NULL

SQL

DELETE FROM Productos
WHERE stock IS NULL OR stock = 0;
Tabla Productos antes de DELETE:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 3 |
| 103 | Ratón Óptico | 25.00 | 0 |
| 104 | Monitor Curvo | 450.00 | NULL |
Tabla Productos después de DELETE:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 3 |

Precauciones: Al igual que con UPDATE, es crucial siempre utilizar la cláusula WHERE con DELETE. Si se omite, se eliminarán todas las filas de la tabla. DELETE es una operación DML y, por lo tanto, puede ser revertida con un ROLLBACK si se ejecuta dentro de una transacción. Si el objetivo es eliminar todas las filas de una tabla grande y no se necesita la capacidad de ROLLBACK, se debe considerar el uso de TRUNCATE TABLE por su mayor eficiencia.

LOCK TABLE
El comando LOCK TABLE se utiliza para gestionar la concurrencia en tablas, bloqueándolas para impedir que otros usuarios las modifiquen mientras se realiza una operación específica.   

Ejemplo 1: Bloquear la tabla Productos en modo escritura

SQL

LOCK TABLES Productos WRITE;
-- Realizar operaciones de escritura seguras
-- Por ejemplo: INSERT INTO Productos VALUES (105, 'Webcam HD', 50.00, 10);
-- Luego, liberar el bloqueo
UNLOCK TABLES;
Tabla Productos (estado durante el bloqueo):
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 3 |
| (Bloqueada para escritura por otros) | | | |

Ejemplo 2: Bloquear la tabla Productos en modo lectura

SQL

LOCK TABLES Productos READ;
-- Realizar operaciones de lectura seguras
-- Por ejemplo: SELECT * FROM Productos WHERE stock < 5;
-- Luego, liberar el bloqueo
UNLOCK TABLES;
Tabla Productos (estado durante el bloqueo):
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 3 |
| (Bloqueada para escritura, permitida para lectura por otros) | | | |

Precauciones: Los bloqueos pueden generar cuellos de botella y reducir la concurrencia en la base de datos, impactando negativamente el rendimiento general. Se deben utilizar solo cuando sea absolutamente necesario para garantizar la consistencia de los datos en operaciones críticas. Es fundamental asegurarse de liberar siempre los bloqueos (UNLOCK TABLES) para evitar que otras sesiones queden esperando indefinidamente, lo que podría paralizar la aplicación.

CALL
El comando CALL se utiliza para ejecutar un subprograma PL/SQL o Java, que puede ser un procedimiento almacenado o una función.   

Ejemplo 1: Llamar a un procedimiento almacenado ActualizarStock

SQL

-- Asumiendo que existe un procedimiento:
-- CREATE PROCEDURE ActualizarStock (IN p_producto_id INT, IN p_cantidad INT)
-- BEGIN
--    UPDATE Productos SET stock = stock - p_cantidad WHERE producto_id = p_producto_id;
-- END;
CALL ActualizarStock(101, 1);
Tabla Productos antes de CALL:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 3 |
Tabla Productos después de CALL:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 2 |

Ejemplo 2: Llamar a un procedimiento para obtener un reporte

SQL

-- Asumiendo que existe un procedimiento:
-- CREATE PROCEDURE GenerarReporteProductosBajoStock()
-- BEGIN
--    SELECT nombre, stock FROM Productos WHERE stock < 5;
-- END;
CALL GenerarReporteProductosBajoStock();
Tabla Resultante del CALL:
| nombre | stock |
| :------------ | :---- |
| Laptop Gaming | 2 |

Precauciones: Es importante que los procedimientos almacenados estén optimizados, ya que su ejecución puede afectar el rendimiento general de la base de datos. Se deben controlar los permisos de ejecución en los procedimientos para evitar accesos no autorizados. Además, un manejo robusto de errores dentro de los procedimientos es fundamental para la estabilidad y fiabilidad de la aplicación.

EXPLAIN PLAN
El comando EXPLAIN PLAN se utiliza para obtener una descripción detallada de la ruta de acceso a los datos que el motor de la base de datos planea seguir para ejecutar una consulta. Esta herramienta es esencial para la optimización del rendimiento de las consultas.   

Ejemplo 1: Explicar el plan de una consulta SELECT simple

SQL

EXPLAIN PLAN FOR
SELECT nombre, precio FROM Productos WHERE producto_id = 101;
Tabla Resultante (Plan de Ejecución Simplificado - Ejemplo):
| id | select_type | table | type | possible_keys | key | rows | Extra |
| :-- | :---------- | :---- | :--- | :------------ | :-- | :--- | :---- |
| 1 | SIMPLE | Productos | const | PRIMARY | PRIMARY | 1 | Using where |

Ejemplo 2: Explicar el plan de una consulta con JOIN

SQL

EXPLAIN PLAN FOR
SELECT P.nombre, O.cantidad
FROM Productos P JOIN Pedidos O ON P.producto_id = O.producto_id
WHERE P.stock < 5;
Tabla Resultante (Plan de Ejecución Simplificado - Ejemplo):
| id | select_type | table | type | rows | Extra |
| :-- | :---------- | :---- | :--- | :--- | :---- |
| 1 | SIMPLE | P | ALL | 2 | Using where |
| 1 | SIMPLE | O | ref | 3 | Using index |

Precauciones: El plan de ejecución puede variar entre diferentes versiones del sistema de gestión de bases de datos o incluso con cambios en las estadísticas internas de la tabla. La interpretación de los planes de ejecución requiere un conocimiento profundo de cómo funciona el optimizador de consultas del DBMS. Es importante recordar que EXPLAIN PLAN solo muestra el plan de ejecución y no ejecuta la consulta; para evaluar el rendimiento real, se deben utilizar herramientas de monitoreo de rendimiento.

El comando EXPLAIN PLAN revela cómo el motor de la base de datos ejecutará una consulta , lo que significa que el optimizador de consultas del DBMS toma decisiones sobre la ruta más eficiente para recuperar los datos. Si el plan generado no es óptimo, por ejemplo, si realiza un escaneo completo de la tabla en lugar de utilizar un índice, la consulta será inherentemente lenta. Comprender y ajustar el plan, ya sea mediante la adición de índices o la reescritura de la consulta, es fundamental para el rendimiento. El rendimiento de la base de datos no solo depende de la capacidad del hardware, sino de manera crítica del diseño del esquema y de la optimización de las consultas.    

EXPLAIN PLAN es una herramienta diagnóstica esencial que permite a los desarrolladores y administradores de bases de datos "ver dentro" del motor de la base de datos y realizar ajustes precisos para mejorar la eficiencia, lo cual es vital para aplicaciones de alto rendimiento.

3.3. Lenguaje de Consulta de Datos (DQL)
Los comandos DQL se utilizan para recuperar datos de la base de datos, siendo SELECT el comando más fundamental y utilizado.   

SELECT
El comando SELECT es la piedra angular del DQL, utilizado para recuperar datos de una o más tablas.   

Ejemplo 1: Seleccionar todas las columnas de la tabla Productos

SQL

SELECT * FROM Productos;
Tabla Productos (Ejemplo de datos):
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 2 |
| 103 | Ratón Óptico | 25.00 | 0 |
| 105 | Webcam HD | 50.00 | 10 |
| 106 | Auriculares | 75.00 | 8 |
| 107 | Micrófono | 120.00 | 3 |
Tabla Resultante:
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 2 |
| 103 | Ratón Óptico | 25.00 | 0 |
| 105 | Webcam HD | 50.00 | 10 |
| 106 | Auriculares | 75.00 | 8 |
| 107 | Micrófono | 120.00 | 3 |

Ejemplo 2: Seleccionar solo nombre y precio de Productos

SQL

SELECT nombre, precio FROM Productos;
Tabla Resultante:
| nombre | precio |
| :------------ | :----- |
| Laptop Gaming | 1320.00 |
| Ratón Óptico | 25.00 |
| Webcam HD | 50.00 |
| Auriculares | 75.00 |
| Micrófono | 120.00 |

Precauciones: Se recomienda evitar el uso de SELECT * en entornos de producción. Esta práctica puede recuperar columnas innecesarias, lo que resulta en un desperdicio de recursos de red y base de datos, y ralentiza la consulta. Es más eficiente especificar siempre las columnas que realmente se necesitan.

WHERE Clause
La cláusula WHERE se utiliza para filtrar registros basándose en una condición específica, permitiendo seleccionar solo las filas que cumplen ciertos criterios.   

Ejemplo 1: Seleccionar productos con stock bajo (menor a 5)

SQL

SELECT nombre, stock FROM Productos WHERE stock < 5;
Tabla Productos (Ejemplo de datos):
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 2 |
| 103 | Ratón Óptico | 25.00 | 0 |
| 105 | Webcam HD | 50.00 | 10 |
| 106 | Auriculares | 75.00 | 8 |
| 107 | Micrófono | 120.00 | 3 |
Tabla Resultante:
| nombre | stock |
| :------------ | :---- |
| Laptop Gaming | 2 |
| Ratón Óptico | 0 |
| Micrófono | 3 |

Ejemplo 2: Seleccionar productos con precio entre 50 y 100

SQL

SELECT nombre, precio FROM Productos WHERE precio BETWEEN 50 AND 100;
Tabla Resultante:
| nombre | precio |
| :------------ | :----- |
| Webcam HD | 50.00 |
| Auriculares | 75.00 |

Precauciones: Las condiciones en la cláusula WHERE deben ser eficientes para garantizar un buen rendimiento. El uso de funciones en el lado izquierdo de un operador de comparación (ej. WHERE FUNCION(columna) = valor) puede impedir que el motor de la base de datos utilice índices en esa columna, lo que lleva a un escaneo completo de la tabla. Además, se debe tener especial cuidado con las comparaciones de valores NULL, ya que se comportan de manera diferente a otros valores (ver Sección 5).

ORDER BY Clause
La cláusula ORDER BY se utiliza para ordenar el conjunto de resultados de una consulta en un orden específico, ya sea ascendente (ASC) o descendente (DESC).   

Ejemplo 1: Ordenar productos por precio de forma ascendente

SQL

SELECT nombre, precio FROM Productos ORDER BY precio ASC;
Tabla Productos (Ejemplo de datos):
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 2 |
| 103 | Ratón Óptico | 25.00 | 0 |
| 105 | Webcam HD | 50.00 | 10 |
| 106 | Auriculares | 75.00 | 8 |
| 107 | Micrófono | 120.00 | 3 |
Tabla Resultante:
| nombre | precio |
| :------------ | :----- |
| Ratón Óptico | 25.00 |
| Webcam HD | 50.00 |
| Auriculares | 75.00 |
| Micrófono | 120.00 |
| Laptop Gaming | 1320.00 |

Ejemplo 2: Ordenar productos por stock de forma descendente y luego por nombre ascendente

SQL

SELECT nombre, stock FROM Productos ORDER BY stock DESC, nombre ASC;
Tabla Resultante:
| nombre | stock |
| :------------ | :---- |
| Webcam HD | 10 |
| Auriculares | 8 |
| Micrófono | 3 |
| Laptop Gaming | 2 |
| Ratón Óptico | 0 |

Precauciones: Ordenar grandes conjuntos de resultados puede ser una operación costosa en términos de rendimiento, ya que puede requerir el uso de memoria o espacio en disco para realizar la clasificación. Para mejorar el rendimiento en consultas que utilizan ORDER BY con frecuencia, se debe considerar la creación de índices en las columnas utilizadas para la ordenación.

SELECT DISTINCT
El comando SELECT DISTINCT se utiliza para devolver solo valores únicos de una columna o una combinación de columnas especificadas, eliminando filas duplicadas del conjunto de resultados.   

Ejemplo 1: Obtener categorías de productos únicas

SQL

-- Asumiendo una tabla Productos con una columna 'categoria'
CREATE TABLE Productos_Categorias (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(50),
    stock INT,
    fabricante VARCHAR(50)
);
INSERT INTO Productos_Categorias VALUES
(1, 'Laptop', 'Electrónica', 8, 'Dell'),
(2, 'Teclado', 'Electrónica', 12, 'Logitech'),
(3, 'Silla', 'Muebles', 5, 'Ikea'),
(4, 'Mesa', 'Muebles', 3, 'Ikea'),
(5, 'Monitor', 'Electrónica', 10, 'Dell'),
(6, 'Auriculares', 'Audio', 7, 'Logitech');
SELECT DISTINCT categoria FROM Productos_Categorias;
Tabla Resultante:
| categoria |
| :---------- |
| Electrónica |
| Muebles |
| Audio |

Ejemplo 2: Obtener combinaciones únicas de categoría y fabricante

SQL

SELECT DISTINCT categoria, fabricante FROM Productos_Categorias;
Tabla Resultante:
| categoria | fabricante |
| :---------- | :--------- |
| Electrónica | Dell |
| Electrónica | Logitech |
| Muebles | Ikea |
| Audio | Logitech |

Precauciones: La operación DISTINCT puede ser costosa en términos de rendimiento para tablas grandes, ya que requiere que el motor de la base de datos ordene y compare todas las filas para identificar y eliminar duplicados. Es importante asegurarse de que realmente se necesita eliminar duplicados, ya que en algunos casos, la duplicidad de datos es una parte intencional de la lógica de negocio, como múltiples pedidos realizados por el mismo cliente.

LIMIT/TOP/FETCH FIRST
Estos comandos se utilizan para restringir el número de filas devueltas por una consulta. LIMIT es comúnmente utilizado en MySQL y PostgreSQL, TOP en SQL Server, y FETCH FIRST es parte del estándar SQL.   

Ejemplo 1 (MySQL/PostgreSQL): Obtener los 3 productos más caros

SQL

SELECT nombre, precio FROM Productos ORDER BY precio DESC LIMIT 3;
Tabla Productos (Ejemplo de datos):
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 2 |
| 103 | Ratón Óptico | 25.00 | 0 |
| 105 | Webcam HD | 50.00 | 10 |
| 106 | Auriculares | 75.00 | 8 |
| 107 | Micrófono | 120.00 | 3 |
Tabla Resultante:
| nombre | precio |
| :------------ | :----- |
| Laptop Gaming | 1320.00 |
| Micrófono | 120.00 |
| Auriculares | 75.00 |

Ejemplo 2 (SQL Server): Obtener los 2 productos con menos stock

SQL

SELECT TOP 2 nombre, stock FROM Productos ORDER BY stock ASC;
Tabla Resultante:
| nombre | stock |
| :------------ | :---- |
| Ratón Óptico | 0 |
| Laptop Gaming | 2 |

Precauciones: Es fundamental utilizar siempre la cláusula ORDER BY junto con LIMIT, TOP o FETCH FIRST si el orden de los resultados es importante. Sin una cláusula ORDER BY, las filas devueltas pueden ser arbitrarias y no necesariamente las "primeras" o "últimas" según un criterio lógico. Para la paginación de resultados, estos comandos suelen combinarse con la cláusula OFFSET (ej. LIMIT 10 OFFSET 20).

Operadores Lógicos y de Comparación
Estos operadores se utilizan para combinar múltiples condiciones (AND, OR, NOT) o para comparar valores (=, !=, <, >, <=, >=, IN, BETWEEN, LIKE, IS NULL) en las cláusulas WHERE o HAVING.   

Ejemplo 1: Productos de electrónica con stock alto (>= 5)

SQL

SELECT nombre, categoria, stock FROM Productos_Categorias
WHERE categoria = 'Electrónica' AND stock >= 5;
Tabla Productos_Categorias (Ejemplo de datos):
| producto_id | nombre | categoria | stock | fabricante |
| :---------- | :------------ | :---------- | :---- | :--------- |
| 1 | Laptop | Electrónica | 8 | Dell |
| 2 | Teclado | Electrónica | 12 | Logitech |
| 3 | Silla | Muebles | 5 | Ikea |
| 4 | Mesa | Muebles | 3 | Ikea |
| 5 | Monitor | Electrónica | 10 | Dell |
| 6 | Auriculares | Audio | 7 | Logitech |
Tabla Resultante:
| nombre | categoria | stock |
| :------------ | :---------- | :---- |
| Laptop | Electrónica | 8 |
| Teclado | Electrónica | 12 |
| Monitor | Electrónica | 10 |

Ejemplo 2: Productos que no son de electrónica ni de muebles

SQL

SELECT nombre, categoria FROM Productos_Categorias
WHERE categoria NOT IN ('Electrónica', 'Muebles');
Tabla Resultante:
| nombre | categoria |
| :------------ | :---------- |
| Auriculares | Audio |

Precauciones: Es vital comprender la precedencia de los operadores (por ejemplo, AND se evalúa antes que OR). Se deben utilizar paréntesis para forzar el orden de evaluación deseado y evitar resultados inesperados. El uso de LIKE con un comodín (%) al principio de la cadena de búsqueda (ej. %patron) puede impedir que el motor de la base de datos utilice índices, lo que ralentiza la consulta. Además, es crucial recordar que los valores NULL se comportan de manera especial en las comparaciones (ver Sección 5).

GROUP BY Clause
La cláusula GROUP BY se utiliza para agrupar filas que comparten los mismos valores en columnas especificadas. Una vez agrupadas, se pueden aplicar funciones agregadas (como SUM, AVG, COUNT, MIN, MAX) a cada grupo, produciendo un único resultado por grupo.   

Ejemplo 1: Contar productos por categoría

SQL

SELECT categoria, COUNT(producto_id) AS total_productos
FROM Productos_Categorias
GROUP BY categoria;
Tabla Productos_Categorias (Ejemplo de datos):
| producto_id | nombre | categoria | stock | fabricante |
| :---------- | :------------ | :---------- | :---- | :--------- |
| 1 | Laptop | Electrónica | 8 | Dell |
| 2 | Teclado | Electrónica | 12 | Logitech |
| 3 | Silla | Muebles | 5 | Ikea |
| 4 | Mesa | Muebles | 3 | Ikea |
| 5 | Monitor | Electrónica | 10 | Dell |
| 6 | Auriculares | Audio | 7 | Logitech |
Tabla Resultante:
| categoria | total_productos |
| :---------- | :-------------- |
| Electrónica | 3 |
| Muebles | 2 |
| Audio | 1 |

Ejemplo 2: Suma de stock por fabricante

SQL

SELECT fabricante, SUM(stock) AS stock_total
FROM Productos_Categorias
GROUP BY fabricante;
Tabla Resultante:
| fabricante | stock_total |
| :--------- | :---------- |
| Dell | 18 |
| Logitech | 19 |
| Ikea | 8 |

Precauciones: Todas las columnas en la cláusula SELECT que no sean funciones agregadas deben estar incluidas en la cláusula GROUP BY. El orden de las columnas en GROUP BY no afecta el resultado final de la agregación, pero puede influir en el rendimiento de la consulta.

HAVING Clause
La cláusula HAVING se utiliza para filtrar grupos de filas que han sido creados por la cláusula GROUP BY, aplicando condiciones directamente a los resultados de las funciones agregadas. A diferencia de    

WHERE, que filtra filas individuales antes de agrupar, HAVING filtra los grupos después de que se han realizado las agregaciones.

Ejemplo 1: Categorías con más de 2 productos

SQL

SELECT categoria, COUNT(producto_id) AS total_productos
FROM Productos_Categorias
GROUP BY categoria
HAVING COUNT(producto_id) > 2;
Tabla Productos_Categorias (Ejemplo de datos):
| producto_id | nombre | categoria | stock | fabricante |
| :---------- | :------------ | :---------- | :---- | :--------- |
| 1 | Laptop | Electrónica | 8 | Dell |
| 2 | Teclado | Electrónica | 12 | Logitech |
| 3 | Silla | Muebles | 5 | Ikea |
| 4 | Mesa | Muebles | 3 | Ikea |
| 5 | Monitor | Electrónica | 10 | Dell |
| 6 | Auriculares | Audio | 7 | Logitech |
Tabla Resultante:
| categoria | total_productos |
| :---------- | :-------------- |
| Electrónica | 3 |

Ejemplo 2: Fabricantes con stock total superior a 15

SQL

SELECT fabricante, SUM(stock) AS stock_total
FROM Productos_Categorias
GROUP BY fabricante
HAVING SUM(stock) > 15;
Tabla Resultante:
| fabricante | stock_total |
| :--------- | :---------- |
| Dell | 18 |
| Logitech | 19 |

Precauciones: Es fundamental recordar que HAVING se aplica después de GROUP BY y las agregaciones, mientras que WHERE se aplica antes de GROUP BY. Por lo tanto, no se puede utilizar WHERE para filtrar directamente por los resultados de funciones agregadas; para ello, siempre se debe emplear HAVING.

JOINS
Los JOINS son operaciones fundamentales en SQL que permiten combinar filas de dos o más tablas basándose en una columna relacionada entre ellas. Son esenciales para trabajar con bases de datos relacionales.   

Tablas de Ejemplo para JOINS:

Tabla Empleados:
| empleado_id | nombre | departamento_id | supervisor_id |
| :---------- | :----- | :-------------- | :------------ |
| 1 | Ana | 101 | NULL |
| 2 | Luis | 102 | 1 |
| 3 | Marta | 101 | 1 |
| 4 | Pedro | NULL | 2 |
| 5 | Sofía | 103 | 1 |

Tabla Departamentos:
| departamento_id | nombre_departamento | ubicacion |
| :-------------- | :------------------ | :-------- |
| 101 | Ventas | Madrid |
| 102 | Marketing | Barcelona |
| 103 | IT | Valencia |
| 104 | RRHH | Sevilla |

INNER JOIN: Este tipo de unión devuelve únicamente las filas cuando existe una coincidencia de valores en la columna de unión en ambas tablas.   

Ejemplo 1: Empleados y sus departamentos

SQL

SELECT E.nombre, D.nombre_departamento
FROM Empleados E
INNER JOIN Departamentos D ON E.departamento_id = D.departamento_id;
Tabla Resultante:
| nombre | nombre_departamento |
| :----- | :------------------ |
| Ana | Ventas |
| Luis | Marketing |
| Marta | Ventas |
| Sofía | IT |

Ejemplo 2: Empleados en departamentos específicos (Ventas o Marketing)

SQL

SELECT E.nombre, D.nombre_departamento
FROM Empleados E
INNER JOIN Departamentos D ON E.departamento_id = D.departamento_id
WHERE D.nombre_departamento IN ('Ventas', 'Marketing');
Tabla Resultante:
| nombre | nombre_departamento |
| :----- | :------------------ |
| Ana | Ventas |
| Luis | Marketing |
| Marta | Ventas |

LEFT JOIN (o LEFT OUTER JOIN): Devuelve todas las filas de la tabla izquierda (la primera tabla en la cláusula FROM) y las filas coincidentes de la tabla derecha. Si no se encuentra una coincidencia en la tabla derecha, las columnas de la tabla derecha para esa fila se mostrarán como NULL.   

Ejemplo 1: Todos los empleados y sus departamentos (si tienen)

SQL

SELECT E.nombre, D.nombre_departamento
FROM Empleados E
LEFT JOIN Departamentos D ON E.departamento_id = D.departamento_id;
Tabla Resultante:
| nombre | nombre_departamento |
| :----- | :------------------ |
| Ana | Ventas |
| Luis | Marketing |
| Marta | Ventas |
| Pedro | NULL |
| Sofía | IT |

Ejemplo 2: Empleados sin departamento asignado

SQL

SELECT E.nombre
FROM Empleados E
LEFT JOIN Departamentos D ON E.departamento_id = D.departamento_id
WHERE D.departamento_id IS NULL;
Tabla Resultante:
| nombre |
| :----- |
| Pedro |

RIGHT JOIN (o RIGHT OUTER JOIN): Devuelve todas las filas de la tabla derecha y las filas coincidentes de la tabla izquierda. Si no se encuentra una coincidencia en la tabla izquierda, las columnas de la tabla izquierda para esa fila se mostrarán como NULL.   

Ejemplo 1: Todos los departamentos y sus empleados (si tienen)

SQL

SELECT D.nombre_departamento, E.nombre
FROM Empleados E
RIGHT JOIN Departamentos D ON E.departamento_id = D.departamento_id;
Tabla Resultante:
| nombre_departamento | nombre |
| :------------------ | :----- |
| Ventas | Ana |
| Ventas | Marta |
| Marketing | Luis |
| IT | Sofía |
| RRHH | NULL |

Ejemplo 2: Departamentos sin empleados asignados

SQL

SELECT D.nombre_departamento
FROM Empleados E
RIGHT JOIN Departamentos D ON E.departamento_id = D.departamento_id
WHERE E.empleado_id IS NULL;
Tabla Resultante:
| nombre_departamento |
| :------------------ |
| RRHH |

FULL OUTER JOIN: Este tipo de unión devuelve todas las filas cuando existe una coincidencia en cualquiera de las tablas. Si no hay coincidencia en una tabla, las columnas de esa tabla se mostrarán como NULL.   

Ejemplo 1: Todos los empleados y todos los departamentos

SQL

SELECT E.nombre, D.nombre_departamento
FROM Empleados E
FULL OUTER JOIN Departamentos D ON E.departamento_id = D.departamento_id;
Tabla Resultante:
| nombre | nombre_departamento |
| :----- | :------------------ |
| Ana | Ventas |
| Luis | Marketing |
| Marta | Ventas |
| Pedro | NULL |
| Sofía | IT |
| NULL | RRHH |

Ejemplo 2: Combinación completa con filtro para mostrar no coincidentes

SQL

SELECT E.nombre, D.nombre_departamento
FROM Empleados E
FULL OUTER JOIN Departamentos D ON E.departamento_id = D.departamento_id
WHERE E.empleado_id IS NULL OR D.departamento_id IS NULL;
Tabla Resultante:
| nombre | nombre_departamento |
| :----- | :------------------ |
| Pedro | NULL |
| NULL | RRHH |

CROSS JOIN: Devuelve el producto cartesiano de las dos tablas. Esto significa que cada fila de la primera tabla se combina con cada fila de la segunda tabla.   

Ejemplo 1: Combinar cada empleado con cada departamento (para planificación)

SQL

SELECT E.nombre, D.nombre_departamento
FROM Empleados E
CROSS JOIN Departamentos D;
Tabla Resultante (parcial):
| nombre | nombre_departamento |
| :----- | :------------------ |
| Ana | Ventas |
| Ana | Marketing |
| Ana | IT |
| Ana | RRHH |
| Luis | Ventas |
|... |... |

SELF JOIN: Una SELF JOIN implica unir una tabla consigo misma. Es particularmente útil para consultar datos jerárquicos o para comparar filas dentro de la misma tabla.   

Ejemplo 1: Encontrar empleados y sus supervisores

SQL

SELECT E.nombre AS Empleado, S.nombre AS Supervisor
FROM Empleados E
LEFT JOIN Empleados S ON E.supervisor_id = S.empleado_id;
Tabla Empleados (con supervisor_id):
| empleado_id | nombre | departamento_id | supervisor_id |
| :---------- | :----- | :-------------- | :------------ |
| 1 | Ana | 101 | NULL |
| 2 | Luis | 102 | 1 |
| 3 | Marta | 101 | 1 |
| 4 | Pedro | NULL | 2 |
| 5 | Sofía | 103 | 1 |
Tabla Resultante:
| Empleado | Supervisor |
| :------- | :--------- |
| Ana | NULL |
| Luis | Ana |
| Marta | Ana |
| Pedro | Luis |
| Sofía | Ana |

Precauciones (JOINS en general): Es fundamental asegurarse de que las condiciones de unión (ON) sean correctas para evitar resultados inesperados o productos cartesianos accidentales. Las operaciones JOIN en tablas grandes pueden ser costosas en términos de rendimiento; por lo tanto, es crucial que las columnas utilizadas en la condición de unión estén indexadas para acelerar la búsqueda. Una comprensión clara de las diferencias entre INNER, LEFT, RIGHT y FULL es necesaria para obtener el conjunto de datos deseado.

UNION
El operador UNION combina los conjuntos de resultados de dos o más sentencias SELECT en un único conjunto de resultados. Por defecto, UNION elimina las filas duplicadas. Si se desea incluir los duplicados, se debe utilizar UNION ALL.   

Tablas de Ejemplo para UNION:

Tabla Clientes_USA:
| cliente_id | nombre | pais |
| :--------- | :----- | :--- |
| 1 | John | USA |
| 2 | Jane | USA |

Tabla Clientes_Canada:
| cliente_id | nombre | pais |
| :--------- | :----- | :----- |
| 3 | Marc | Canada |
| 4 | Anne | Canada |
| 1 | John | USA |

Ejemplo 1: Combinar nombres de clientes de USA y Canadá (sin duplicados)

SQL

SELECT nombre FROM Clientes_USA
UNION
SELECT nombre FROM Clientes_Canada;
Tabla Resultante:
| nombre |
| :----- |
| John |
| Jane |
| Marc |
| Anne |

Ejemplo 2: Combinar nombres de clientes de USA y Canadá (con duplicados)

SQL

SELECT nombre FROM Clientes_USA
UNION ALL
SELECT nombre FROM Clientes_Canada;
Tabla Resultante:
| nombre |
| :----- |
| John |
| Jane |
| Marc |
| Anne |
| John |

Precauciones: Las sentencias SELECT que se combinan con UNION deben tener el mismo número de columnas y las columnas correspondientes deben tener tipos de datos compatibles. UNION ALL es generalmente más rápido que UNION porque no realiza la costosa operación de eliminación de duplicados; se debe utilizar si se sabe que no hay duplicados o si la inclusión de duplicados es aceptable para el resultado final.

Subconsultas (Subqueries)
Una subconsulta es una consulta SQL anidada dentro de otra consulta SQL, utilizada para devolver datos que serán empleados por la consulta principal.   

Ejemplo 1: Encontrar productos cuyo precio es mayor que el precio promedio

SQL

SELECT nombre, precio
FROM Productos
WHERE precio > (SELECT AVG(precio) FROM Productos);
Tabla Productos (Ejemplo de datos):
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 2 |
| 103 | Ratón Óptico | 25.00 | 0 |
| 105 | Webcam HD | 50.00 | 10 |
| 106 | Auriculares | 75.00 | 8 |
| 107 | Micrófono | 120.00 | 3 |
Promedio de precio: (1320+25+50+75+120)/5 = 318
Tabla Resultante:
| nombre | precio |
| :------------ | :----- |
| Laptop Gaming | 1320.00 |

Ejemplo 2: Clientes que han realizado pedidos (usando IN)

SQL

CREATE TABLE Clientes (cliente_id INT PRIMARY KEY, nombre_cliente VARCHAR(50));
CREATE TABLE Pedidos (pedido_id INT PRIMARY KEY, cliente_id INT, fecha_pedido DATE);
INSERT INTO Clientes VALUES (1, 'Carlos'), (2, 'Maria'), (3, 'Juan'), (4, 'Laura');
INSERT INTO Pedidos VALUES (101, 1, '2023-01-10'), (102, 1, '2023-01-15'), (103, 3, '2023-02-01'), (104, 1, '2023-02-05'), (105, 3, '2023-02-10');
SELECT nombre_cliente FROM Clientes
WHERE cliente_id IN (SELECT DISTINCT cliente_id FROM Pedidos);
Tabla Resultante:
| nombre_cliente |
| :------------- |
| Carlos |
| Juan |

Precauciones: Las subconsultas pueden ser menos legibles que las uniones (JOINs) para ciertas operaciones y pueden afectar el rendimiento si no están bien optimizadas, especialmente las subconsultas correlacionadas, que se reejecutan una vez por cada fila de la consulta externa. En casos complejos, se debe considerar el uso de JOINs o Common Table Expressions (CTEs) para mejorar la legibilidad y el rendimiento.

Las subconsultas ofrecen una gran flexibilidad para resolver problemas de consulta complejos, a menudo de formas que serían difíciles o imposibles con una sola consulta simple. Sin embargo, su uso excesivo o incorrecto, particularmente las subconsultas correlacionadas, puede llevar a un rendimiento deficiente porque la subconsulta se reevalúa para cada fila de la consulta externa. Esto genera una tensión entre la facilidad para expresar la lógica de la consulta y la eficiencia de su ejecución. La elección entre subconsultas,    

JOINs y CTEs (ver Sección 4) es una decisión de diseño de consulta que impacta significativamente el rendimiento y la mantenibilidad. Un profesional experimentado en SQL no solo comprende cómo utilizar una subconsulta, sino que también sabe cuándo es la herramienta más apropiada y cuándo debería considerar alternativas más optimizadas.

3.4. Lenguaje de Control de Datos (DCL)
Los comandos DCL son fundamentales para la seguridad de la base de datos, ya que se utilizan para gestionar los derechos, permisos y otros controles del sistema, regulando así el acceso a los datos.   

GRANT
El comando GRANT se utiliza para otorgar acceso o privilegios sobre objetos específicos de la base de datos a usuarios o roles.   

Tipos de Privilegios:

Privilegios de Sistema: Permiten al usuario realizar operaciones a nivel de sistema, como CREATE, ALTER o DROP objetos de la base de datos (ej., CREATE TABLE, CREATE ANY TABLE).   

Privilegios de Objeto: Permiten al usuario manipular datos dentro de objetos específicos, como EXECUTE procedimientos almacenados, SELECT datos de tablas o vistas, INSERT nuevas filas, UPDATE datos existentes o DELETE filas.   

Sintaxis: GRANT privilege_name ON object_name TO {user_name | PUBLIC | role_name};    

Ejemplo 1: Conceder permiso de lectura (SELECT) en la tabla Productos al usuario analista_ventas

SQL

GRANT SELECT ON Productos TO analista_ventas;
Tabla Resultante (Permisos de analista_ventas):
| Objeto | Permiso |
| :----- | :------ |
| Productos | SELECT |

Ejemplo 2: Conceder permisos de INSERT y UPDATE en la tabla Pedidos al usuario gestor_pedidos con opción de conceder a otros

SQL

GRANT INSERT, UPDATE ON Pedidos TO gestor_pedidos WITH GRANT OPTION;
Tabla Resultante (Permisos de gestor_pedidos):
| Objeto | Permiso | Conceder |
| :----- | :------ | :------- |
| Pedidos | INSERT | Sí |
| Pedidos | UPDATE | Sí |

Precauciones: Es fundamental adherirse al principio de menor privilegio, concediendo solo los permisos mínimos indispensables para que un usuario o aplicación cumpla su función. La opción    

WITH GRANT OPTION debe usarse con extrema cautela. Si un usuario recibe un permiso con esta opción, obtiene la capacidad de conceder ese mismo permiso a otros usuarios. Un aspecto crítico es que si el permiso original del usuario es revocado, los permisos que este usuario concedió a otros no se revocan automáticamente. Esta situación puede generar una cadena de permisos no deseada y difícil de rastrear, lo que representa un riesgo de seguridad significativo. Por ello, se recomienda encarecidamente la utilización de    

roles para agrupar privilegios y asignarlos a usuarios, simplificando así la gestión de permisos, especialmente en bases de datos con un gran número de usuarios.   

La característica WITH GRANT OPTION crea un desafío en la propagación de permisos. Permite a un usuario conceder permisos a otros, y la revocación del permiso original no anula los permisos subsiguientes. Esto establece una "cadena de confianza" donde un permiso otorgado por un usuario intermedio puede persistir incluso si el permiso original de ese usuario es revocado. Esta propagación incontrolada de permisos puede conducir a vulnerabilidades de seguridad significativas, permitiendo que usuarios no autorizados accedan a datos sensibles a través de una secuencia de permisos que, aunque legítimos en su origen, han sido gestionados de forma deficiente. Esto representa un desafío considerable para la auditoría y la gestión de acceso. La gestión de permisos en bases de datos es un componente crítico de la seguridad. El principio de menor privilegio  debe aplicarse rigurosamente, y la opción    

WITH GRANT OPTION debe ser utilizada exclusivamente por administradores de bases de datos con un entendimiento completo de sus implicaciones. Esto subraya la necesidad de auditorías de seguridad regulares para identificar y corregir permisos excesivos o no intencionados.

REVOKE
El comando REVOKE se utiliza para eliminar derechos de acceso o privilegios que fueron previamente concedidos a un usuario o rol sobre objetos de la base de datos.   

Sintaxis: REVOKE privilege_name ON object_name FROM {user_name | PUBLIC | role_name};    

Ejemplo 1: Revocar permiso de escritura (INSERT) en la tabla Pedidos al usuario gestor_pedidos

SQL

REVOKE INSERT ON Pedidos FROM gestor_pedidos;
Tabla Resultante (Permisos de gestor_pedidos):
| Objeto | Permiso | Conceder |
| :----- | :------ | :------- |
| Pedidos | UPDATE | Sí |

Ejemplo 2: Revocar permiso de lectura (SELECT) en la tabla Productos del usuario analista_ventas

SQL

REVOKE SELECT ON Productos FROM analista_ventas;
Tabla Resultante (Permisos de analista_ventas):
| Objeto | Permiso |
| :----- | :------ |
| Productos | (Ninguno) |

Precauciones: No es posible revocar privilegios que no fueron concedidos inicialmente por el usuario que ejecuta el comando REVOKE. Si un usuario ha recibido el mismo privilegio de múltiples fuentes, el privilegio solo se eliminará cuando todas esas fuentes lo revoquen. Además, se debe considerar el efecto de la cláusula    

CASCADE si está disponible en el sistema de gestión de bases de datos, ya que esta opción revoca automáticamente los permisos que fueron concedidos por el usuario al que se le está revocando el permiso, lo cual puede tener un impacto en cascada en otros usuarios.

3.5. Lenguaje de Control de Transacciones (TCL)
Los comandos TCL son esenciales para la gestión de transacciones dentro de una base de datos, garantizando las propiedades ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad). Las sentencias DML (   

INSERT, UPDATE, DELETE) se almacenan temporalmente en un búfer SQL hasta que se ejecuta un comando de transacción, lo que permite agrupar múltiples operaciones en una única unidad lógica de trabajo.   

BEGIN TRANSACTION
El comando BEGIN TRANSACTION inicia una nueva transacción. Todas las operaciones DML realizadas después de este comando y antes de un COMMIT o ROLLBACK se consideran parte de la misma unidad lógica de trabajo.   

Ejemplo 1: Iniciar una transacción para una serie de actualizaciones

SQL

BEGIN TRANSACTION;
-- Operaciones DML aquí
Ejemplo 2: Iniciar una transacción para una transferencia de fondos

SQL

BEGIN TRANSACTION;
-- Restar de una cuenta
-- Sumar a otra cuenta
Precauciones: Es recomendable mantener las transacciones lo más cortas posible para minimizar los bloqueos de recursos y mejorar la concurrencia de la base de datos. Se debe evitar realizar operaciones de larga duración, como grandes consultas SELECT o comandos ALTER TABLE, dentro de una transacción activa, ya que estas pueden mantener bloqueos innecesarios por periodos prolongados, afectando el rendimiento de otras operaciones.

COMMIT
El comando COMMIT guarda permanentemente todos los cambios realizados durante la transacción actual en la base de datos. Una vez que una transacción ha sido confirmada, los cambios son definitivos y no pueden ser deshechos mediante un ROLLBACK.   

Ejemplo 1: Confirmar una actualización de estado de envío

SQL

BEGIN TRANSACTION;
UPDATE Envios SET estado = 'Enviado' WHERE envio_id = 1;
COMMIT;
Tabla Envios antes de COMMIT:
| envio_id | estado |
| :------- | :----- |
| 1 | Pendiente |
| 2 | Procesando |
Tabla Envios después de COMMIT:
| envio_id | estado |
| :------- | :----- |
| 1 | Enviado |
| 2 | Procesando |

Ejemplo 2: Confirmar una transferencia de fondos exitosa

SQL

BEGIN TRANSACTION;
UPDATE Cuentas SET saldo = saldo - 100 WHERE cuenta_id = 'A1';
UPDATE Cuentas SET saldo = saldo + 100 WHERE cuenta_id = 'B2';
COMMIT;
Tabla Cuentas antes de COMMIT:
| cuenta_id | saldo |
| :-------- | :---- |
| A1 | 500 |
| B2 | 200 |
Tabla Cuentas después de COMMIT:
| cuenta_id | saldo |
| :-------- | :---- |
| A1 | 400 |
| B2 | 300 |

Precauciones: Es crucial asegurarse de que todas las operaciones dentro de la transacción se hayan completado con éxito y que los datos se encuentren en un estado consistente antes de ejecutar COMMIT. Una vez que la transacción es confirmada, los cambios son permanentes y no hay forma de revertirlos directamente a través de comandos SQL sin una copia de seguridad.

ROLLBACK
El comando ROLLBACK deshace todas las modificaciones realizadas durante la transacción actual que no han sido confirmadas, revirtiendo la base de datos a su estado anterior al inicio de la transacción o al último SAVEPOINT.   

Ejemplo 1: Deshacer una eliminación accidental

SQL

BEGIN TRANSACTION;
DELETE FROM Pedidos WHERE pedido_id = 5;
-- Oops, me equivoqué, no era ese pedido
ROLLBACK;
Tabla Pedidos antes de ROLLBACK:
| pedido_id | cliente_id | fecha_pedido |
| :-------- | :--------- | :----------- |
| 1 | 1 | 2023-01-10 |
| 2 | 1 | 2023-01-15 |
| 3 | 3 | 2023-02-01 |
| 4 | 1 | 2023-02-05 |
| 5 | 3 | 2023-02-10 |
Tabla Pedidos después de DELETE (pero antes de ROLLBACK):
| pedido_id | cliente_id | fecha_pedido |
| :-------- | :--------- | :----------- |
| 1 | 1 | 2023-01-10 |
| 2 | 1 | 2023-01-15 |
| 3 | 3 | 2023-02-01 |
| 4 | 1 | 2023-02-05 |
Tabla Pedidos después de ROLLBACK:
| pedido_id | cliente_id | fecha_pedido |
| :-------- | :--------- | :----------- |
| 1 | 1 | 2023-01-10 |
| 2 | 1 | 2023-01-15 |
| 3 | 3 | 2023-02-01 |
| 4 | 1 | 2023-02-05 |
| 5 | 3 | 2023-02-10 |

Ejemplo 2: Revertir una transferencia de fondos fallida

SQL

BEGIN TRANSACTION;
UPDATE Cuentas SET saldo = saldo - 100 WHERE cuenta_id = 'A1';
-- Simular un fallo al actualizar la segunda cuenta
-- UPDATE Cuentas SET saldo = saldo + 100 WHERE cuenta_id = 'INVALID_B2';
ROLLBACK;
Tabla Cuentas antes de ROLLBACK:
| cuenta_id | saldo |
| :-------- | :---- |
| A1 | 500 |
| B2 | 200 |
Tabla Cuentas después de ROLLBACK:
| cuenta_id | saldo |
| :-------- | :---- |
| A1 | 500 |
| B2 | 200 |

Precauciones: ROLLBACK solo afecta a las operaciones DML realizadas dentro de la transacción actual. No deshace comandos DDL (CREATE, ALTER, DROP, TRUNCATE), ya que estos se confirman implícitamente. Se debe utilizar para manejar errores o para deshacer cambios no deseados antes de que se confirmen permanentemente.

SAVEPOINT
El comando SAVEPOINT permite establecer un punto dentro de una transacción al que se puede revertir (ROLLBACK TO SAVEPOINT) sin afectar la totalidad de la transacción. Esto resulta particularmente útil para gestionar transacciones largas o complejas, permitiendo la reversión parcial de cambios.   

Sintaxis: SAVEPOINT savepoint_name;    

Ejemplo 1: Actualizaciones con puntos de guardado

SQL

BEGIN TRANSACTION;
UPDATE Clientes SET edad = 32 WHERE cliente_id = 1;
SAVEPOINT SP1;
UPDATE Clientes SET pais = 'Canadá' WHERE cliente_id = 2;
SAVEPOINT SP2;
-- Si ocurre un error aquí, podemos hacer ROLLBACK TO SP1;
-- ROLLBACK TO SP1;
-- COMMIT; -- O COMMIT si todo está bien
Tabla Clientes (Ejemplo de datos):
| cliente_id | nombre | edad | pais |
| :--------- | :----- | :--- | :--- |
| 1 | Ana | 30 | España |
| 2 | Juan | 28 | México |
Tabla Clientes después de UPDATE edad (y SAVEPOINT SP1):
| cliente_id | nombre | edad | pais |
| :--------- | :----- | :--- | :--- |
| 1 | Ana | 32 | España |
| 2 | Juan | 28 | México |
Tabla Clientes después de UPDATE pais (y SAVEPOINT SP2):
| cliente_id | nombre | edad | pais |
| :--------- | :----- | :--- | :--- |
| 1 | Ana | 32 | España |
| 2 | Juan | 28 | Canadá |

Ejemplo 2: Operaciones condicionales con SAVEPOINT

SQL

BEGIN TRANSACTION;
INSERT INTO LogActividad VALUES (1, 'Inicio de proceso');
SAVEPOINT log_inicio;
-- Intento de operación 1
UPDATE Configuracion SET valor = 'nuevo_valor' WHERE clave = 'clave_1';
-- Si la operación 1 falla, puedo revertir solo hasta log_inicio
-- ROLLBACK TO SAVEPOINT log_inicio;
-- COMMIT;
Tabla LogActividad (Ejemplo de datos):
| id | mensaje |
| :-- | :------ |
| 1 | Inicio de proceso |

Precauciones: Los SAVEPOINTs son útiles para la gestión de errores y la reversión parcial, pero no deben abusarse de ellos, ya que pueden consumir recursos y complicar la lógica de las transacciones. Es importante recordar que un ROLLBACK completo deshará todos los cambios, incluso los realizados antes de cualquier SAVEPOINT.

4. Funciones Avanzadas de SQL
SQL ofrece una amplia gama de funciones avanzadas que permiten realizar cálculos complejos, manipular cadenas de texto, trabajar con fechas y horas, y analizar datos de maneras sofisticadas. Estas funciones son cruciales para el análisis de datos y la gestión de bases de datos, ya que permiten la transformación y agregación de datos más allá de las operaciones básicas.   

Funciones de Cadena
Las funciones de cadena en MySQL son esenciales para manipular y formatear datos textuales.   

CONCAT(): Concatena dos o más cadenas de texto.   

Ejemplo 1: SELECT CONCAT('Hola', ' ', 'Mundo') AS Saludo;
Tabla Resultante:
| Saludo |
| :----- |
| Hola Mundo |

Ejemplo 2: SELECT CONCAT('Producto: ', nombre) FROM Productos WHERE producto_id = 101;
Tabla Productos (Ejemplo de datos):
| producto_id | nombre |
| :---------- | :------------ |
| 101 | Laptop Gaming |
| 103 | Ratón Óptico |
| 105 | Webcam HD |
Tabla Resultante:
| CONCAT('Producto: ', nombre) |
| :--------------------------- |
| Producto: Laptop Gaming |

LENGTH() / CHARACTER_LENGTH(): Devuelve la longitud de una cadena en bytes o caracteres, respectivamente.   

Ejemplo 1: SELECT LENGTH('SQL Guía') AS LongitudBytes;
Tabla Resultante:
| LongitudBytes |
| :------------ |
| 8 |

Ejemplo 2: SELECT CHARACTER_LENGTH('SQL Guía') AS LongitudCaracteres;
Tabla Resultante:
| LongitudCaracteres |
| :----------------- |
| 8 |

SUBSTRING() / MID(): Extrae una subcadena de una cadena, a partir de una posición y con una longitud específica.   

Ejemplo 1: SELECT SUBSTRING('BaseDeDatos', 5, 2) AS Subcadena;
Tabla Resultante:
| Subcadena |
| :-------- |
| De |

Ejemplo 2: SELECT MID('Programacion', 7, 3) AS Subcadena2;
Tabla Resultante:
| Subcadena2 |
| :--------- |
| mac |

UPPER() / LOWER(): Convierte una cadena a mayúsculas o minúsculas, respectivamente.   

Ejemplo 1: SELECT UPPER('sql avanzado') AS Mayusculas;
Tabla Resultante:
| Mayusculas |
| :--------- |
| SQL AVANZADO |

Ejemplo 2: SELECT LOWER('SQL AVANZADO') AS Minusculas;
Tabla Resultante:
| Minusculas |
| :--------- |
| sql avanzado |

REPLACE(): Reemplaza todas las ocurrencias de una subcadena por otra dentro de una cadena.   

Ejemplo 1: SELECT REPLACE('Hola Mundo', 'Mundo', 'SQL') AS Reemplazado;
Tabla Resultante:
| Reemplazado |
| :---------- |
| Hola SQL |

Ejemplo 2: SELECT REPLACE(nombre, 'Laptop', 'Notebook') FROM Productos WHERE producto_id = 101;
Tabla Productos (Ejemplo de datos):
| producto_id | nombre |
| :---------- | :------------ |
| 101 | Laptop Gaming |
Tabla Resultante:
| REPLACE(nombre, 'Laptop', 'Notebook') |
| :------------------------------------ |
| Notebook Gaming |

Funciones Numéricas
Las funciones numéricas en MySQL permiten realizar cálculos matemáticos y operaciones aritméticas sobre valores numéricos.   

ABS(): Devuelve el valor absoluto de un número (convierte negativos a positivos).   

Ejemplo 1: SELECT ABS(-15) AS ValorAbsoluto;
Tabla Resultante:
| ValorAbsoluto |
| :------------ |
| 15 |

Ejemplo 2: SELECT ABS(10) AS ValorAbsoluto2;
Tabla Resultante:
| ValorAbsoluto2 |
| :------------- |
| 10 |

ROUND(): Redondea un número a un número especificado de decimales.   

Ejemplo 1: SELECT ROUND(15.6789, 2) AS Redondeado;
Tabla Resultante:
| Redondeado |
| :--------- |
| 15.68 |

Ejemplo 2: SELECT ROUND(123.456) AS RedondeadoEntero;
Tabla Resultante:
| RedondeadoEntero |
| :--------------- |
| 123 |

CEILING() / CEIL(): Redondea un número hacia arriba al entero más cercano.   

Ejemplo 1: SELECT CEILING(12.34) AS RedondeoArriba;
Tabla Resultante:
| RedondeoArriba |
| :------------- |
| 13 |

Ejemplo 2: SELECT CEIL(12.98) AS RedondeoArriba2;
Tabla Resultante:
| RedondeoArriba2 |
| :-------------- |
| 13 |

FLOOR(): Redondea un número hacia abajo al entero más cercano.   

Ejemplo 1: SELECT FLOOR(12.98) AS RedondeoAbajo;
Tabla Resultante:
| RedondeoAbajo |
| :------------ |
| 12 |

Ejemplo 2: SELECT FLOOR(12.01) AS RedondeoAbajo2;
Tabla Resultante:
| RedondeoAbajo2 |
| :------------- |
| 12 |

POWER(): Eleva un número base a la potencia de un exponente.   

Ejemplo 1: SELECT POWER(2, 3) AS Potencia;
Tabla Resultante:
| Potencia |
| :------- |
| 8 |

Ejemplo 2: SELECT POWER(5, 2) AS Potencia2;
Tabla Resultante:
| Potencia2 |
| :-------- |
| 25 |

SQRT(): Calcula la raíz cuadrada de un número.   

Ejemplo 1: SELECT SQRT(16) AS RaizCuadrada;
Tabla Resultante:
| RaizCuadrada |
| :----------- |
| 4 |

Ejemplo 2: SELECT SQRT(25) AS RaizCuadrada2;
Tabla Resultante:
| RaizCuadrada2 |
| :------------ |
| 5 |

Funciones de Fecha y Hora
Las funciones de fecha y hora en MySQL son herramientas esenciales para manipular y consultar datos temporales de manera efectiva.   

NOW(): Devuelve la fecha y hora actuales del sistema.   

Ejemplo 1: SELECT NOW() AS FechaHoraActual;
Tabla Resultante:
| FechaHoraActual |
| :-------------- |
| 2024-07-20 10:30:00 |

Ejemplo 2: SELECT NOW() + INTERVAL 1 HOUR AS HoraFutura;
Tabla Resultante:
| HoraFutura |
| :--------- |
| 2024-07-20 11:30:00 |

CURDATE(): Devuelve solo la fecha actual.   

Ejemplo 1: SELECT CURDATE() AS FechaActual;
Tabla Resultante:
| FechaActual |
| :---------- |
| 2024-07-20 |

Ejemplo 2: SELECT CURDATE() - INTERVAL 1 DAY AS FechaAyer;
Tabla Resultante:
| FechaAyer |
| :-------- |
| 2024-07-19 |

DATE(): Extrae solo la parte de la fecha de un valor DATETIME o TIMESTAMP.   

Ejemplo 1: SELECT DATE('2023-01-15 14:30:00') AS SoloFecha;
Tabla Resultante:
| SoloFecha |
| :-------- |
| 2023-01-15 |

Ejemplo 2: SELECT DATE(fecha_pedido) FROM Pedidos WHERE pedido_id = 101;
Tabla Pedidos (Ejemplo de datos):
| pedido_id | cliente_id | fecha_pedido |
| :-------- | :--------- | :----------- |
| 101 | 1 | 2023-01-10 |
Tabla Resultante:
| DATE(fecha_pedido) |
| :----------------- |
| 2023-01-10 |

YEAR() / MONTH() / DAY(): Extraen el año, mes o día de un valor de fecha o fecha/hora.   

Ejemplo 1: SELECT YEAR('2023-01-15') AS Año;
Tabla Resultante:
| Año |
| :-- |
| 2023 |

Ejemplo 2: SELECT MONTH('2023-01-15') AS Mes;
Tabla Resultante:
| Mes |
| :-- |
| 1 |

DATE_ADD(): Permite añadir intervalos de tiempo (días, meses, años, horas, etc.) a un valor de fecha o DATETIME.   

Ejemplo 1: SELECT DATE_ADD('2023-01-01', INTERVAL 1 MONTH) AS FechaFutura;
Tabla Resultante:
| FechaFutura |
| :---------- |
| 2023-02-01 |

Ejemplo 2: SELECT DATE_ADD(CURDATE(), INTERVAL 7 DAY) AS SemanaProxima;
Tabla Resultante:
| SemanaProxima |
| :------------ |
| 2024-07-27 |

DATEDIFF(): Calcula la diferencia en días entre dos fechas.   

Ejemplo 1: SELECT DATEDIFF('2023-01-31', '2023-01-01') AS DiasDiferencia;
Tabla Resultante:
| DiasDiferencia |
| :------------- |
| 30 |

Ejemplo 2: SELECT DATEDIFF(CURDATE(), '2024-07-01') AS DiasDesdeInicioMes;
Tabla Resultante:
| DiasDesdeInicioMes |
| :----------------- |
| 19 |

Funciones Agregadas
Las funciones agregadas resumen datos realizando cálculos sobre grupos de valores y devolviendo un único resultado. Se utilizan frecuentemente con la cláusula GROUP BY para categorizar y analizar datos desde una perspectiva más amplia.   

SUM(): Calcula la suma de los valores en una columna.   

Ejemplo 1: SELECT SUM(precio) AS PrecioTotal FROM Productos;
Tabla Productos (Ejemplo de datos):
| producto_id | nombre | precio | stock |
| :---------- | :------------ | :----- | :---- |
| 101 | Laptop Gaming | 1320.00 | 2 |
| 103 | Ratón Óptico | 25.00 | 0 |
| 105 | Webcam HD | 50.00 | 10 |
| 106 | Auriculares | 75.00 | 8 |
| 107 | Micrófono | 120.00 | 3 |
Tabla Resultante:
| PrecioTotal |
| :---------- |
| 1590.00 |

Ejemplo 2: SELECT categoria, SUM(stock) AS StockPorCategoria FROM Productos_Categorias GROUP BY categoria;
Tabla Productos_Categorias (Ejemplo de datos):
| producto_id | nombre | categoria | stock |
| :---------- | :------------ | :---------- | :---- |
| 1 | Laptop | Electrónica | 8 |
| 2 | Teclado | Electrónica | 12 |
| 3 | Silla | Muebles | 5 |
| 4 | Mesa | Muebles | 3 |
| 5 | Monitor | Electrónica | 10 |
Tabla Resultante:
| categoria | StockPorCategoria |
| :---------- | :---------------- |
| Electrónica | 30 |
| Muebles | 8 |

AVG(): Calcula el promedio de los valores en una columna.   

Ejemplo 1: SELECT AVG(precio) AS PrecioPromedio FROM Productos;
Tabla Resultante:
| PrecioPromedio |
| :------------- |
| 318.00 |

Ejemplo 2: SELECT fabricante, AVG(stock) AS PromedioStockPorFabricante FROM Productos_Categorias GROUP BY fabricante;
Tabla Productos_Categorias (Ejemplo de datos):
| producto_id | nombre | categoria | stock | fabricante |
| :---------- | :------------ | :---------- | :---- | :--------- |
| 1 | Laptop | Electrónica | 8 | Dell |
| 2 | Teclado | Electrónica | 12 | Logitech |
| 3 | Silla | Muebles | 5 | Ikea |
| 4 | Mesa | Muebles | 3 | Ikea |
| 5 | Monitor | Electrónica | 10 | Dell |
| 6 | Auriculares | Audio | 7 | Logitech |
Tabla Resultante:
| fabricante | PromedioStockPorFabricante |
| :--------- | :------------------------- |
| Dell | 9.00 |
| Logitech | 9.50 |
| Ikea | 4.00 |

COUNT(): Devuelve el número de filas o de valores no nulos en una columna.   

Ejemplo 1: SELECT COUNT(producto_id) AS TotalProductos FROM Productos;
Tabla Resultante:
| TotalProductos |
| :------------- |
| 5 |

Ejemplo 2: SELECT COUNT(DISTINCT categoria) AS TotalCategoriasUnicas FROM Productos_Categorias;
Tabla Resultante:
| TotalCategoriasUnicas |
| :-------------------- |
| 3 |

MIN(): Encuentra el valor mínimo en una columna.   

Ejemplo 1: SELECT MIN(precio) AS PrecioMinimo FROM Productos;
Tabla Resultante:
| PrecioMinimo |
| :----------- |
| 25.00 |

Ejemplo 2: SELECT categoria, MIN(stock) AS MinStockPorCategoria FROM Productos_Categorias GROUP BY categoria;
Tabla Resultante:
| categoria | MinStockPorCategoria |
| :---------- | :------------------- |
| Electrónica | 8 |
| Muebles | 3 |
| Audio | 7 |

MAX(): Recupera el valor máximo en una columna.   

Ejemplo 1: SELECT MAX(precio) AS PrecioMaximo FROM Productos;
Tabla Resultante:
| PrecioMaximo |
| :----------- |
| 1320.00 |

Ejemplo 2: SELECT categoria, MAX(stock) AS MaxStockPorCategoria FROM Productos_Categorias GROUP BY categoria;
Tabla Resultante:
| categoria | MaxStockPorCategoria |
| :---------- | :------------------- |
| Electrónica | 12 |
| Muebles | 5 |
| Audio | 7 |

Funciones de Ventana (Window Functions)
Las funciones de ventana permiten realizar cálculos sobre un conjunto específico de filas relacionadas con la fila actual (una "ventana"), sin colapsar las filas individuales del conjunto de datos. A diferencia de las funciones agregadas tradicionales que resumen datos para un grupo completo, las funciones de ventana permiten cálculos detallados para particiones o subconjuntos de datos. La cláusula    

OVER es fundamental para definir esta ventana, permitiendo particionar los datos (PARTITION BY) y ordenarlos (ORDER BY).   

Sintaxis:

SQL

SELECT column_name1,
 window_function(column_name2)
 OVER() AS new_column
FROM table_name;
window_function: Cualquier función agregada o de clasificación.

column_name1: Columna a seleccionar.

column_name2: Columna sobre la que se aplica la función de ventana.

column_name3: Columna en la que se basa la partición de filas.

new_column: Nombre de la nueva columna resultante.   

Funciones Agregadas como Funciones de Ventana: Las funciones agregadas (SUM, AVG, COUNT, MAX, MIN) pueden utilizarse como funciones de ventana para calcular agregados sobre una ventana de filas manteniendo las filas individuales.   

Ejemplo: Calcular el salario promedio dentro de cada departamento

SQL

SELECT Name, Age, Department, Salary,
 AVG(Salary) OVER( PARTITION BY Department) AS Avg_Salary
 FROM employee;
Tabla employee (Ejemplo de datos):
| Name | Age | Department | Salary |
| :---- | :-- | :--------- | :----- |
| Ramesh | 25 | Finance | 50000 |
| Suresh | 28 | Finance | 50000 |
| Ram | 30 | Finance | 20000 |
| Deep | 26 | Sales | 30000 |
| Pradeep | 29 | Sales | 20000 |
Tabla Resultante:
| Name | Age | Department | Salary | Avg_Salary |
| :---- | :-- | :--------- | :----- | :---------- |
| Ramesh | 25 | Finance | 50000 | 40000 |
| Suresh | 28 | Finance | 50000 | 40000 |
| Ram | 30 | Finance | 20000 | 40000 |
| Deep | 26 | Sales | 30000 | 25000 |
| Pradeep | 29 | Sales | 20000 | 25000 |
La función AVG() calcula el salario promedio para cada departamento utilizando la cláusula PARTITION BY Department. El salario promedio se repite para todas las filas dentro de su respectivo departamento.   

Funciones de Clasificación (Ranking Window Functions): Estas funciones asignan clasificaciones a las filas dentro de una partición basándose en criterios específicos.   

ROW_NUMBER(): Asigna un número único y secuencial a cada fila dentro de cada partición (grupo) definida por la cláusula PARTITION BY. No hay dos filas que tengan el mismo número en una partición.   

Ejemplo: Asignar números de fila únicos a empleados por departamento

SQL

SELECT Name, Department, Salary,
 ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Salary DESC) AS emp_row_no
FROM employee;
Tabla employee (Ejemplo de datos):
| Name | Department | Salary |
| :---- | :--------- | :----- |
| Ramesh | Finance | 50000 |
| Suresh | Finance | 50000 |
| Ram | Finance | 20000 |
| Deep | Sales | 30000 |
| Pradeep | Sales | 20000 |
Tabla Resultante:
| Name | Department | Salary | emp_row_no |
| :---- | :--------- | :----- | :---------- |
| Ramesh | Finance | 50000 | 1 |
| Suresh | Finance | 50000 | 2 |
| Ram | Finance | 20000 | 3 |
| Deep | Sales | 30000 | 1 |
| Pradeep | Sales | 20000 | 2 |
ROW_NUMBER() asigna un número único a cada empleado basándose en su salario dentro de su departamento.

RANK(): Asigna una clasificación a las filas dentro de una partición. Si dos o más filas tienen valores idénticos en la columna de ordenación, se les asigna la misma clasificación, y la siguiente clasificación disponible se salta.   

Ejemplo: Clasificar empleados por salario, saltando rangos para duplicados

SQL

SELECT Name, Department, Salary,
 RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS emp_rank
FROM employee;
Tabla Resultante:
| Name | Department | Salary | emp_rank |
| :---- | :--------- | :----- | :-------- |
| Ramesh | Finance | 50000 | 1 |
| Suresh | Finance | 50000 | 1 |
| Ram | Finance | 20000 | 3 |
| Deep | Sales | 30000 | 1 |
| Pradeep | Sales | 20000 | 2 |
Las filas con el mismo salario (ej., Ramesh y Suresh) reciben la misma clasificación. La siguiente clasificación (rango 2) se salta debido a los rangos duplicados.   

DENSE_RANK(): Similar a RANK(), pero asigna clasificaciones consecutivas sin saltar números de clasificación para valores duplicados.   

Ejemplo: Clasificar empleados por salario, sin saltar rangos para duplicados

SQL

SELECT Name, Department, Salary,
 DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS emp_dense_rank
FROM employee;
Tabla Resultante:
| Name | Department | Salary | emp_dense_rank |
| :---- | :--------- | :----- | :--------------- |
| Ramesh | Finance | 50000 | 1 |
| Suresh | Finance | 50000 | 1 |
| Ram | Finance | 20000 | 2 |
| Deep | Sales | 30000 | 1 |
| Pradeep | Sales | 20000 | 2 |
Si dos empleados tienen el mismo salario, ambos recibirán la clasificación 1, y el siguiente empleado recibirá la clasificación 2, sin saltos.   

LEAD() y LAG(): Estas funciones permiten acceder a filas anteriores (LAG) o posteriores (LEAD) dentro de la misma partición, lo que es útil para comparar valores entre filas consecutivas, como calcular la diferencia de ventas entre días o el crecimiento de un valor a lo largo del tiempo.

Ejemplo 1: Calcular la venta del día anterior (LAG)

SQL

CREATE TABLE sales_data (
    Date DATE PRIMARY KEY,
    Sales INT
);
INSERT INTO sales_data VALUES
('2023-01-01', 100),
('2023-01-02', 150),
('2023-01-03', 200),
('2023-01-04', 120),
('2023-01-05', 180);
SELECT Date, Sales,
       LAG(Sales, 1, 0) OVER (ORDER BY Date) AS PreviousDaySales
FROM sales_data;
Tabla Resultante:
| Date | Sales | PreviousDaySales |
| :--------- | :---- | :--------------- |
| 2023-01-01 | 100 | 0 |
| 2023-01-02 | 150 | 100 |
| 2023-01-03 | 200 | 150 |
| 2023-01-04 | 120 | 200 |
| 2023-01-05 | 180 | 120 |

Ejemplo 2: Calcular la venta del día siguiente (LEAD)

SQL

SELECT Date, Sales,
       LEAD(Sales, 1, 0) OVER (ORDER BY Date) AS NextDaySales
FROM sales_data;
Tabla Resultante:
| Date | Sales | NextDaySales |
| :--------- | :---- | :----------- |
| 2023-01-01 | 100 | 150 |
| 2023-01-02 | 150 | 200 |
| 2023-01-03 | 200 | 120 |
| 2023-01-04 | 120 | 180 |
| 2023-01-05 | 180 | 0 |

Common Table Expressions (CTEs)
Una Common Table Expression (CTE) en SQL es un conjunto de resultados temporal y nombrado que puede ser referenciado dentro de una sentencia SELECT, INSERT, UPDATE o DELETE. Las CTEs se definen utilizando la palabra clave    

WITH y permiten crear una subconsulta reutilizable dentro de una sentencia SQL, lo que mejora la legibilidad y simplifica consultas complejas.

Cuándo usar CTEs: Se utilizan CTEs cuando se desea :   

Simplificar consultas complejas: Dividir una sentencia SQL compleja en partes más pequeñas y manejables para mejorar la legibilidad y mantenibilidad.

Evitar la duplicación de subconsultas: Reutilizar un conjunto de resultados en múltiples partes de una consulta sin tener que reescribir la misma subconsulta varias veces.

Crear consultas recursivas: Son esenciales para realizar operaciones recursivas, como la navegación de estructuras de datos jerárquicas.

Mejorar la organización de consultas: Organizar las sentencias SQL separando secciones lógicas, facilitando la comprensión y depuración.

Sintaxis: La sintaxis para definir una CTE utilizando la cláusula WITH es la siguiente :   

SQL

WITH cte_name (column1, column2,...) AS (
    SELECT...
    FROM...
    WHERE...
)
-- Sentencia SQL que utiliza la CTE
SELECT... FROM cte_name...;
cte_name: Nombre definido por el usuario para la CTE, único dentro de la sentencia SQL.

(column1, column2,...): Lista opcional de nombres de columna para la CTE.

SELECT... FROM... WHERE...: La consulta que define el conjunto de resultados de la CTE.

Ejemplo 1: Encontrar empleados y sus supervisores (jerarquía)

SQL

WITH Supervisores AS (
    SELECT e.empleado_id, e.nombre AS nombre_empleado, s.nombre AS nombre_supervisor
    FROM Empleados e
    LEFT JOIN Empleados s ON e.supervisor_id = s.empleado_id
)
SELECT empleado_id, nombre_empleado, nombre_supervisor
FROM Supervisores;
Tabla Empleados (Ejemplo de datos):
| empleado_id | nombre | departamento_id | supervisor_id |
| :---------- | :----- | :-------------- | :------------ |
| 1 | Ana | 101 | NULL |
| 2 | Luis | 102 | 1 |
| 3 | Marta | 101 | 1 |
| 4 | Pedro | NULL | 2 |
| 5 | Sofía | 103 | 1 |
Tabla Resultante:
| empleado_id | nombre_empleado | nombre_supervisor |
| :---------- | :-------------- | :---------------- |
| 1 | Ana |
