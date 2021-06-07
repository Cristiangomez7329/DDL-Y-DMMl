CREATE DATABASE  IF NOT EXISTS `culture_shot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `culture_shot`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: culture_shot
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `subtotal` decimal(20,3) DEFAULT NULL,
  `iva` decimal(20,3) NOT NULL,
  `id_usuarios` int NOT NULL,
  `id_tienda` int NOT NULL,
  `cantidad_productos` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usu_fac` (`id_usuarios`),
  KEY `fk_tie_fac` (`id_tienda`),
  CONSTRAINT `fk_tie_fac` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`),
  CONSTRAINT `fk_usu_fac` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (5,'2021-06-06 07:53:50',140.000,26.600,1,1,2),(6,'2021-06-06 09:50:15',106.600,20.250,2,2,3),(7,'2021-05-06 17:53:00',150.000,28.610,3,3,1),(8,'2021-01-05 07:30:30',388.000,73.720,4,4,2),(9,'2021-09-05 08:54:10',203.000,39.710,5,5,2);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_productos`
--

DROP TABLE IF EXISTS `factura_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_productos` (
  `id_factura` int NOT NULL,
  `id_productos` int NOT NULL,
  PRIMARY KEY (`id_factura`,`id_productos`),
  KEY `fk_pro_facpro` (`id_productos`),
  CONSTRAINT `fk_fac_facpro` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`),
  CONSTRAINT `fk_pro_facpro` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_productos`
--

LOCK TABLES `factura_productos` WRITE;
/*!40000 ALTER TABLE `factura_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(250) DEFAULT NULL,
  `descripcion` varchar(500) NOT NULL,
  `precio` decimal(20,3) DEFAULT NULL,
  `img` varchar(500) NOT NULL,
  `id_tienda` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tie_pro` (`id_tienda`),
  CONSTRAINT `fk_tie_pro` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Camiseta asta','color negro, estanpado \"black clover\", 100% algodon',60.000,'',1),(2,'Billetara Dragon Ball','Material: Cuero Sintético, Lona, tamaño: 11,5 * 9,5 cm',30.000,'',1),(3,'Alcancia sin cara traga monedas','De la serie: El Viaje de Chihiro, réplica, materiales: ABS/PVC,\naltura: 21 cm',80.000,'',1),(4,'Figura Jiraiya','De la serie: Naruto, réplica, materiales: ABS, PVC,\naltura: 19cm aprox.',60.000,'',1),(5,'Figura Freezer','Serie: Dragon Ball, Fabricante: Réplica, Materiales: ABS, PVC,\nAltura: 11 cm aprox.',45.000,'',1),(6,'Camiseta Estampada de Cómics Videojuegos Contra','Camiseta Estampada en Algodon 180 gramos \nestampado garantizado excelente calidad.',26.900,'',2),(7,'Camiseta Estampada de Cómics Avengers Stan Lee Marvel','Algodon 180 gramos estampado garantizado\nexcelente calidad estampado, Género: Hombre, Tipo de manga: Corta, Tipo de cuello: Redondo',26.900,'',2),(8,'Gorras para Hombres Anime Naruto','Gorras en malla de adultos unisex tipo \ncamionera ajustable económica de excelente calidad',14.900,'',2),(9,'Gorras Paletera Plana Adulto Comics Superman','Gorras plana de adulto estampada y \nbordadas con broche ajustable',37.900,'',2),(10,'Gorras Adulto Bandas Pink Floyd','Gorras en malla de adultos unisex tipo \ncamionera ajustable económica de excelente calidad',14.900,'',2),(11,'Medallas League Of Legends','medallas de material que no se oxida del videojuego\nde League of Legends',77.000,'',3),(12,'Figura Carnage','Figura de acción de Marvel Legends Carnage',150.000,'',3),(13,'Lampara de Stich','Lampara de buena calidad, serie: lilo y stitch ',60.000,'',3),(14,'Set Reloj De Bolsillo','Set Reloj De Bolsillo de la saga Full Metal Alchemist',50.000,'',3),(15,'Varita Harry Potter','Varita de la franquicia de Harry Potter buena calidad',45.000,'',3),(16,'Funko Pop Harry Potter Yule Dance','FIGURA COLECCIONABLE EN VINILO,\nPRODUCTO NUEVO ORIGINAL EN SU CAJA, TAMAÑO : 10 CMS',64.900,'',4),(17,'Funko Pop One Piece Luffy','FIGURA COLECCIONABLE EN VINILO,\nPRODUCTO NUEVO ORIGINAL EN SU CAJA, TAMAÑO : 10 CMS',99.900,'',4),(18,'Coraline Con Abrigo Neca Figura Posable Para Coleccionistas','FIGURA POSABLE COLECCIONABLE MARCA NECA, PUEDES MOVERLE LOS OJOS,\nPRODUCTO NUEVO ORIGINAL EN SU CAJA, TAMAÑO : 20 CMS',159.000,'',4),(19,'My Hero Academia Izuku Midoriya Figura McFarlane Toys','FIGURA ARTICULADA COLECCIONABLE, PRODUCTO NUEVO ORIGINAL EN SU CAJA, TAMAÑO : 18 CMS,\nINCLUYE BASE',129.000,'',4),(20,'Pocket Pop Llavero Baby Yoda Brazo Arriba','LLAVERO COLECCIONABLE EN VINILO,\nPRODUCTO NUEVO ORIGINAL EN SU CAJA, TAMAÑO : 4 CMS, PRODUCTO ORIGINAL MARCA FUNKO POP',39.000,'',4),(21,'Los tres Jokers','Llega el comic más esperado, Los Tres Jokers en pasta blanda, \nhistoria completa en un solo tomo',89.000,'',5),(22,'SPIDERMAN ARMAGEDON ARAÑA','Comic Spiderman Armagedón Araña, Editorial Ovnipress, \nIdioma Español, Tapa Blanda, 272 Páginas',93.000,'',5),(23,'BATMAN VOL 1 YO SOY GOTHAM','Comic Batman Vol 1 Yo Soy Gotham , \nEditorial Ecc ,192 Páginas, Idioma Español, Tapa Dura',103.000,'',5),(24,'BATMAN LA BROMA ASESINA MÁS EXTRAS','Comic Broma Asesina Más Extras, \nEditorial Ovnipress, Idioma Español, Tapa Blanda, 152 Páginas.',100.000,'',5),(25,'INVINCIBLE VOL 2','Comic Invincible Vol 2 , Editorial Kamite, \nIdioma Español, Tapa Blanda, 120 Páginas',50.000,'',5);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `num_rol` int NOT NULL,
  `tipo_rol` varchar(40) NOT NULL,
  PRIMARY KEY (`num_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador'),(2,'vendedor'),(3,'cliente');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_tienda` varchar(500) NOT NULL,
  `telefono` varchar(11) DEFAULT NULL,
  `direccion` varchar(500) NOT NULL,
  `correo_electronico` varchar(500) NOT NULL,
  `contraseña` varchar(500) NOT NULL,
  `num_rol` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  KEY `fk_rol_tie` (`num_rol`),
  CONSTRAINT `fk_rol_tie` FOREIGN KEY (`num_rol`) REFERENCES `rol` (`num_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,'Amaterasu Store','3164997839','Cra. 71d ##1a Sur-21, Bogotá','info@amaterasustore.co.','3175984',2),(2,'CAMISETAS comics Jk','310 3402853','Carrera 80 #, Cl. 47b Sur #31 SUR, Bogotá','info@camisetascomics.co','8925254gf',2),(3,'Anicomic Store','317 6856031','Cra. 100 ## 20-54 local 131, Bogotá','anicomicstore@gmail.com.','iuqyroir',2),(4,'La tienda del coleccionista','315 3310530','Calle 182 # 45-24 Bogotá, Colombia','contacto@latiendadelcoleccionista.com.co','8786dfsga',2),(5,'La baticueva tienda','322 7072476','Carrera 15 #80 - 76 Bogotá','labaticuevatienda@gmail.com','kjahgjad8797',2);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) NOT NULL,
  `telefono` varchar(11) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `correo_electronico` varchar(500) NOT NULL,
  `contraseña` varchar(500) NOT NULL,
  `num_rol` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  KEY `fk_rol_usu` (`num_rol`),
  CONSTRAINT `fk_rol_usu` FOREIGN KEY (`num_rol`) REFERENCES `rol` (`num_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Javier','Garcia','leothecat','3201458798','cra 34#84 a 64sur','javier@gmail.com','12345',3),(2,'Cristian','Garcia','ragnar032','3256479871','calle 34-4 a 67','cristian@gmail.com','98877',3),(3,'Cristian','Gomez','ozydeth','3207138529','cra 50 #84 a 77sur','cristiang@gmail.com','4567',3),(4,'Johan','Rodriguez','johanruo','3487569212','calle 13-4 bis','johan@gmail.com','9512',3),(5,'Sebastian','Rodriguez','squanchy','3148576598','cra 54#7 b76sur','sebas@gmail.com','7852',3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `total_venta` decimal(20,3) NOT NULL,
  `id_factura` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ven_fac` (`id_factura`),
  CONSTRAINT `fk_ven_fac` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2021-06-06 07:53:50',166.600,5),(2,'2021-06-06 09:50:15',126.850,6),(3,'2021-05-06 17:53:00',178.610,7),(4,'2021-01-05 07:30:30',461.720,8),(5,'2021-06-06 07:53:50',242.710,9);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-07 11:40:14
