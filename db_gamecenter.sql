/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.16 : Database - db_gamecenter
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_gamecenter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_gamecenter`;

/*Table structure for table `tblbitacora` */

DROP TABLE IF EXISTS `tblbitacora`;

CREATE TABLE `tblbitacora` (
  `id_bitacora` INT(11) NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(100) DEFAULT NULL,
  `fecha` DATE DEFAULT NULL,
  `datos_viejos` VARCHAR(500) DEFAULT NULL,
  `datos_nuevos` VARCHAR(500) DEFAULT NULL,
  `operacion` VARCHAR(100) DEFAULT NULL,
  `tabla` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id_bitacora`)
) ;

/*Data for the table `tblbitacora` */

LOCK TABLES `tblbitacora` WRITE;


UNLOCK TABLES;

/*Table structure for table `tblcategoria` */

DROP TABLE IF EXISTS `tblcategoria`;

CREATE TABLE `tblcategoria` (
  `id_categoria` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
);

/*Data for the table `tblcategoria` */

LOCK TABLES `tblcategoria` WRITE;

INSERT  INTO `tblcategoria`(`id_categoria`,`nombre_categoria`) VALUES 
(4,'521552'),
(5,'nnananana'),
(6,'nnanananasdfvf'),
(7,'grewfe'),
(8,'r3wwegefgf'),
(9,'dfsesfrer'),
(10,'dfsewfrewf');

UNLOCK TABLES;

/*Table structure for table `tblinventario` */

DROP TABLE IF EXISTS `tblinventario`;

CREATE TABLE `tblinventario` (
  `id_inventario` INT(11) NOT NULL AUTO_INCREMENT,
  `id_producto` INT(11) NOT NULL,
  `precio_venta` FLOAT NOT NULL,
  `precio_compra` FLOAT NOT NULL,
  `cantidad_stock` INT(11) NOT NULL,
  `fecha_ultima_compra` DATE DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `tblinventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tblproductos` (`id_producto`)
) ;

/*Data for the table `tblinventario` */

LOCK TABLES `tblinventario` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblmarca` */

DROP TABLE IF EXISTS `tblmarca`;

CREATE TABLE `tblmarca` (
  `id_marca` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion_marca` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ;

/*Data for the table `tblmarca` */

LOCK TABLES `tblmarca` WRITE;

INSERT  INTO `tblmarca`(`id_marca`,`descripcion_marca`) VALUES 
(1,'sedfsefs');

UNLOCK TABLES;

/*Table structure for table `tblproductos` */

DROP TABLE IF EXISTS `tblproductos`;

