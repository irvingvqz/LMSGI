/*
  File: gdbStarWars.sql  
  Author: Ana Polo  Arozamena  
*/


/*-------------------------*/
/*--- Creación de la BD ---*/
/*-------------------------*/

DROP DATABASE IF EXISTS starWars;
CREATE DATABASE IF NOT EXISTS starWars;


/*--------------------------*/
/*--- Selección de la BD ---*/
/*--------------------------*/

USE starWars;


/*--------------------------------*/
/*--- Definición de las tablas ---*/
/*--------------------------------*/


/*
  Tabla: asociacion
  Descripción: Guarda la información básica de cada una de las agrupaciones de habibronceadotes de la galaxia.
*/

DROP TABLE IF EXISTS asociacion;

CREATE TABLE asociacion ( 

  /*--- Definición de las columnas de la tabla ---*/

  idAsociacion INT, 
  nombre VARCHAR( 255 ) DEFAULT NULL, 
  
  /*--- Restricciones de tabla ---*/

/*--- Clave primaria ---*/

  CONSTRAINT pkAsociacion PRIMARY KEY ( idAsociacion )
 )
ENGINE = InnoDB;


/*
  Tabla: planeta
  Descripción: Guarda la información básica de cada una de los planetas de la galaxia.
*/			

DROP TABLE IF EXISTS planeta;

CREATE TABLE planeta( 
  idPlaneta INT AUTO_INCREMENT, 
  nombre VARCHAR( 50 ), 
  rotacionPeriodo INT, 
  orbitalPeriodo INT, 
  diametro INT, 
  clima VARCHAR( 50 ), 
  gravedad VARCHAR( 50 ), 
  terreno VARCHAR( 50 ), 
  superficieAgua VARCHAR( 50 ), 
  poblacion BIGINT, 
  creacionFecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 

/*--- Restricciones de tabla ---*/

/*--- Clave primaria ---*/

CONSTRAINT pkPlaneta PRIMARY KEY ( idPlaneta )
 );


/*
  Tabla: personaje
  Descripción: Guarda la información básica de cada uno de los personajes de la galaxia.
*/

DROP TABLE IF EXISTS personaje;

CREATE TABLE personaje( 
idPersonaje INT AUTO_INCREMENT, 
nombre VARCHAR( 50 ), 
altura INT, 
peso DECIMAL, 
peloColor VARCHAR( 50 ), 
pielColor VARCHAR( 50 ), 
ojosColor VARCHAR( 50 ), 
nacimientoAnho VARCHAR( 50 ), 
genero VARCHAR( 50 ), 
fkPlaneta INT NOT NULL, 
creacionFecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 

	/*--- Restricciones de tabla ---*/

	/*--- Clave primaria ---*/

	CONSTRAINT pkPersonaje PRIMARY KEY ( idPersonaje ), 

	/*--- Clave foránea ---*/

	CONSTRAINT fkPersonajePlaneta FOREIGN KEY ( fkPlaneta ) 
	  REFERENCES planeta ( idPlaneta )
	  ON DELETE RESTRICT
	  ON UPDATE RESTRICT
 )
ENGINE=InnoDB;


DROP TABLE IF EXISTS personajeAsociacion;

CREATE TABLE personajeAsociacion ( 
	
	/*--- Definición de las columnas de la tabla ---*/

	fkPersonaje INT NOT NULL, 
	fkAsociacion INT NOT NULL, 
	
	/*--- Restricciones de tabla ---*/

	/*--- Clave primaria ---*/

	CONSTRAINT pkPersonajeAsociacion PRIMARY KEY ( fkPersonaje, fkAsociacion ), 

	/*--- Clave foránea ---*/


	CONSTRAINT fkPersonajePersonajeAsociacion FOREIGN KEY ( fkPersonaje )
	  REFERENCES personaje( idPersonaje )
	  ON DELETE RESTRICT
	  ON UPDATE RESTRICT, 

	CONSTRAINT fkAsociacionPersonajeAsociacion FOREIGN KEY ( fkAsociacion )
	  REFERENCES asociacion( idAsociacion )
	  ON DELETE RESTRICT
	  ON UPDATE RESTRICT
 )
ENGINE=InnoDB;


/*
  Tabla: pelicula
  Descripción: Guarda la información básica de cada una de las películas de la galaxia.
*/

DROP TABLE IF EXISTS pelicula;

CREATE TABLE pelicula ( 
	
	/*--- Definición de las columnas de la tabla ---*/

	idPelicula INT NOT NULL, 
	episodio VARCHAR( 12 ) DEFAULT NULL, 
	titulo VARCHAR( 30 ) DEFAULT NULL, 
	
	/*--- Restricciones de tabla ---*/

	/*--- Clave primaria ---*/

	CONSTRAINT pkPelicula PRIMARY KEY ( idPelicula )
 )
engine=iNNOdB;


/*
  Tabla: personajePelicula
  Descripción: Guarda la información básica de cada uno de los personajes de la galaxia.
*/


DROP TABLE IF EXISTS personajePelicula;

CREATE TABLE personajePelicula ( 
	
	/*--- Definición de las columnas de la tabla ---*/

	fkPersonaje INT NOT NULL, 
	fkPelicula INT NOT NULL, 
	
	/*--- Restricciones de tabla ---*/

	/*--- Clave primaria ---*/

	CONSTRAINT pkPersonajePelicula PRIMARY KEY ( fkPersonaje, fkPelicula ), 

	/*--- Clave foránea ---*/
	
	CONSTRAINT fkPersonajePersonajePelicula FOREIGN KEY ( fkPersonaje )
	  REFERENCES personaje( idPersonaje )
	  ON DELETE RESTRICT
	  ON UPDATE RESTRICT, 
	
	CONSTRAINT fkPeliculaPersonajePelicula FOREIGN KEY ( fkPelicula )
	  REFERENCES pelicula( idPelicula )
	  ON DELETE RESTRICT
	  ON UPDATE RESTRICT	
 )
