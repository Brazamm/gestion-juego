-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: juego
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conexiones`
--

DROP TABLE IF EXISTS `conexiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conexiones` (
  `id_conexion` int NOT NULL AUTO_INCREMENT,
  `id_ubicacion_origen` int NOT NULL,
  `id_ubicacion_destino` int NOT NULL,
  `costo` int DEFAULT '1',
  PRIMARY KEY (`id_conexion`),
  KEY `id_ubicacion_origen` (`id_ubicacion_origen`),
  KEY `id_ubicacion_destino` (`id_ubicacion_destino`),
  CONSTRAINT `conexiones_ibfk_1` FOREIGN KEY (`id_ubicacion_origen`) REFERENCES `ubicaciones` (`id_ubicacion`),
  CONSTRAINT `conexiones_ibfk_2` FOREIGN KEY (`id_ubicacion_destino`) REFERENCES `ubicaciones` (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexiones`
--

LOCK TABLES `conexiones` WRITE;
/*!40000 ALTER TABLE `conexiones` DISABLE KEYS */;
INSERT INTO `conexiones` VALUES (1,1,2,5),(2,2,3,8),(3,4,5,6),(4,5,6,7),(5,7,8,4),(6,8,9,9),(7,10,11,6),(8,11,12,7),(9,14,13,5),(10,13,14,5);
/*!40000 ALTER TABLE `conexiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(50) NOT NULL,
  `estadisticas` json DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Equipo Pythones','{\"empates\": 3, \"derrotas\": 5, \"victorias\": 15}'),(2,'Equipo Javasfi','{\"empates\": 2, \"derrotas\": 4, \"victorias\": 18}'),(3,'Equipo Los ingenieros','{\"empates\": 4, \"derrotas\": 8, \"victorias\": 12}'),(4,'Equipo Tigres del norte','{\"empates\": 1, \"derrotas\": 2, \"victorias\": 20}'),(5,'Equipo Tigres del sur','{\"empates\": 5, \"derrotas\": 10, \"victorias\": 10}');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialpartidas`
--

DROP TABLE IF EXISTS `historialpartidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialpartidas` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_partida` int NOT NULL,
  `detalles` json DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_partida` (`id_partida`),
  CONSTRAINT `historialpartidas_ibfk_1` FOREIGN KEY (`id_partida`) REFERENCES `partidas` (`id_partida`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialpartidas`
--

LOCK TABLES `historialpartidas` WRITE;
/*!40000 ALTER TABLE `historialpartidas` DISABLE KEYS */;
INSERT INTO `historialpartidas` VALUES (1,1,'{\"evento\": \"Victoria cerrada en la Liga Pokémon.\"}'),(2,2,'{\"evento\": \"Batalla épica en el Monte Corona.\"}'),(3,3,'{\"evento\": \"Derrota aplastante en el Pilar Celeste.\"}'),(4,4,'{\"evento\": \"Combate entre entrenadores legendarios.\"}'),(5,5,'{\"evento\": \"Empate inesperado en la Ciudad Azalea.\"}');
/*!40000 ALTER TABLE `historialpartidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_items`
--

DROP TABLE IF EXISTS `inventario_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_items` (
  `id_inventario` int NOT NULL,
  `id_item` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_inventario`,`id_item`),
  KEY `id_item` (`id_item`),
  CONSTRAINT `inventario_items_ibfk_1` FOREIGN KEY (`id_inventario`) REFERENCES `inventarios` (`id_inventario`) ON DELETE CASCADE,
  CONSTRAINT `inventario_items_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `items` (`id_item`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_items`
--

LOCK TABLES `inventario_items` WRITE;
/*!40000 ALTER TABLE `inventario_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarios`
--

DROP TABLE IF EXISTS `inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventarios` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `inventarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarios`
--

LOCK TABLES `inventarios` WRITE;
/*!40000 ALTER TABLE `inventarios` DISABLE KEYS */;
INSERT INTO `inventarios` VALUES (11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21);
/*!40000 ALTER TABLE `inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `nombre_item` varchar(50) NOT NULL,
  `descripcion` text,
  `id_inventario` int NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_inventario` (`id_inventario`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`id_inventario`) REFERENCES `inventarios` (`id_inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (11,'Poción','Restaura 20 PS.',11),(12,'Superpoción','Restaura 50 PS.',11),(13,'Revivir','Revive a un Pokémon debilitado.',12),(14,'Antídoto','Cura el envenenamiento.',12),(15,'MT: Rayo','Un potente ataque eléctrico.',13),(16,'MT: Terremoto','Un ataque devastador de tipo Tierra.',13),(17,'Baya Aranja','Restaura 10 PS automáticamente.',14),(18,'Baya Ziuela','Cura el estado de confusión.',14),(19,'Piedra Trueno','Hace evolucionar ciertos Pokémon eléctricos.',15),(20,'Piedra Agua','Hace evolucionar ciertos Pokémon de agua.',15);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mundos`
--

DROP TABLE IF EXISTS `mundos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mundos` (
  `id_mundo` int NOT NULL AUTO_INCREMENT,
  `nombre_mundo` varchar(50) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_mundo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mundos`
--

LOCK TABLES `mundos` WRITE;
/*!40000 ALTER TABLE `mundos` DISABLE KEYS */;
INSERT INTO `mundos` VALUES (1,'Kanto','Región inicial con ocho gimnasios y una Liga Pokémon.'),(2,'Johto','Una región rica en historia y leyendas Pokémon.'),(3,'Hoenn','Un lugar tropical con vastos océanos y montañas.'),(4,'Sinnoh','Con paisajes helados y antiguas ruinas.'),(5,'Unova','Una región avanzada y moderna.'),(6,'Colina Campestre de Quiba','Un mundo en el que lo unico que se ven ¡son colinas!'),(8,'Bolivar City','Es obligatorio aprender a esquivar');
/*!40000 ALTER TABLE `mundos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidas`
--

DROP TABLE IF EXISTS `partidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidas` (
  `id_partida` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `id_equipo_1` int NOT NULL,
  `id_equipo_2` int NOT NULL,
  `resultado` json DEFAULT NULL,
  PRIMARY KEY (`id_partida`),
  KEY `id_equipo_1` (`id_equipo_1`),
  KEY `id_equipo_2` (`id_equipo_2`),
  CONSTRAINT `partidas_ibfk_1` FOREIGN KEY (`id_equipo_1`) REFERENCES `equipos` (`id_equipo`),
  CONSTRAINT `partidas_ibfk_2` FOREIGN KEY (`id_equipo_2`) REFERENCES `equipos` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidas`
--

LOCK TABLES `partidas` WRITE;
/*!40000 ALTER TABLE `partidas` DISABLE KEYS */;
INSERT INTO `partidas` VALUES (1,'2024-12-01 00:00:00',1,2,'{\"puntos\": 100, \"ganador\": \"Equipo Pythones\"}'),(2,'2024-12-02 00:00:00',3,4,'{\"puntos\": 150, \"ganador\": \"Equipo Tigres del norte\"}'),(3,'2024-12-03 00:00:00',2,5,'{\"puntos\": 120, \"ganador\": \"Equipo Javasfi\"}'),(4,'2024-12-04 00:00:00',4,1,'{\"puntos\": 200, \"ganador\": \"Equipo Tigres del norte\"}'),(5,'2024-12-05 00:00:00',5,3,'{\"empate\": true, \"puntos\": 50}');
/*!40000 ALTER TABLE `partidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranking` (
  `id_ranking` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `puntuacion_global` int NOT NULL,
  PRIMARY KEY (`id_ranking`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranking`
--

LOCK TABLES `ranking` WRITE;
/*!40000 ALTER TABLE `ranking` DISABLE KEYS */;
INSERT INTO `ranking` VALUES (1,18,4300),(2,17,4200),(3,21,4100),(4,15,4000),(5,16,3900),(6,14,3500),(7,11,3200),(8,13,2900),(9,12,2750),(10,20,2650),(11,19,2600);
/*!40000 ALTER TABLE `ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `id_ubicacion` int NOT NULL AUTO_INCREMENT,
  `nombre_ubicacion` varchar(50) NOT NULL,
  `id_mundo` int NOT NULL,
  PRIMARY KEY (`id_ubicacion`),
  KEY `id_mundo` (`id_mundo`),
  CONSTRAINT `ubicaciones_ibfk_1` FOREIGN KEY (`id_mundo`) REFERENCES `mundos` (`id_mundo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (1,'Pueblo Paleta',1),(2,'Ciudad Celeste',1),(3,'Isla Canela',1),(4,'Ciudad Azalea',2),(5,'Ciudad Iris',2),(6,'Monte Plateado',2),(7,'Ciudad Portual',3),(8,'Arrecípolis',3),(9,'Pilar Celeste',3),(10,'Ciudad Puntaneva',4),(11,'Monte Corona',4),(12,'Ciudad Canal',4),(13,'Colina Mayor',6),(14,'Colina Mayor',6);
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `nivel` int NOT NULL,
  `puntuacion` int NOT NULL,
  `id_equipo` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (11,'Ash Ketchum',45,3200,1),(12,'Misty',38,2750,2),(13,'Brock',40,2900,2),(14,'Gary Oak',50,3500,3),(15,'Red',55,4000,4),(16,'Blue',53,3900,4),(17,'Lance',60,4200,5),(18,'Cynthia',62,4300,5),(19,'Dawn',35,2600,1),(20,'May',36,2650,1),(21,'Adan',55,4100,4);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'juego'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDatoDinamico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDatoDinamico`(
    IN nombreTabla VARCHAR(255),
    IN columnasYValores TEXT,  -- Ejemplo: "columna1 = 'valor1', columna2 = 'valor2'"
    IN condicion TEXT  -- Ejemplo: "id = 1"
)
BEGIN
    SET @query = CONCAT(
        'UPDATE ', nombreTabla, ' SET ', columnasYValores, ' WHERE ', condicion
    );
    
    -- Preparar y ejecutar la consulta dinámica
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarPosicionesRanking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPosicionesRanking`()
BEGIN
    -- Primero, aseguramos que la tabla de Ranking esté vacía antes de volver a calcular el ranking
    TRUNCATE TABLE Ranking;
    
    -- Insertamos en la tabla Ranking los jugadores, ordenados por su puntuación
    SET @posicion := 0;
    
    INSERT INTO Ranking (id_usuario, puntuacion_global)
    SELECT u.id_usuario, u.puntuacion
    FROM Usuarios u
    ORDER BY u.puntuacion DESC; -- Ordenamos de mayor a menor puntuación
    
    -- Recalcular el orden de los jugadores en el ranking
    UPDATE Ranking r
    JOIN (
        SELECT id_ranking, @posicion := @posicion + 1 AS nueva_posicion
        FROM Ranking
    ) AS ranked
    ON r.id_ranking = ranked.id_ranking
    SET r.id_ranking = ranked.nueva_posicion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarRanking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarRanking`()
BEGIN
    -- Actualizar el ranking según la puntuación de los jugadores
    UPDATE Ranking r
    JOIN Usuarios u ON r.id_usuario = u.id_usuario
    SET r.puntuacion_global = u.puntuacion
    WHERE u.puntuacion >= 0; -- Evitar el modo seguro
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AgregarItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarItem`(
    IN id_usuario INT,
    IN nombre_item VARCHAR(100),
    IN cantidad INT
)
BEGIN
    DECLARE id_item INT;
    DECLARE id_inventario INT;

    -- Obtener el ID del usuario (si no existe, lo creamos)
    SET id_inventario = (SELECT id_inventario FROM Inventarios WHERE id_usuario = id_usuario LIMIT 1);
    
    -- Si el jugador no tiene inventario, crear uno nuevo
    IF id_inventario IS NULL THEN
        INSERT INTO Inventarios (id_usuario) VALUES (id_usuario);
        SET id_inventario = LAST_INSERT_ID();
    END IF;

    -- Obtener el ID del ítem
    SET id_item = (SELECT id_item FROM Items WHERE nombre_item = nombre_item LIMIT 1);
    
    -- Si el ítem no existe, lo agregamos
    IF id_item IS NULL THEN
        INSERT INTO Items (nombre_item, descripcion, cantidad) VALUES (nombre_item, 'Descripción del ítem', cantidad);
        SET id_item = LAST_INSERT_ID();
    ELSE
        -- Si el ítem ya existe, solo actualizamos la cantidad
        UPDATE Items SET cantidad = cantidad + cantidad WHERE id_item = id_item;
    END IF;

    -- Agregar el ítem al inventario del jugador
    INSERT INTO Inventario_Items (id_inventario, id_item, cantidad) 
    VALUES (id_inventario, id_item, cantidad)
    ON DUPLICATE KEY UPDATE cantidad = cantidad + VALUES(cantidad);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CrearMundo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearMundo`(
    IN nombreMundo VARCHAR(50),
    IN descripcion VARCHAR(255),
    IN ubicaciones INT
)
BEGIN
    DECLARE id_mundo INT;
    DECLARE i INT DEFAULT 1;

    -- Crear el mundo
    INSERT INTO Mundos (nombre_mundo, descripcion) 
    VALUES (nombreMundo, descripcion);
    
    SET id_mundo = LAST_INSERT_ID();

    -- Crear ubicaciones aleatorias
    WHILE i <= ubicaciones DO
        INSERT INTO Ubicaciones (nombre_ubicacion, id_mundo) 
        VALUES (CONCAT('Ubicacion_', i), id_mundo);
        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarDatos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDatos`(
    IN nombreTabla VARCHAR(255),
    IN condicion VARCHAR(255)
)
BEGIN
    DECLARE query VARCHAR(1000);  -- Definir un tamaño adecuado para la variable query

    -- Generar la consulta de eliminación dinámica
    SET query = CONCAT('DELETE FROM ', nombreTabla, ' WHERE ', condicion);

    -- Asignar la consulta a una variable de sesión
    SET @query = query;

    -- Mostrar la consulta generada para depuración (opcional)
    SELECT @query;

    -- Preparar la consulta
    PREPARE stmt FROM @query;

    -- Ejecutar la consulta
    EXECUTE stmt;

    -- Liberar la consulta preparada
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarItem`(
    IN id_usuario INT, 
    IN nombre_item VARCHAR(100), 
    IN cantidad INT
)
BEGIN
    DECLARE id_item INT;
    DECLARE id_inventario INT;
    DECLARE cantidad_actual INT;

    -- Obtener el ID del inventario del jugador
    SELECT id_inventario INTO id_inventario
    FROM Inventarios WHERE id_usuario = id_usuario LIMIT 1;

    -- Obtener el ID del ítem
    SELECT id_item INTO id_item
    FROM Items WHERE nombre_item = nombre_item LIMIT 1;

    -- Verificar si el ítem existe en el inventario del jugador
    IF id_item IS NOT NULL AND id_inventario IS NOT NULL THEN
        
        -- Obtener la cantidad actual del ítem
        SELECT cantidad INTO cantidad_actual
        FROM Inventario_Items 
        WHERE id_inventario = id_inventario AND id_item = id_item 
        LIMIT 1;

        -- Verificar si hay suficiente cantidad
        IF cantidad_actual >= cantidad THEN
            -- Eliminar o reducir cantidad según sea el caso
            IF cantidad_actual = cantidad THEN
                DELETE FROM Inventario_Items 
                WHERE id_inventario = id_inventario AND id_item = id_item;
            ELSE
                UPDATE Inventario_Items 
                SET cantidad = cantidad_actual - cantidad 
                WHERE id_inventario = id_inventario AND id_item = id_item;
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'No hay suficiente cantidad de este ítem en el inventario.';
        END IF;

    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El ítem no existe en el inventario del jugador.';
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EncontrarRutaOptima` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EncontrarRutaOptima`(
    IN id_ubicacion_origen INT,
    IN id_ubicacion_destino INT
)
BEGIN
    -- Declarar las variables
    DECLARE minDistancia INT;
    DECLARE ubicacionActual INT;
    DECLARE i INT;
    DECLARE j INT;
    DECLARE siguiente INT;
    DECLARE costo INT;
    DECLARE distOrigen INT;
    DECLARE distSiguiente INT;
    DECLARE visitado INT;
    DECLARE distancia INT;
    DECLARE ruta VARCHAR(1000); -- Variable para almacenar la ruta
    DECLARE continuar INT DEFAULT 1; -- Variable para controlar la terminación del bucle

    -- Crear tabla temporal para almacenar distancias
    CREATE TEMPORARY TABLE Distancias (
        id_ubicacion INT PRIMARY KEY,
        distancia INT,
        visitado INT,
        anterior INT
    );

    -- Inicialización de distancias y tablas
    SET i = 1;
    WHILE i <= (SELECT COUNT(*) FROM Ubicaciones) DO
        INSERT INTO Distancias (id_ubicacion, distancia, visitado, anterior)
        VALUES (i, 999999, 0, NULL);
        SET i = i + 1;
    END WHILE;

    -- La distancia del origen es 0
    UPDATE Distancias SET distancia = 0 WHERE id_ubicacion = id_ubicacion_origen;

    -- Bucle principal de Dijkstra
    WHILE continuar DO
        SET minDistancia = 999999;
        SET ubicacionActual = NULL;

        -- Seleccionar la ubicación con la distancia mínima no visitada
        SET i = 1;
        WHILE i <= (SELECT COUNT(*) FROM Ubicaciones) DO
            -- Obtener valores de visitado y distancia
            SELECT visitado, distancia INTO visitado, distancia
            FROM Distancias WHERE id_ubicacion = i;

            IF visitado = 0 AND distancia < minDistancia THEN
                SET minDistancia = distancia;
                SET ubicacionActual = i;
            END IF;
            SET i = i + 1;
        END WHILE;

        -- Si no hay más ubicaciones para visitar, salir
        IF ubicacionActual IS NULL THEN
            SET continuar = 0; -- Cambiar la variable de control para terminar el bucle
        END IF;

        -- Marcar como visitado
        UPDATE Distancias SET visitado = 1 WHERE id_ubicacion = ubicacionActual;

        -- Actualizar distancias de las ubicaciones adyacentes
        SET j = 1;
        WHILE j <= (SELECT COUNT(*) FROM Conexiones WHERE id_ubicacion_origen = ubicacionActual) DO
            SELECT id_ubicacion_destino, costo INTO siguiente, costo
            FROM Conexiones WHERE id_ubicacion_origen = ubicacionActual LIMIT j, 1;

            -- Obtener las distancias necesarias para la comparación
            SELECT distancia INTO distOrigen FROM Distancias WHERE id_ubicacion = ubicacionActual;
            SELECT distancia INTO distSiguiente FROM Distancias WHERE id_ubicacion = siguiente;

            IF distOrigen + costo < distSiguiente THEN
                UPDATE Distancias SET distancia = distOrigen + costo WHERE id_ubicacion = siguiente;
                UPDATE Distancias SET anterior = ubicacionActual WHERE id_ubicacion = siguiente;
            END IF;

            SET j = j + 1;
        END WHILE;
    END WHILE;

    -- Imprimir la ruta óptima
    SET i = id_ubicacion_destino;
    SET ruta = '';
    WHILE i IS NOT NULL DO
        SELECT nombre_ubicacion INTO @nombreUbicacion FROM Ubicaciones WHERE id_ubicacion = i;
        SET ruta = CONCAT(@nombreUbicacion, ' -> ', ruta);
        SELECT anterior INTO i FROM Distancias WHERE id_ubicacion = i;
    END WHILE;

    SELECT CONCAT('Ruta óptima: ', ruta) AS Ruta;

    -- Limpiar la tabla temporal
    DROP TEMPORARY TABLE IF EXISTS Distancias;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarConexion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarConexion`(
    IN origen INT, 
    IN destino INT, 
    IN costo INT
)
BEGIN
    -- Verificar si la conexión ya existe
    IF NOT EXISTS (
        SELECT 1 
        FROM Conexiones 
        WHERE id_ubicacion_origen = origen 
          AND id_ubicacion_destino = destino
    ) THEN
        -- Insertar la conexión
        INSERT INTO Conexiones (id_ubicacion_origen, id_ubicacion_destino, costo) 
        VALUES (origen, destino, costo);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEnTablaDinamica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEnTablaDinamica`(
    IN nombreTabla VARCHAR(255), 
    IN campos VARCHAR(255), 
    IN valores TEXT
)
BEGIN
    -- Crear consulta dinámica
    SET @query = CONCAT('INSERT INTO ', nombreTabla, ' (', campos, ') VALUES (', valores, ')');
    
    -- Preparar y ejecutar la consulta
    PREPARE stmt FROM @query;
    EXECUTE stmt;

    -- Limpiar declaración preparada
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarTablaDinamica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTablaDinamica`(
    IN nombreTabla VARCHAR(255),
    IN valores TEXT
)
BEGIN
    DECLARE campos TEXT;

    -- Obtener los nombres de las columnas automáticamente, excluyendo las columnas autoincrementales
    SET @query = CONCAT(
        'SELECT GROUP_CONCAT(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS ',
        'WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = "', nombreTabla, '" ',
        'AND EXTRA != "auto_increment"'
    );

    -- Ejecutar la consulta para obtener los nombres de las columnas
    PREPARE stmt1 FROM @query;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;

    -- Asignar el resultado de la consulta a la variable 'campos'
    SET @campos = (SELECT GROUP_CONCAT(COLUMN_NAME) 
                   FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_SCHEMA = DATABASE() 
                   AND TABLE_NAME = nombreTabla 
                   AND EXTRA != "auto_increment");

    -- Generar la consulta para insertar los valores dinámicamente
    SET @insertQuery = CONCAT(
        'INSERT INTO ', nombreTabla, ' (', @campos, ') VALUES (', valores, ')'
    );

    -- Ejecutar la consulta de inserción
    PREPARE stmt2 FROM @insertQuery;
    EXECUTE stmt2;
    DEALLOCATE PREPARE stmt2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarUbicacionYConexion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUbicacionYConexion`(
    IN nombreUbicacion VARCHAR(50), 
    IN idMundo INT, 
    IN ubicacionConectada INT, 
    IN costo INT
)
BEGIN
    DECLARE nuevaUbicacion INT;

    -- Insertar la nueva ubicación
    INSERT INTO Ubicaciones (nombre_ubicacion, id_mundo) 
    VALUES (nombreUbicacion, idMundo);

    SET nuevaUbicacion = LAST_INSERT_ID();

    -- Crear conexión bidireccional
    INSERT INTO Conexiones (id_ubicacion_origen, id_ubicacion_destino, costo) 
    VALUES (nuevaUbicacion, ubicacionConectada, costo);

    INSERT INTO Conexiones (id_ubicacion_origen, id_ubicacion_destino, costo) 
    VALUES (ubicacionConectada, nuevaUbicacion, costo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarTabla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarTabla`(IN nombreTabla VARCHAR(255))
BEGIN
    SET @consulta = CONCAT('SELECT * FROM ', nombreTabla);
    PREPARE stmt FROM @consulta;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarPartida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarPartida`(
    IN equipo1 INT,
    IN equipo2 INT,
    IN resultado VARCHAR(50)
)
BEGIN
    DECLARE fecha_actual DATETIME DEFAULT NOW();
    DECLARE id_partida INT;

    -- Registrar la partida
    INSERT INTO Partidas (fecha, id_equipo_1, id_equipo_2, resultado) 
    VALUES (fecha_actual, equipo1, equipo2, resultado);
    
    SET id_partida = LAST_INSERT_ID();

    -- Actualizar el historial
    INSERT INTO HistorialPartidas (id_partida, detalles) 
    VALUES (id_partida, CONCAT('Resultado: ', resultado));

    -- Actualizar estadísticas de los equipos
    CASE resultado
        WHEN 'Empate' THEN 
            UPDATE Equipos 
            SET estadisticas = JSON_SET(estadisticas, '$.empates', JSON_EXTRACT(estadisticas, '$.empates') + 1) 
            WHERE id_equipo IN (equipo1, equipo2);
        
        WHEN 'Equipo 1 Gana' THEN 
            UPDATE Equipos 
            SET estadisticas = JSON_SET(estadisticas, '$.victorias', JSON_EXTRACT(estadisticas, '$.victorias') + 1) 
            WHERE id_equipo = equipo1;
            
            UPDATE Equipos 
            SET estadisticas = JSON_SET(estadisticas, '$.derrotas', JSON_EXTRACT(estadisticas, '$.derrotas') + 1) 
            WHERE id_equipo = equipo2;

        WHEN 'Equipo 2 Gana' THEN 
            UPDATE Equipos 
            SET estadisticas = JSON_SET(estadisticas, '$.victorias', JSON_EXTRACT(estadisticas, '$.victorias') + 1) 
            WHERE id_equipo = equipo2;
            
            UPDATE Equipos 
            SET estadisticas = JSON_SET(estadisticas, '$.derrotas', JSON_EXTRACT(estadisticas, '$.derrotas') + 1) 
            WHERE id_equipo = equipo1;
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VerMundos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VerMundos`()
BEGIN
    SELECT * FROM Mundos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-08 18:31:42