CREATE TABLE `tblproductos` (
  `id_producto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(80) NOT NULL,
  `id_marca` INT(11) NOT NULL,
  `modelo` VARCHAR(60) NOT NULL,
  `id_categoria` INT(11) NOT NULL,
  `precio` FLOAT NOT NULL,
  `serial` VARCHAR(32) NOT NULL,
  `descripcion` VARCHAR(500)NOT NULL,
  `fotografia` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `tblproductos_ibfk_2` (`id_marca`),
  CONSTRAINT `tblproductos_ibfk_3` FOREIGN KEY (`id_categoria`) REFERENCES `tblcategoria` (`id_categoria`) ON DELETE CASCADE,
  CONSTRAINT `tblproductos_ibfk_4` FOREIGN KEY (`id_marca`) REFERENCES `tblmarca` (`id_marca`) ON DELETE CASCADE
) ;

/*Data for the table `tblproductos` */

LOCK TABLES `tblproductos` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbltipo_usuario` */

DROP TABLE IF EXISTS `tbltipo_usuario`;

CREATE TABLE `tbltipo_usuario` (
  `id_tipo` INT(11) NOT NULL AUTO_INCREMENT,
  `vch_descripcion` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_tipo`)
);
/*Data for the table `tbltipo_usuario` */

LOCK TABLES `tbltipo_usuario` WRITE;

INSERT  INTO `tbltipo_usuario`(`id_tipo`,`vch_descripcion`) VALUES 
(1,'Administrador'),
(2,'Cliente');

UNLOCK TABLES;

/*Table structure for table `tblusuarios` */

DROP TABLE IF EXISTS `tblusuarios`;

CREATE TABLE `tblusuarios` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `apellidos` VARCHAR(30) NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `correo` VARCHAR(60) NOT NULL,
  `telefono` VARCHAR(12) NOT NULL,
  `nombre_usuario` VARCHAR(16) NOT NULL,
  `contrasena` VARCHAR(16) NOT NULL,
  `id_tipo` INT(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `tblusuarios_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tbltipo_usuario` (`id_tipo`)
) ;

/*Data for the table `tblusuarios` */

LOCK TABLES `tblusuarios` WRITE;

INSERT  INTO `tblusuarios`(`id_usuario`,`nombre`,`apellidos`,`direccion`,`correo`,`telefono`,`nombre_usuario`,`contrasena`,`id_tipo`) VALUES 
(30,'kjkj','kjkjkj','jkljkl','angeldenato@gmail.com','9898908989','8jkj098','980809',1),
(31,'Otakuehjgsdajdajsd','Reyes','Nani','hueloaotaku@osiosi.com','0110110110','Nope','asdfghjkl',2),
(32,'Jose Emmanuel','Reyes Garcia','Calle Buena Vista, Numero 77, Mirador','coolboylemx14@gmail.com','7711424802','angel','angel',2),
(39,'frgtretgfhr','rgffrtf','rghrtfhtrgfh','ergtregtfrghf','12365896','dgfnfdgfrf','dfbdgr',2);

UNLOCK TABLES;

/*Table structure for table `tblventas` */

DROP TABLE IF EXISTS `tblventas`;

CREATE TABLE `tblventas` (
  `id_venta` INT(11) NOT NULL AUTO_INCREMENT,
  `id_producto` INT(11) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  `int_cantidad` INT(11) NOT NULL,
  `flt_total` FLOAT NOT NULL,
  `vch_fecha_venta` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_usuario` (`id_usuario`),
  KEY `fk_producto` (`id_producto`),
  CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `tblproductos` (`id_producto`) ON DELETE CASCADE,
  CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tblusuarios` (`id_usuario`) ON DELETE CASCADE
);

/*Data for the table `tblventas` */

LOCK TABLES `tblventas` WRITE;

UNLOCK TABLES;

/* Trigger structure for table `tblproductos` */

DELIMITER $$

DROP TRIGGER IF EXISTS `trg_insertaproducto` $$

CREATE TRIGGER `trg_insertaproducto` AFTER INSERT ON `tblproductos` FOR EACH ROW BEGIN
	INSERT INTO tblbitacora(usuario, fecha, datos_viejos, datos_nuevos, operacion, tabla)
	VALUES(CURRENT_USER(), NOW(), NULL,
	CONCAT("NombrePro:", new.nombre_producto, " id_Marca:", new.id_marca, " Modelo:",new.modelo, " id_Categoria:",new.id_categoria, " Precio:",new.precio, " Serial:",new.serial, " Descripcion:",new.descripcion, " Fotografia:",new.fotografia), "Insertar", "tblproductos");
    END;$$


DELIMITER ;

/* Trigger structure for table `tblproductos` */

DELIMITER $$

DROP TRIGGER IF EXISTS trg_actualizaproducto $$

CREATE TRIGGER `trg_actualizaproducto` AFTER UPDATE ON `tblproductos` FOR EACH ROW BEGIN
	INSERT INTO tblbitacora(usuario, fecha, datos_viejos, datos_nuevos, operacion, tabla)
	VALUES(CURRENT_USER(), NOW(), CONCAT("NombrePro:", old.nombre_producto, " id_Marca:", old.id_marca, " Modelo:",old.modelo, " id_Categoria:",old.id_categoria, " Precio:",old.precio, " Serial:",old.serial, " Descripcion:",old.descripcion, " Fotografia:",old.fotografia),
	CONCAT("NombrePro:", new.nombre_producto, " id_Marca:", new.id_marca, " Modelo:",new.modelo, " id_Categoria:",new.id_categoria, " Precio:",new.precio, " Serial:",new.serial, " Descripcion:",new.descripcion, " Fotografia:",new.fotografia), "Actualizar", "tblproductos");
    END;$$


DELIMITER ;

/* Trigger structure for table `tblproductos` */

DELIMITER $$

DROP TRIGGER `trg_eliminaproducto` $$

CREATE TRIGGER `trg_eliminaproducto` AFTER DELETE ON `tblproductos` FOR EACH ROW BEGIN
	INSERT INTO tblbitacora(usuario, fecha, datos_viejos, datos_nuevos, operacion, tabla)
	VALUES(CURRENT_USER(), NOW(), CONCAT("NombrePro:", old.nombre_producto, " id_Marca:", old.id_marca, " Modelo:",old.modelo, " id_Categoria:",old.id_categoria, " Precio:",old.precio, " Serial:",old.serial, " Descripcion:",old.descripcion, " Fotografia:",old.fotografia),
	NULL, "Eliminar", "tblproductos");
    END;$$


DELIMITER ;

/* Trigger structure for table `tblusuarios` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_insertausuarios` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trg_insertausuarios` AFTER INSERT ON `tblusuarios` FOR EACH ROW BEGIN
	
	INSERT INTO tblbitacora(usuario, fecha, datos_viejos, datos_nuevos, operacion, tabla)
	VALUES(CURRENT_USER(), NOW(), NULL, CONCAT("Nombre:", new.nombre, " Apellidos:", new.apellidos, " Direccion:", new.direccion, " Correo:", new.correo, " Telefono:", new.telefono, " Usuario:", new.nombre_usuario, " Contraseña:", new.contrasena, " IdTipo:", new.id_tipo), "Insertar", "tblusuarios");
    END */$$


DELIMITER ;

/* Trigger structure for table `tblusuarios` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_actualizausuarios` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trg_actualizausuarios` AFTER UPDATE ON `tblusuarios` FOR EACH ROW BEGIN
	INSERT INTO tblbitacora(usuario, fecha, datos_viejos, datos_nuevos, operacion, tabla)
	VALUES(CURRENT_USER(), NOW(), CONCAT("Nombre:", old.nombre, " Apellidos:", old.apellidos, " Direccion:", old.direccion, " Correo:", old.correo, " Telefono:", old.telefono, " Usuario:", old.nombre_usuario, " Contraseña:", old.contrasena, " IdTipo:", old.id_tipo),
	CONCAT("Nombre:", new.nombre, " Apellidos:", new.apellidos, " Direccion:", new.direccion, " Correo:", new.correo, " Telefono:", new.telefono, " Usuario:", new.nombre_usuario, " Contraseña:", new.contrasena, " IdTipo:", new.id_tipo), "Actualizar", "tblusuarios");
    END */$$


DELIMITER ;

/* Trigger structure for table `tblusuarios` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_eliminausuarios` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trg_eliminausuarios` AFTER DELETE ON `tblusuarios` FOR EACH ROW BEGIN
	INSERT INTO tblbitacora(usuario, fecha, datos_viejos, datos_nuevos, operacion, tabla)
	VALUES(CURRENT_USER(), NOW(), CONCAT("Nombre:", old.nombre, " Apellidos:", old.apellidos, " Direccion:", old.direccion, " Correo:", old.correo, " Telefono:", old.telefono, " Usuario:", old.nombre_usuario, " Contraseña:", old.contrasena, " IdTipo:", old.id_tipo),
	Null, "Eliminar", "tblusuarios");
    END */$$


DELIMITER ;

/* Procedure structure for procedure `sp_consultaproductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_consultaproductos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultaproductos`()
begin
select * from tblproductos;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