ENGINE=InnoDB;
	

/*
  Tabla: muerte
  Descripción: Guarda la información de la muerte de un personaje.
*/


DROP TABLE IF EXISTS muerte;

CREATE TABLE muerte ( 

	/*--- Definición de las columnas de la tabla ---*/

	idMuerte INT NOT NULL AUTO_INCREMENT, 
fkFallecido INTEGER, 
fkAsesino INTEGER, 
fkPelicula INTEGER, 

	/*--- Restricciones de tabla ---*/

	/*--- Clave primaria ---*/

	CONSTRAINT pkFallecimiento PRIMARY KEY ( idMuerte ), 
	
	/*--- Clave foránea ---*/

	CONSTRAINT fkFallecidoMuerte FOREIGN KEY ( fkFallecido )
	  REFERENCES personaje( idPersonaje )
	  ON DELETE RESTRICT
	  ON UPDATE RESTRICT, 
	
	CONSTRAINT fkAsesinoMuerte FOREIGN KEY ( fkAsesino )	
	  REFERENCES personaje( idPersonaje )
	  ON DELETE RESTRICT
	  ON UPDATE RESTRICT, 		

	CONSTRAINT fkPeliculaMuerte FOREIGN KEY ( fkPelicula )		
	  REFERENCES pelicula( idPelicula )
	  ON DELETE RESTRICT
	  ON UPDATE RESTRICT	
 )
ENGINE=iNNOdb;


INSERT INTO asociacion 
VALUES
	( 1, 'Orden Jedi' ), 
	( 2, 'Allianza Rebelde' ), 
	( 3, 'Republica Galáctica' ), 
	( 4, 'Imperio Galactico' ), 
	( 5, 'Sith' ), 
	( 6, 'Senado Galáctico' ), 
	( 7, 'Familia Real de Alderaan' ), 
	( 8, 'Independientes' ), 
	( 9, 'Ejercito Gungan' ), 
	( 10, 'Fuerzas de Cazas Reales del Espacio Naboo' ), 
	( 11, 'Fuerzas Reales de Naboo' ), 
	( 12, 'Techno Union' );

