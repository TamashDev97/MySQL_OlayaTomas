/*
Ejercicio de la guia propuesta para la clase de "Indexes"
*/

--- creacion de la base de datos ---

CREATE DATABASE jardineria_db
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE jardineria_db;

--- creacion de las tablas ---              
--- creacion de la base de datos ---

CREATE DATABASE jardineria_db
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE jardineria_db;

--- creacion de las tablas ---

CREATE TABLE customer (
    id INT(11) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

insert into customer
values (1, 'Yvonne', 'Clegg'),
(2, 'Johnny', 'Chaka-Chaka'),
(3, 'Winston', 'Powers'),
(4, 'Patricia', 'Mankuku'),
(5,'Francois', 'Papo'),
(6, 'Winnie', 'Dlamini'),
(7, 'Neil', 'Beneke')


--- Indices ---

select * from customer order by surname

