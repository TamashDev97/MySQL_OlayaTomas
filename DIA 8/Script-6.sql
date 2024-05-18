create database los_Olimpicos;
use los_Olimpicos;

/* Tablas correspondientes a la ruta de comisario hasta complejo */

create table complejo(
id int not null unique,
nombre varchar(100),
id_deporte int,
id_info int
);

create table evento(
id int not null unique primary key,
id_evento int,
id_equipamiento int,
id_complejo int,
foreign key (id_complejo) references complejo(id)
);

create table equipamiento(
id int not null unique primary key,
nombre_equipamiento varchar(100),
stock int,
id_equipamiento int,
foreign key (id_equipamiento) references evento(id)
);



create table eventos(
id int not null unique primary key,
nombre varchar(100),
fecha datetime,
duracion time,
participantes int,
id_evento int,
foreign key (id_evento) references evento(id)
);


create table comisario(
id int not null unique primary key,
nombre varchar(100),
email varchar(100),
telefono varchar(20),
tipo enum('juez', 'observador')
);

create table comisario_evento(
id int not null unique primary key,
id_evento int,
id_comisario int,
foreign key (id_comisario) references comisario(id),
foreign key (id_evento) references eventos(id)
);


/* Tablas correspondientes a la ruta de deporte hasta complejo */

CREATE table deportes(
id int not null unique primary key,
nombre varchar(100),
numero_jugadores int,
id_deporte int,
foreign key (id_deporte) references complejo(id)
);


/* Tablas correspondientes a la ruta de jefes hasta complejo */

create table info_complejo(
id int not null unique primary key,
locacion varchar(100),
area_complejo float,
id_jefe int,
id_complejo int,
foreign key (id_jefe) references jefes(id),
foreign key (id_complejo) references complejo(id)
);

create table jefes(
id int not null unique primary key,
nombre varchar(50),
email varchar(50),
titulo varchar(50)
);


/* Tablas correspondientes a la ruta de sede hasta complejo */

create table sede(
id int not null unique primary key,
nombre varchar(100),
presupuesto float,
id_complejo int,
id_complejo_polideportivo int,
foreign key (id_complejo) references complejo(id)
);

create table complejo_polideportivo(
id int not null unique primary key,
nombre varchar(100),
id_deporte int,
id_info_complejo int,
id_sede int,
foreign key (id_deporte) references deportes(id),
foreign key (id_info_complejo) references info_complejo(id),
foreign key (id_sede) references sede(id)
);

create table evento_complejo_poli(
id int not null unique primary key,
id_eventos int,
id_complejos int,
foreign key (id_eventos) references eventos(id)
);

create table evento_complejo_deportivo(
id int not null unique primary key,
id_eventos int,
id_complejo int,
foreign key (id_complejo) references complejo (id)
);


/* INSERCIONES SQL */


INSERT INTO complejo VALUES
(1,'Complejo Deportivo Giron', 1,2),
(2,'Complejo Deportivo Floridablanca',3,3),
(3,'Complejo Deportivo Zapatoca', 2,4);


INSERT INTO evento_equipo VALUES
(1,3,6,1),
(2,1,5,2),
(3,4,4,3);


INSERT INTO comisario VALUES
(1, 'Diego Rojas','dr@hotmail.com','555-555-12345','juez'),
(2, 'Dracula Rosas','drR@hotmail.com','555-555-67895','juez'),
(3, 'Tomas suarez','ts@hotmail.com','555-555-35485','juez'),
(4, 'Lorena Martinez','lm@hotmail.com','444-555-12345','observador'),
(5, 'Rosa Martinez','Rm@hotmail.com','444-457-12345','observador'),
(6, 'Laura Bermudez','lBer@hotmail.com','444-856-12345','observador');


INSERT INTO info_complejo VALUES
(1, 'Bucaramanga', 5, 2, 1),
(2, 'Giron', 14.2, 1, 2),
(3, 'Floridablanca', 54, 5, 3),
(4, 'Zapatoca', 65, 3, 1),
(5, 'Lebrija', 48, 4, 2),
(6, 'Sangil', 5, 2, 3),
(7, 'Socorro', 14.2, 1, 1),
(8, 'Soacha', 54, 5, 2),
(9, 'Bogota', 65, 3, 3),
(10, 'Chia', 48, 4, 1);

INSERT INTO jefes VALUES
(1,'Jose Hernandez','jh@gmail.com','Especialista en Natacion'),
(2,'Camila Perez','cp@gmail.com','Especialista en Voleibol'),
(3,'Ana Rojas','ar@gmail.com','Especialista en Futbool'),
(4,'Carlos Duarte','cd@gmail.com','Especialista en Tennis'),
(5,'Horacio Hernandez','hh@gmail.com','Especialista en Tennis');