DELETE FROM planeta;
INSERT INTO planeta( idPlaneta, nombre, rotacionPeriodo, orbitalPeriodo, diametro, clima, gravedad, terreno, superficieAgua, poblacion, creacionFecha ) 
VALUES
(  1, 'Desconocido', NULL,  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ), 
(  2, 'Tatooine', '23', '304','10465', 'árido', '1 sbronceadodard', 'desierto', '1', '200000', '2014-12-09 13:50:49.641000' ), 
(  3, 'Alderaan', '24', '364','12500', 'templado', '1 sbronceadodard', 'prados, montañas', '40', '2000000000', '2014-12-10 11:35:48.479000' ), 
(  4, 'Yavin IV', '24', '4818',  '10200', 'templado, tropical','1 sbronceadodard', 'selva, bosques', '8', '1000', '2014-12-10 11:37:19.144000' ), 
(  5, 'Hoth',  '23', '549', '7200', 'helado', '1.1 sbronceadodard', 'tundra, cuevas heladas, sierras', '100', NULL, '2014-12-10 11:39:13.934000' ), 
(  6, 'Dagobah',  '23', '341', '8900', 'tenebroso',  'N/A', 'panbronceadoo, selvas', '8', NULL, '2014-12-10 11:42:22.590000' ), 
(  7, 'Bespin','12', '5110', '118000', 'templado', '1.5 (surface), 1 sbronceadodard (Cloud City)', 'gigante gaseoso', '0', '6000000', '2014-12-10 11:43:55.240000' ), 
(  8, 'Endor', '18', '402', '4900', 'templado',  '0.85 sbronceadodard', 'bosques, montañas, lagos', '8', '30000000', '2014-12-10 11:50:29.349000' ), 
(  9, 'Naboo', '26', '312','12120', 'templado',  '1 sbronceadodard', 'colinas, panbronceadoos, bosques, montañas', '12', '4500000000', '2014-12-10 11:52:31.066000' ), 
( 10, 'Coruscant','24', '368','12240', 'templado',  '1 sbronceadodard', 'montañas', NULL, '1000000000000', '2014-12-10 11:54:13.921000' ), 
( 11, 'Kamino','27', '463','19720', 'templado',  '1 sbronceadodard', 'océano', '100', '1000000000', '2014-12-10 12:45:06.577000' ), 
( 12, 'Geonosis', '30', '256','11370', 'templado, árido',  '0.9 sbronceadodard', 'desierto, montaña', '5', '100000000000', '2014-12-10 12:47:22.350000' ), 
( 13, 'Utapau','27', '351','12900', 'templado, árido, ventoso', '1 sbronceadodard', 'sabana, cañones', '0.9', '95000000', '2014-12-10 12:49:01.491000' ), 
( 14, 'Mustafar', '36', '412', '4200', 'cálido', '1 sbronceadodard', 'volcanes, ríos de lava, montañas, cuevas', '0', '20000', '2014-12-10 12:50:16.526000' ), 
( 15, 'Kashyyyk', '26', '381','12765', 'tropical', '1 sbronceadodard', 'selva, bosques, lagos, ríos', '60', '45000000', '2014-12-10 13:32:00.124000' ), 
( 16, 'Polis Massa', '24', '590', '0', 'artificial templado', '0.56 sbronceadodard', 'asteroide sin aire', '0', '1000000', '2014-12-10 13:33:46.405000' ), 
( 17, 'Mygeeto',  '12','167', '10088', 'gélido', '1 sbronceadodard', 'glaciares, montañas, cañones helados', NULL, '19000000', '2014-12-10 13:43:39.139000' ), 
( 18, 'Felucia',  '34', '231', '9100', 'cálido, húmedo', '0.75 sbronceadodard', 'bosques de hongos', NULL, '8500000', '2014-12-10 13:44:50.397000' ), 
( 19, 'Cato Neimoidia', '25', '278', '0', 'templado, húmedo', '1 sbronceadodard', 'montañas, campos, bosques', NULL, '10000000', '2014-12-10 13:46:28.704000' ), 
( 20, 'Saleucami','26', '392','14920', 'cálido', NULL, 'cuevas, desierto, montañas, volcanes', NULL, '1400000000', '2014-12-10 13:47:46.874000' ), 
( 21, 'Stewjon',  NULL,  NULL, '0', 'templado', '1 sbronceadodard', 'prados', NULL, NULL, '2014-12-10 16:16:26.566000' ), 
( 22, 'Eriadu','24', '360','13490', 'contaminado', '1 sbronceadodard', 'ciudades', NULL, '22000000000', '2014-12-10 16:26:54.384000' ), 
( 23, 'Corellia', '25', '329','11000', 'templado', '1 sbronceadodard', 'mesetas, urbanización, colinas, bosques', '70', '3000000000', '2014-12-10 16:49:12.453000' ), 
( 24, 'Rodia', '29', '305', '7549', 'cálido', '1 sbronceadodard', 'selvas, océanos, urbanización, panbronceadoos', '60', '1300000000', '2014-12-10 17:03:28.110000' ), 
( 25, 'Nal Hutta','87', '413','12150', 'templado', '1 sbronceadodard', 'urbanizaciones, océanos, panbronceadoos', NULL, '7000000000', '2014-12-10 17:11:29.452000' ), 
( 26, 'Dantooine','25', '378', '9830', 'templado', '1 sbronceadodard', 'océanos, sabanas, montañas, prados', NULL, '1000', '2014-12-10 17:23:29.896000' ), 
( 27, 'Bestine IV',  '26', '680', '6400', 'templado', NULL, 'islas rocosas, océanos', '98', '62000000', '2014-12-12 11:16:55.078000' ), 
( 28, 'Ord Mantell', '26', '334','14050', 'templado', '1 sbronceadodard', 'llanuras, mares', '10', '4000000000', '2014-12-15 12:23:41.661000' ), 
( 29, 'DEsconocido',  '0', '0','0', NULL, NULL, NULL, NULL, NULL, '2014-12-15 12:25:59.569000' ), 
( 30, 'Trandosha','25', '371', '0', 'árido', '0.62 sbronceadodard', 'montañas, mares, prados, desiertos', NULL, '42000000', '2014-12-15 12:53:47.695000' ), 
( 31, 'Socorro',  '20', '326', '0', 'árido', '1 sbronceadodard', 'desiertos, montañas', NULL, '300000000', '2014-12-15 12:56:31.121000' ), 
( 32, 'Mon Cala', '21', '398','11030', 'templado', '1', 'océanos, acantilados, islas', '100', '27000000000', '2014-12-18 11:07:01.792000' ), 
( 33, 'Chandrila','20', '368','13500', 'templado', '1', 'llanuras, bosques', '40', '1200000000', '2014-12-18 11:11:51.872000' ), 
( 34, 'Sullust',  '20', '263','12780', 'muy cálido', '1', 'montañas, volcanes, desiertos rocosos', '5', '18500000000', '2014-12-18 11:25:40.243000' ), 
( 35, 'Toydaria', '21', '184', '7900', 'templado', '1', 'panbronceadoos, lagos', NULL, '11000000', '2014-12-19 17:47:54.403000' ), 
( 36, 'Malastare','26', '201','18880', 'árido, templado, tropical', '1.56', 'panbronceadoos, desiertos, selvas, montañas', NULL, '2000000000', '2014-12-19 17:52:13.106000' ), 
( 37, 'Dathomir', '24', '491','10480', 'templado', '0.9', 'bosques, desiertos, sabanas', NULL, '5200', '2014-12-19 18:00:40.142000' ), 
( 38, 'Ryloth','30', '305','10600', 'templado, árido, subártico', '1', 'montañas, valles, desiertos, tundra', '5', '1500000000', '2014-12-20 09:46:25.740000' ), 
( 39, 'Aleen Minor', NULL,  NULL,NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-20 09:52:23.452000' ), 
( 40, 'Vulpter',  '22', '391','14900', 'templado, ártico', '1', 'urbanizaciones, barren', NULL, '421000000', '2014-12-20 09:56:58.874000' ), 
( 41, 'Troiken',  NULL,  NULL,NULL, NULL, NULL, 'desierto, tundra, bosques, montañas', NULL, NULL, '2014-12-20 10:01:37.395000' ), 
( 42, 'Tund',  '48', '1770',  '12190', NULL, NULL, 'cenizas', NULL, '0', '2014-12-20 10:07:29.578000' ), 
( 43, 'Haruun Kal',  '25', '383','10120', 'templado', '0.98', 'nube tóxica, meseta, volcanes', NULL, '705300', '2014-12-20 10:12:28.980000' ), 
( 44, 'Cerea', '27', '386',NULL, 'templado', '1', 'fertil', '20', '450000000', '2014-12-20 10:14:48.178000' ), 
( 45, 'Glee Anselm', '33', '206','15600', 'tropical, templado', '1', 'lagos, islands, panbronceadoos, mares', '80', '500000000', '2014-12-20 10:18:26.110000' ), 
( 46, 'Iridonia', '29', '413',NULL, NULL, NULL, 'rocoso', NULL, NULL, '2014-12-20 10:26:05.788000' ), 
( 47, 'Tholoth',  NULL,  NULL,NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-20 10:28:31.117000' ), 
( 48, 'Iktotch',  '22', '481',NULL, 'árido, rocoso, ventoso', '1', 'rocoso', NULL, NULL, '2014-12-20 10:31:32.413000' ), 
( 49, 'Quermia',  NULL,  NULL,NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-20 10:34:08.249000' ), 
( 50, 'Dorin', '22', '409','13400', 'templado', '1', NULL, NULL, NULL, '2014-12-20 10:48:36.141000' ), 
( 51, 'Champala', '27', '318',NULL, 'templado', '1', 'océanos, bosques, meseta', NULL, '3500000000', '2014-12-20 10:52:51.524000' ), 
( 52, 'Mirial',NULL,  NULL,NULL, NULL, NULL, 'desiertos', NULL, NULL, '2014-12-20 16:44:46.318000' ), 
( 53, 'Serenno',  NULL,  NULL,NULL, NULL, NULL, 'bosques, ríos, montañas', NULL, NULL, '2014-12-20 16:52:13.357000' ), 
( 54, 'Concord Dawn',NULL,  NULL,NULL, NULL, NULL, 'selvas, bosques, desiertos', NULL, NULL, '2014-12-20 16:54:39.909000' ), 
( 55, 'Zolan', NULL,  NULL,NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-20 16:56:37.250000' ), 
( 56, 'Ojom',  NULL,  NULL,NULL, 'gélido', NULL, 'océanos, glaciares', '100', '500000000', '2014-12-20 17:27:41.286000' ), 
( 57, 'Skako', '27', '384',NULL, 'templado', '1', 'urbanización', NULL, '500000000000', '2014-12-20 17:50:47.864000' ), 
( 58, 'Muunilinst',  '28', '412','13800', 'templado', '1', 'llanuras, bosques, colinas, montañas', '25', '5000000000', '2014-12-20 17:57:47.420000' ), 
( 59, 'Shili', NULL,  NULL,NULL, 'templado', '1', 'ciudades, sabana, mares, llanuras', NULL, NULL, '2014-12-20 18:43:14.049000' ), 
( 60, 'Kalee', '23', '378','13850', 'árido, templado, tropical', '1', 'bosques, acantilados, cañones, mares', NULL, '4000000000', '2014-12-20 19:43:51.278000' ), 
( 61, 'Umbara',NULL,  NULL,NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-20 20:18:36.256000' ), 
( 62, 'Jakku', NULL,  NULL,NULL, NULL, NULL, 'desiertos', NULL, NULL, '2015-04-17 06:55:57.556495' );

INSERT INTO personaje ( idPersonaje, nombre, altura, peso, peloColor, pielColor, ojosColor, nacimientoAnho, genero, fkPlaneta, creacionFecha ) 
VALUES
( 1, 'Luke Skywalker', '172', '77', 'rubio', 'castaño', 'azul', '19BBY', 'hombre', 2, '2014-12-09 13:50:51.644000' ), 
( 2, 'C-3PO', '167', '75', 'n/a', 'dorado', 'amarillo', '112BBY', 'n/a', 2, '2014-12-10 15:10:51.357000' ), 
( 3, 'R2-D2', '96', '32', 'n/a', 'blanco, azul', 'rojo', '33BBY', 'n/a', 9, '2014-12-10 15:11:50.376000' ), 
( 4, 'Darth Vader', '202', '136', 'calvo', 'blanco', 'amarillo', '41.9BBY', 'hombre', 2, '2014-12-10 15:18:20.704000' ), 
( 5, 'Leia Organa', '150', '49', 'marrón', 'clara', 'marrón', '19BBY', 'mujer', 3, '2014-12-10 15:20:09.791000' ), 
( 6, 'Owen Lars', '178', '120', 'marrón, gris', 'clara', 'azul', '52BBY', 'hombre', 2, '2014-12-10 15:52:14.024000' ), 
( 7, 'Whitesun lars', '165', '75', 'marrón', 'clara', 'azul', '47BBY', 'mujer', 2, '2014-12-10 15:53:41.121000' ), 
( 8, 'R5-D4', '97', '32', 'n/a', 'blanco, rojo', 'rojo', NULL, 'n/a', 2, '2014-12-10 15:57:50.959000' ), 
( 9, 'Biggs Darkclaraer', '183', '84', 'negro', 'clara', 'marrón', '24BBY', 'hombre', 2, '2014-12-10 15:59:50.509000' ), 
( 10, 'Obi-Wan Kenobi', '182', '77', 'pelirrojo, blanco', 'castaño', 'azul-gray', '57BBY', 'hombre', 21, '2014-12-10 16:16:29.192000' ), 
( 11, 'Anakin Skywalker', '188', '84', 'rubio', 'castaño', 'azul', '41.9BBY', 'hombre', 2, '2014-12-10 16:20:44.310000' ), 
( 12, 'Wilhuff Tarkin', '180', NULL, 'pelirrojo, gris', 'castaño', 'azul', '64BBY', 'hombre', 22, '2014-12-10 16:26:56.138000' ), 
( 13, 'Chewbacca', '228', '112', 'marrón', NULL, 'azul', '200BBY', 'hombre', 15, '2014-12-10 16:42:45.066000' ), 
( 14, 'Han Solo', '180', '80', 'marrón', 'castaño', 'marrón', '29BBY', 'hombre', 23, '2014-12-10 16:49:14.582000' ), 
( 15, 'Greedo', '173', '74', 'n/a', 'verde', 'negro', '44BBY', 'hombre', 24, '2014-12-10 17:03:30.334000' ), 
( 16, 'Jabba Desilijic Tiure', '175', '1358', 'n/a', 'verde, marrón', 'naranja', '600BBY', 'hermaphrodite', 25, '2014-12-10 17:11:31.638000' ), 
( 18, 'Wedge Antilles', '170', '77', 'marrón', 'castaño', 'avellana', '21BBY', 'hombre', 23, '2014-12-12 11:08:06.469000' ), 
( 19, 'Jek Tono Porkins', '180', '110', 'marrón', 'castaño', 'azul', NULL, 'hombre', 27, '2014-12-12 11:16:56.569000' ), 
( 20, 'Yoda', '66', '17', 'blanco', 'verde', 'marrón', '896BBY', 'hombre', 29, '2014-12-15 12:26:01.042000' ), 
( 21, 'Palpatine', '170', '75', 'gris', 'pálido', 'amarillo', '82BBY', 'hombre', 9, '2014-12-15 12:48:05.971000' ), 
( 22, 'Boba Fett', '183', '78.2', 'negro', 'castaño', 'marrón', '31.5BBY', 'hombre', 11, '2014-12-15 12:49:32.457000' ), 
( 23, 'IG-88', '200', '140', 'calvo', 'metal', 'rojo', '15BBY', 'calvo', 29, '2014-12-15 12:51:10.076000' ), 
( 24, 'Bossk', '190', '113', 'calvo', 'verde', 'rojo', '53BBY', 'hombre', 30, '2014-12-15 12:53:49.297000' ), 
( 25, 'Lando Calrissian', '177', '79', 'negro', 'oscuro', 'marrón', '31BBY', 'hombre', 31, '2014-12-15 12:56:32.683000' ), 
( 26, 'Lobot', '175', '79', 'calvo', 'clara', 'azul', '37BBY', 'hombre', 7, '2014-12-15 13:01:57.178000' ), 
( 27, 'Ackbar', '180', '83', 'calvo', 'marrón', 'naranja', '41BBY', 'hombre', 32, '2014-12-18 11:07:50.584000' ), 
( 28, 'Mon Mothma', '150', NULL, 'pelirrojo', 'castaño', 'azul', '48BBY', 'mujer', 33, '2014-12-18 11:12:38.895000' ), 
( 29, 'Arvel Crynyd', NULL, NULL, 'marrón', 'castaño', 'marrón', NULL, 'hombre', 29, '2014-12-18 11:16:33.020000' ), 
( 30, 'Wicket Systri Warrick', '88', '20', 'marrón', 'marrón', 'marrón', '8BBY', 'hombre', 8, '2014-12-18 11:21:58.954000' ), 
( 31, 'Nien Nunb', '160', '68', 'calvo', 'gris', 'negro', NULL, 'hombre', 34, '2014-12-18 11:26:18.541000' ), 
( 32, 'Qui-Gon Jinn', '193', '89', 'marrón', 'castaño', 'azul', '92BBY', 'hombre', 29, '2014-12-19 16:54:53.618000' ), 
( 33, 'Nute Gunray', '191', '90', 'calvo', 'verde', 'rojo', NULL, 'hombre', 19, '2014-12-19 17:05:57.357000' ), 
( 34, 'Finis Valorum', '170', NULL, 'rubio', 'castaño', 'azul', '91BBY', 'hombre', 10, '2014-12-19 17:21:45.915000' ), 
( 35, 'Jar Jar Binks', '196', '66', 'calvo', 'naranja', 'naranja', '52BBY', 'hombre', 9, '2014-12-19 17:29:32.489000' ), 
( 36, 'Padmé Amidala', '165', '45', 'marrón', 'clara', 'marrón', '46BBY', 'mujer', 9, '2014-12-19 17:28:26.926000' ), 
( 37, 'Roos Tarpals', '224', '82', 'calvo', 'gris', 'naranja', NULL, 'hombre', 9, '2014-12-19 17:32:56.741000' ), 
( 38, 'Rugor Nass', '206', NULL, 'calvo', 'verde', 'naranja', NULL, 'hombre', 9, '2014-12-19 17:33:38.909000' ), 
( 39, 'Ric Olié', '183', NULL, 'marrón', 'castaño', 'azul', NULL, 'hombre', 9, '2014-12-19 17:45:01.522000' ), 
( 40, 'Watto', '137', NULL, 'negro', 'azul, gris', 'amarillo', NULL, 'hombre', 35, '2014-12-19 17:48:54.647000' ), 
( 41, 'Sebulba', '112', '40', 'calvo', 'gris, rojo', 'naranja', NULL, 'hombre', 36, '2014-12-19 17:53:02.586000' ), 
( 42, 'Quarsh Panaka', '183', NULL, 'negro', 'oscuro', 'marrón', '62BBY', 'hombre', 9, '2014-12-19 17:55:43.348000' ), 
( 43, 'Shmi Skywalker', '163', NULL, 'negro', 'castaño', 'marrón', '72BBY', 'mujer', 2, '2014-12-19 17:57:41.191000' ), 
( 44, 'Darth Maul', '175', '80', 'calvo', 'rojo', 'amarillo', '54BBY', 'hombre', 37, '2014-12-19 18:00:41.929000' ), 
( 45, 'Bib Fortuna', '180', NULL, 'calvo', 'pálido', 'rosa', NULL, 'hombre', 38, '2014-12-20 09:47:02.512000' ), 
( 46, 'Ayla Secura', '178', '55', 'calvo', 'azul', 'avellana', '48BBY', 'mujer', 38, '2014-12-20 09:48:01.172000' ), 
( 47, 'Ratts Tyerell', '79', '15', 'calvo', 'gris, azul', NULL, NULL, 'hombre', 39, '2014-12-20 09:53:15.086000' ), 
( 48, 'Dud Bolt', '94', '45', 'calvo', 'azul, gris', 'amarillo', NULL, 'hombre', 40, '2014-12-20 09:57:31.858000' ), 
( 49, 'Gasgano', '122', NULL, 'calvo', 'blanco, azul', 'negro', NULL, 'hombre', 41, '2014-12-20 10:02:12.223000' ), 
( 50, 'Ben Quadinaros', '163', '65', 'calvo', 'gris, verde, amarillo', 'naranja', NULL, 'hombre', 42, '2014-12-20 10:08:33.777000' ), 
( 51, 'Mace Windu', '188', '84', 'calvo', 'oscuro', 'marrón', '72BBY', 'hombre', 43, '2014-12-20 10:12:30.846000' ), 
( 52, 'Ki-Adi-Mundi', '198', '82', 'blanco', 'pálido', 'amarillo', '92BBY', 'hombre', 44, '2014-12-20 10:15:32.293000' ), 
( 53, 'Kit Fisto', '196', '87', 'calvo', 'verde', 'negro', NULL, 'hombre', 45, '2014-12-20 10:18:57.202000' ), 
( 54, 'Eeth Koth', '171', NULL, 'negro', 'marrón', 'marrón', NULL, 'hombre', 46, '2014-12-20 10:26:47.902000' ), 
( 55, 'Adi Gallia', '184', '50', 'calvo', 'oscuro', 'azul', NULL, 'mujer', 10, '2014-12-20 10:29:11.661000' ), 
( 56, 'Saesee Tiin', '188', NULL, 'calvo', 'pálido', 'naranja', NULL, 'hombre', 48, '2014-12-20 10:32:11.669000' ), 
( 57, 'Yarael Poof', '264', NULL, 'calvo', 'blanco', 'amarillo', NULL, 'hombre', 49, '2014-12-20 10:34:48.725000' ), 
( 58, 'Plo Koon', '188', '80', 'calvo', 'naranja', 'negro', '22BBY', 'hombre', 50, '2014-12-20 10:49:19.859000' ), 
( 59, 'Mas Amedda', '196', NULL, 'calvo', 'azul', 'azul', NULL, 'hombre', 51, '2014-12-20 10:53:26.457000' ), 
( 60, 'Gregar Typho', '185', '85', 'negro', 'oscuro', 'marrón', NULL, 'hombre', 9, '2014-12-20 11:10:10.381000' ), 
( 61, 'Cordé', '157', NULL, 'marrón', 'clara', 'marrón', NULL, 'mujer', 9, '2014-12-20 11:11:39.630000' ), 
( 62, 'Cliegg Lars', '183', NULL, 'marrón', 'castaño', 'azul', '82BBY', 'hombre', 2, '2014-12-20 15:59:03.958000' ), 
( 63, 'Poggle the Lesser', '183', '80', 'calvo', 'verde', 'amarillo', NULL, 'hombre', 12, '2014-12-20 16:40:43.977000' ), 
( 64, 'Luminara Unduli', '170', '56.2', 'negro', 'amarillo', 'azul', '58BBY', 'mujer', 52, '2014-12-20 16:45:53.668000' ), 
( 65, 'Barriss Offee', '166', '50', 'negro', 'amarillo', 'azul', '40BBY', 'mujer', 52, '2014-12-20 16:46:40.440000' ), 
( 66, 'Dormé', '165', NULL, 'marrón', 'clara', 'marrón', NULL, 'mujer', 9, '2014-12-20 16:49:14.640000' ), 
( 67, 'Dooku', '193', '80', 'blanco', 'castaño', 'marrón', '102BBY', 'hombre', 53, '2014-12-20 16:52:14.726000' ), 
( 68, 'Bail Prestor Organa', '191', NULL, 'negro', 'bronceado', 'marrón', '67BBY', 'hombre', 3, '2014-12-20 16:53:08.575000' ), 
( 69, 'Jango Fett', '183', '79', 'negro', 'bronceado', 'marrón', '66BBY', 'hombre', 53, '2014-12-20 16:54:41.620000' ), 
( 70, 'Zam Wesell', '168', '55', 'rubio', 'castaño, verde, amarillo', 'amarillo', NULL, 'mujer', 55, '2014-12-20 16:57:44.471000' ), 
( 71, 'Dexter Jettster', '198', '102', 'calvo', 'marrón', 'amarillo', NULL, 'hombre', 56, '2014-12-20 17:28:27.248000' ), 
( 72, 'Lama Su', '229', '88', 'calvo', 'gris', 'negro', NULL, 'hombre', 11, '2014-12-20 17:30:50.416000' ), 
( 73, 'Taun We', '213', NULL, 'calvo', 'gris', 'negro', NULL, 'mujer', 11, '2014-12-20 17:31:21.195000' ), 
( 74, 'Jocasta Nu', '167', NULL, 'blanco', 'castaño', 'azul', NULL, 'mujer', 10, '2014-12-20 17:32:51.996000' ), 
( 75, 'R4-P17', '96', NULL, 'calvo', 'plata, rojo', 'rojo, azul', NULL, 'mujer', 29, '2014-12-20 17:43:36.409000' ), 
( 76, 'Wat Tambor', '193', '48', 'calvo', 'verde, gris', NULL, NULL, 'hombre', 57, '2014-12-20 17:53:52.607000' ), 
( 77, 'San Hill', '191', NULL, 'calvo', 'gris', 'dorado', NULL, 'hombre', 58, '2014-12-20 17:58:17.049000' ), 
( 78, 'Shaak Ti', '178', '57', 'calvo', 'rojo, azul, blanco', 'negro', NULL, 'mujer', 59, '2014-12-20 18:44:01.103000' ), 
( 79, 'Grievous', '216', '159', 'calvo', 'marrón, blanco', 'verde, amarillo', NULL, 'hombre', 60, '2014-12-20 19:43:53.348000' ), 
( 80, 'Tarfful', '234', '136', 'marrón', 'marrón', 'azul', NULL, 'hombre', 15, '2014-12-20 19:46:34.209000' ), 
( 81, 'Raymus Antilles', '188', '79', 'marrón', 'clara', 'marrón', NULL, 'hombre', 3, '2014-12-20 19:49:35.583000' ), 
( 82, 'Sly Moore', '178', '48', 'calvo', 'pálido', 'blanco', NULL, 'mujer', 61, '2014-12-20 20:18:37.619000' ), 
( 83, 'Tion Medon', '206', '80', 'calvo', 'gris', 'negro', NULL, 'hombre', 13, '2014-12-20 20:35:04.260000' ), 
( 89, 'Cornelius Evazan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL ), 
( 90, 'Ponda Baba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL ), 
( 91, 'General Rieekan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL ), 
( 92, 'Admiral Motti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL ), 
( 93, 'Admiral Piett', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL ), 
( 94, 'Major Bren Derlin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL ), 
( 95, 'Rancor Keeper', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL ), 
( 96, 'Admiral Ozzel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL ), 
( 97, 'Finn', NULL, NULL, 'negro', 'oscuro', 'oscuro', NULL, 'hombre', 29, '2015-04-17 06:52:40.793621' ), 
( 98, 'Rey', NULL, NULL, 'marrón', 'clara', 'avellana', NULL, 'mujer', 29, '2015-04-17 06:54:01.495077' ), 
( 99, 'Poe Dameron', NULL, NULL, 'marrón', 'clara', 'marrón', NULL, 'hombre', 29, '2015-04-17 06:55:21.622786' ), 
( 100, 'BB8', NULL, NULL, 'calvo', 'calvo', 'negro', NULL, 'calvo', 29, '2015-04-17 06:57:38.061346' ), 
( 101, 'Captain Phasma', NULL, NULL, NULL, NULL, NULL, NULL, 'mujer', 29, '2015-10-13 10:35:39.229823' );
	

INSERT INTO personajeAsociacion ( fkPersonaje, fkAsociacion )
VALUES
( 1, 1 ), ( 1, 2 ), ( 2, 8 ), ( 3, 2 ), ( 3, 3 ), ( 4, 4 ), ( 4, 5 ), ( 5, 2 ), ( 5, 6 ), ( 6, 8 ), ( 7, 8 ), ( 8, 8 ), ( 9, 2 ), ( 10, 1 ), 
( 11, 1 ), ( 12, 3 ), ( 13, 2 ), ( 14, 2 ), ( 15, 8 ), ( 16, 8 ), ( 18, 2 ), ( 19, 2 ), ( 20, 1 ), 
( 21, 3 ), ( 22, 8 ), ( 23, 8 ), ( 24, 8 ), ( 25, 2 ), ( 26, 8 ), ( 27, 2 ), ( 28, 2 ), ( 29, 2 ), ( 30, 2 ), 
( 31, 2 ), ( 32, 1 ), ( 33, 8 ), ( 34, 3 ), ( 35, 3 ), ( 36, 3 ), ( 37, 3 ), ( 38, 10 ), ( 39, 11 ), ( 40, 8 ), 
( 41, 8 ), ( 42, 12 ), ( 43, 8 ), ( 44, 5 ), ( 45, 8 ), ( 46, 1 ), ( 47, 8 ), ( 48, 8 ), ( 49, 8 ), ( 50, 8 ), 
( 51, 1 ), ( 52, 1 ), ( 53, 1 ), ( 54, 1 ), ( 55, 1 ), ( 56, 1 ), ( 57, 1 ), ( 58, 1 ), ( 59, 3 ), ( 60, 12 ), 
( 61, 8 ), ( 62, 8 ), ( 63, 8 ), ( 64, 1 ), ( 65, 1 ), ( 66, 8 ), ( 67, 1 ), ( 68, 2 ), ( 69, 8 ), ( 70, 8 ), 
( 71, 8 ), ( 72, 8 ), ( 73, 3 ), ( 74, 1 ), ( 75, 1 ), ( 76, 8 ), ( 77, 8 ), ( 78, 1 ), ( 79, 8 ), ( 80, 3 ), 
( 81, 7 ), ( 82, 3 ), ( 83, 8 ), ( 89, 8 ), ( 90, 8 ), 
( 91, 2 ), ( 92, 4 ), ( 93, 4 ), ( 94, 2 ), ( 95, 8 ), ( 96, 4 );


INSERT INTO pelicula ( idPelicula, episodio, titulo )
VALUES
	( 1, 'Episodio I', 'La Amenaza fantasma' ), 
	( 2, 'Episodio II', 'El ataque de los Clones' ), 
	( 3, 'Episodio III', 'La venganza de los Sith' ), 
	( 4, 'Episodio IV', 'Una nueva esperanza' ), 
	( 5, 'Episodio V', 'El Imperio contraataca' ), 
	( 6, 'Episodio VI', 'El retorno del Jedi' );
	

INSERT INTO personajePelicula ( fkPersonaje, fkPelicula )
VALUES
( 1, 4 ), ( 1, 5 ), ( 1, 6 ), 
( 2, 1 ), ( 2, 2 ), ( 2, 3 ), ( 2, 4 ), ( 2, 5 ), ( 2, 6 ), 
( 3, 1 ), ( 3, 2 ), ( 3, 3 ), ( 3, 4 ), ( 3, 5 ), ( 3, 6 ), 
( 4, 3 ), ( 4, 4 ), ( 4, 5 ), ( 4, 6 ), 
( 5, 4 ), ( 5, 5 ), ( 5, 6 ), 
( 6, 2 ), ( 6, 3 ), ( 6, 4 ), 
( 7, 2 ), ( 7, 3 ), ( 7, 4 ), 
( 8, 4 ), 
( 9, 4 ), 
( 10, 1 ), ( 10, 2 ), ( 10, 3 ), ( 10, 4 ), 
( 11, 1 ), ( 11, 2 ), ( 11, 3 ), 
( 12, 4 ), 
( 13, 3 ), ( 13, 4 ), ( 13, 5 ), ( 13, 6 ), 
( 14, 4 ), ( 14, 5 ), ( 14, 6 ), 
( 15, 4 ), 
( 16, 6 ), 
( 18, 4 ), ( 18, 5 ), ( 18, 6 ), 
( 19, 4 ), 
( 20, 1 ), ( 20, 2 ), ( 20, 3 ), ( 20, 5 ), ( 20, 6 ), 
( 21, 1 ), ( 21, 2 ), ( 21, 3 ), ( 21, 5 ), ( 21, 6 ), 
( 22, 2 ), ( 22, 5 ), ( 22, 6 ), 
( 23, 5 ), 
( 24, 5 ), 
( 25, 5 ), ( 25, 6 ), 
( 26, 5 ), 
( 27, 6 ), 
( 28, 6 ), 
( 29, 6 ), 
( 30, 6 ), 
( 31, 6 ), 
( 32, 1 ), 
( 33, 1 ), ( 33, 2 ), ( 33, 3 ), 
( 34, 1 ), 
( 35, 1 ), ( 35, 2 ), 
( 36, 3 ), ( 36, 1 ), ( 36, 2 ), 
( 37, 1 ), 
( 38, 1 ), 
( 39, 1 ), 
( 40, 1 ), ( 40, 2 ), 
( 41, 1 ), 
( 42, 1 ), 
( 43, 1 ), ( 43, 2 ), 
( 44, 1 ), 
( 45, 6 ), 
( 46, 1 ), ( 46, 2 ), ( 46, 3 ), 
( 47, 1 ), 
( 48, 1 ), 
( 49, 1 ), 
( 50, 1 ), 
( 51, 1 ), ( 51, 2 ), ( 51, 3 ), 
( 52, 1 ), ( 52, 2 ), ( 52, 3 ), 
( 53, 1 ), ( 53, 2 ), ( 53, 3 ), 
( 54, 1 ), ( 54, 3 ), 
( 55, 1 ), ( 55, 3 ), 
( 56, 1 ), ( 56, 3 ), 
( 57, 1 ), 
( 58, 1 ), ( 58, 2 ), ( 58, 3 ), 
( 59, 1 ), ( 59, 2 ), 
( 60, 2 ), 
( 61, 2 ), 
( 62, 2 ), 
( 63, 2 ), ( 63, 3 ), 
( 64, 2 ), ( 64, 3 ), 
( 65, 2 ), 
( 66, 2 ), 
( 67, 2 ), ( 67, 3 ), 
( 68, 2 ), ( 68, 3 ), 
( 69, 2 ), 
( 70, 2 ), 
( 71, 2 ), 
( 72, 2 ), 
( 73, 2 ), 
( 74, 2 ), 
( 75, 2 ), 
( 76, 3 ), ( 76, 2 ), 
( 77, 2 ), 
( 78, 2 ), ( 78, 3 ), 
( 79, 3 ), 
( 80, 3 ), 
( 81, 3 ), ( 81, 4 ), 
( 82, 2 ), ( 82, 3 ), 
( 83, 3 ), 
( 89, 4 ), 
( 90, 4 ), 
( 91, 5 ), 
( 92, 5 ), 
( 93, 5 ), ( 93, 6 ), 
( 94, 5 ), 
( 95, 6 ), 
( 96, 5 );


INSERT INTO muerte ( idMuerte, fkFallecido, fkAsesino, fkPelicula )
  VALUES
( 1, 4, 21, 6 ), ( 2, 9, 21, 4 ), ( 3, 10, 4, 4 ), 	( 4, 12, 1, 4 ), 	( 5, 15, 14, 4 ), 
( 6, 16, 5, 6 ), ( 7, 21, 4, 6 ), ( 8, 32, 44, 1 ), ( 9, 33, 21, 6 ), ( 10, 37, 79, NULL ), 
( 11, 44, 10, 1 ), ( 12, 51, 21, 3 ), ( 13, 53, 21, 3 ), ( 14, 56, 21, 3 ), ( 15, 60, 4, NULL ), 
( 16, 61, 70, 2 ), ( 17, 63, 4, 3 ), ( 18, 67, 4, 3 ), ( 19, 68, 12, 4 ), ( 20, 69, 51, 2 ), 
( 21, 70, 69, 2 ), ( 22, 76, 4, 3 ), ( 23, 77, 4, 3 ), ( 24, 79, 10, 3 ), ( 25, 81, 4, 4 ), ( 26, 92, 1, 4 ), ( 27, 93, 29, 6 ), ( 28, 96, 4, 5 );


/*-------------------------------------*/
/*--- Pruebas de inserción de datos ---*/
/*-------------------------------------*/

SELECT * FROM asociacion;
SELECT * FROM planeta;
SELECT * FROM personaje;
SELECT * FROM pelicula;
SELECT * FROM personajeAsociacion;
SELECT * FROM personajePelicula;
SELECT * FROM muerte;


