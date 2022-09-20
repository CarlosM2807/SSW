CREATE DATABASE cashsaving;
USE cashsaving;

CREATE TABLE IF NOT EXISTS Usuario (
    id INT AUTO_INCREMENT,
    nombre varchar(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento VARCHAR(11),
    email varchar(100) NOT NULL,
    passwd varchar(20) NOT NULL,
    capital_inic FLOAT NOT NULL,
    ingreso_mensual FLOAT NOT NULL,
    gasto_mensual FLOAT NOT NULL,
    sexo VARCHAR(12) DEFAULT 'No contesta',
    divisa VARCHAR(6) DEFAULT 'Euro',
    gestion_correo TINYINT DEFAULT '1',
    correo_app_relacion TINYINT DEFAULT '1',
    anuncios TINYINT DEFAULT '1',
    recomendacion TINYINT DEFAULT '0',

    CONSTRAINT error_pk_user PRIMARY KEY (id)

);

CREATE TABLE IF NOT EXISTS Movimiento (
    id INT AUTO_INCREMENT,
    id_user INT NOT NULL,
    tipoPago VARCHAR(100) NOT NULL,
    concepto VARCHAR(100) NOT NULL,
    fecha date NOT NULL,
    cantidad FLOAT NOT NULL,

    CONSTRAINT error_pk_dt PRIMARY KEY (id, fecha),

    CONSTRAINT error_fk_dt_user FOREIGN KEY (id_user) REFERENCES Usuario (id)
);

CREATE TABLE IF NOT EXISTS Comentario (
    id INT AUTO_INCREMENT,
    id_user INT NOT NULL,
    fecha date,
    coment varchar(10000) NOT NULL,

    CONSTRAINT error_pk_comment PRIMARY KEY (id, fecha),

    CONSTRAINT error_fk_comment_user FOREIGN KEY (id_user) REFERENCES Usuario (id)
);


CREATE TABLE IF NOT EXISTS Plan (
    id INT AUTO_INCREMENT,
    id_user INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    mes INT NOT NULL,
    cantidad FLOAT NOT NULL,

    CONSTRAINT error_pk_plan PRIMARY KEY (id, nombre),

    CONSTRAINT error_fk_plan_user FOREIGN KEY (id_user) REFERENCES Usuario (id)
);


INSERT INTO usuario (nombre, apellidos, fecha_nacimiento, email, passwd, capital_inic, ingreso_mensual, gasto_mensual, sexo, divisa, gestion_correo, correo_app_relacion, anuncios, recomendacion) 
	VALUES ('Antonio', 'Perez Torres', NULL, 'antonioperezt@gmail.com', 'contrasena', 1450.0, 860.0, 800.0, 'No contesta', 'Euro', 1, 1, 1, 0);
    INSERT INTO usuario (nombre, apellidos, fecha_nacimiento, email, passwd, capital_inic, ingreso_mensual, gasto_mensual, sexo, divisa, gestion_correo, correo_app_relacion, anuncios, recomendacion) 
	VALUES ('Susana', 'Horia Pelada', '12-05-1998', 'susana@gmail.com', 'susana2000', 6450.0, 160.0, 890.0, 'Mujer', 'Euro', 1, 1, 1, 1);
    INSERT INTO usuario (nombre, apellidos,fecha_nacimiento, email, passwd, capital_inic, ingreso_mensual, gasto_mensual, sexo, divisa, gestion_correo, correo_app_relacion, anuncios, recomendacion) 
	VALUES ('Carlos', 'Martin Sanz', NULL, 'carlosmartinsanz@gmail.com', '2000_carlos_prueba', 2450.0, 1860.0, 1500.0, 'Hombre', 'Euro', 0, 0, 0, 0);
    INSERT INTO usuario (nombre, apellidos, fecha_nacimiento, email, passwd, capital_inic, ingreso_mensual, gasto_mensual, sexo, divisa, gestion_correo, correo_app_relacion, anuncios, recomendacion) 
	VALUES ('Hector', 'Toribio Gonzalez', NULL, 'hectoribio@gmail.com', 'hec2001_po', 8450.0, 460.0, 8905.0, 'No contesta', 'Euro', 1, 1, 1, 1);
    INSERT INTO usuario (nombre, apellidos, fecha_nacimiento, email, passwd, capital_inic, ingreso_mensual, gasto_mensual, sexo, divisa, gestion_correo, correo_app_relacion, anuncios, recomendacion) 
	VALUES ('Alonso', 'Sayalero Blazquez', '12-02-2001', 'sayaleroese@gmail.com', 'sayas2000', 2650.0, 2860.0, 1600.0, 'Hombre', 'Euro', 0, 0, 0, 0);
    INSERT INTO usuario (nombre, apellidos, fecha_nacimiento, email, passwd, capital_inic, ingreso_mensual, gasto_mensual, sexo, divisa, gestion_correo, correo_app_relacion, anuncios, recomendacion) 
	VALUES ('Alejandro', 'Pulido Sanchez', NULL, 'alexa@gmail.com', 'alexander', 1650.0, 160.0, 6905.0, 'Hombre', 'Euro', 0, 0, 1, 1);

INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (1,'Tarjeta','KIOSCO','2022-03-22',-4);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (1,'Efectivo','SKIN VALORANT','2022-04-16',-5);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (1,'Bizum','KEBAB ANUEL','2022-04-19', -5.80);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (2,'Otro','FRUTERIA','2022-04-16',-12.30);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (3,'Tarjeta','CARNE','2022-03-21',-50.20);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (3,'Efectivo','SKIN LOL','2022-04-06',-8.80);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (4,'Otro','CAFETERIA','2022-04-29', -3.80);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (5,'Otro','KEBAB','2022-04-11',-5.90);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (1,'Bizum','TAXI SABADO','2022-03-12',10.35);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (1,'Efectivo','CINE','2022-04-21',12.36);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (1,'Otro','ARREGLO PC','2022-03-11',-125.78);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (1,'Bizum','CONCIERTO','2022-02-11', -80.5);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (1,'Tarjeta','FRUTERIA','2022-03-19',-12.30);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (3,'Efectivo','PESCADO','2022-04-21',-35.20);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (2,'Tarjeta','CARREFOUR','2022-04-12',-25.90);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (2,'Bizum','ENTRADA FUTBOL','2022-03-24',50.35);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (2,'Efectivo','GIMNASIO','2022-04-10',-30.50);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (2,'Tarjeta','VESTIDO','2022-03-20',-55.78);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (3,'Bizum','CONCIERTO','2022-02-16', 30.5);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (3,'Bizum','DESAYUNO','2022-03-19',-2.70);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (3,'Otro','WALLAPOP','2022-03-29',15.20);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (4,'Efectivo','TECLADO','2022-04-15',-20.90);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (4,'Bizum','FUTBOL','2022-03-24',-50.35);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (4,'Efectivo','PAGO COMPRA','2022-04-15',60.50);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (4,'Tarjeta','CENA','2022-03-20',-55.78);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (4,'Otro','FIESTA','2022-04-16', -10.5);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (5,'Bizum','DESAYUNO','2022-03-20',-2.70);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (5,'Efectivo','WALLAPOP','2022-03-29',15.20);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (5,'Efectivo','COMIDA','2022-04-19',-25.70);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (5,'Tarjeta','GASOIL','2022-04-22',-80);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (6,'Bizum','DESAYUNO','2022-04-15',-3.70);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (6,'Otro','PERIFERICOS','2022-04-20',-15.20);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (6,'Tarjeta','CAMPAMENTO','2022-03-19',22.70);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (6,'Efectivo','BAR','2022-04-22',-15.20);
    INSERT INTO movimiento (id_user,tipoPago,concepto,fecha,cantidad)
    VALUES (6,'Tarjeta','PESCADO','2022-03-30',-28.70);



INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (1, 'AHORRO VACACIONES', 4,400.0 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (1, 'AHORRO MOVIL', 2,300.0 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (2, 'AHORRO ANUAL', 5, 800.0 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (2, 'RURAL VERANO', 9,1200.0 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (3, 'FIESTA', 1,60.0 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (4, 'REGALO MAMA', 2,50.9 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (4, 'ZAPATILLAS NUEVAS', 1,100.5 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (4, 'GASOLINA', 3, 100.0 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (4, 'FUTURO', 24, 5000.0);
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (5, 'REGALO MAMA', 3,70.0 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (5, 'RELOJ NUEVO', 3,180.5 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (5, 'PC GAMING', 10, 1000.0 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (5, 'PLAYEROS', 4, 50.0);
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (6, 'GASOLINA', 3, 70.0 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (6, 'ALTAVOCES', 2, 50.7);
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (6, 'HOTEL', 6,450.9 );
    INSERT INTO Plan (id_user, nombre ,mes,cantidad)
    VALUES (6, 'ENTRADAS FUTBOL', 2,100.0 );
    

INSERT INTO Comentario(id_user,fecha,coment)
VALUES(1,'2022-04-19','Muy buena aplicacion y muy recomendable');
INSERT INTO Comentario(id_user,fecha,coment)
VALUES(4,'2022-03-28','Me ha ayudado a gestionar mejor mi dinero.... muy buena app');
INSERT INTO Comentario(id_user,fecha,coment)
VALUES(5,'2022-04-20','De las mejores que he probado en este campo enhorabuena!!!');
INSERT INTO Comentario(id_user,fecha,coment)
VALUES(2,'2022-04-21','Gracias a Cash Saving ahora gestiono mucho mejor mis ingresos y gastos, me ayuda a llevar un control de todo');
