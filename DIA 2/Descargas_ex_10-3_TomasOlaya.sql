CREATE DATABASE Descargas
USE Descargas


CREATE Table users(
    id_User INT PRIMARY KEY IDENTITY,
    email VARCHAR(20),
    nombre VARCHAR(25),
    apellido VARCHAR(40)
);

CREATE Table downloads(
    download_ID INT PRIMARY KEY IDENTITY,
    id_User INT REFERENCES users(id_User),
    nombre_archivo VARCHAR(100),
    fecha_descarga DATETIME
);

CREATE Table product(
    product_ID INT PRIMARY KEY IDENTITY,
    download_ID INT REFERENCES downloads(download_ID),
    nombre_producto VARCHAR(150),
)
