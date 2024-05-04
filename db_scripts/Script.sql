CREATE Table users(
    id_User INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(20),
    nombre VARCHAR(25),
    apellido VARCHAR(40)
);

CREATE Table downloads(
    download_ID INT PRIMARY KEY AUTO_INCREMENT,
    id_User 	INT,
    nombre_archivo VARCHAR(100),
    fecha_descarga DATETIME,
    foreign key (id_User) REFERENCES users(id_User)
);

CREATE Table product(
    product_ID 	INT PRIMARY KEY AUTO_INCREMENT,
    download_ID INT,
    nombre_producto VARCHAR(150),
    foreign key (download_ID) REFERENCES downloads(download_ID)
)