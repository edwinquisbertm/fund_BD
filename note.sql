CREATE TABLE clients (
    client_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE if not exists products (
    product_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE if not exists bills (
    bill_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    client_id INTEGER NOT NULL,
    total FLOAT,
    status ENUM('open', 'paid', 'lost') NOT NULL DEFAULT 'open',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE if not exists bill_products (
    bill_product_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    bill_id INTEGER UNSIGNED NOT NULL,
    product_id INTEGER UNSIGNED NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



insert into clients (name, email, phone_number) values
('John Doe', 'a@a.com', '1234567890');
insert into products (name, slug, description) values
('Product 1', 'product-1', 'Description for product 1'),
('Product 2', 'product-2', 'Description for product 2');
insert into bills (client_id, total, status) values
(3, 100.00, 'open');
insert into bill_products (bill_id, product_id, quantity) values
(5, 1, 2),
(5, 2, 1);

