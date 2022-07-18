/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.9-log : Database - bdescuela
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bdescuela` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bdescuela`;

/*Table structure for table `tblalumnos` */

DROP TABLE IF EXISTS `tblalumnos`;

CREATE TABLE `tblalumnos` (
  `vchMatricula` varchar(10) NOT NULL,
  `vchNombre` varchar(100) DEFAULT NULL,
  `vchApellido_p` varchar(50) DEFAULT NULL,
  `vchApellido_m` varchar(50) DEFAULT NULL,
  `Grupo` varchar(20) DEFAULT NULL,
  `imgRuta` text,
  `intId_beca` int(11) DEFAULT NULL,
  `intId_grado` int(11) DEFAULT NULL,
  PRIMARY KEY (`vchMatricula`),
  KEY `intId_beca` (`intId_beca`),
  KEY `intId_grado` (`intId_grado`),
  CONSTRAINT `tblalumnos_ibfk_1` FOREIGN KEY (`intId_beca`) REFERENCES `tblbecas` (`intId_beca`),
  CONSTRAINT `tblalumnos_ibfk_2` FOREIGN KEY (`intId_grado`) REFERENCES `tblgrado` (`intId_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tblalumnos` */

insert  into `tblalumnos`(`vchMatricula`,`vchNombre`,`vchApellido_p`,`vchApellido_m`,`Grupo`,`imgRuta`,`intId_beca`,`intId_grado`) values ('20181333','Royi','Hernadez','Perez2','A','4CvHHnL.jpg',4,1),('20181920','Olegario','perez','Hernandez','C','GOW4.jpeg',3,3);

/*Table structure for table `tblbecas` */

DROP TABLE IF EXISTS `tblbecas`;

CREATE TABLE `tblbecas` (
  `intId_beca` int(11) NOT NULL AUTO_INCREMENT,
  `vchNombre` varchar(20) DEFAULT NULL,
  `vchTipo_de_beca` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`intId_beca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tblbecas` */

insert  into `tblbecas`(`intId_beca`,`vchNombre`,`vchTipo_de_beca`) values (1,'oprtunidades','manutencion'),(2,'PRONAVE','manutencion'),(3,'Exelecia','Escolar'),(4,'No cuenta con beca','No cuenta con beca');

/*Table structure for table `tblcalificaciones` */

DROP TABLE IF EXISTS `tblcalificaciones`;

CREATE TABLE `tblcalificaciones` (
  `idCalif` int(11) NOT NULL AUTO_INCREMENT,
  `intBimestre_1` int(11) DEFAULT NULL,
  `intBimestre_2` int(11) DEFAULT NULL,
  `intBimestre_3` int(11) DEFAULT NULL,
  `intBimestre_4` int(11) DEFAULT NULL,
  `intBimestre_5` int(11) DEFAULT NULL,
  `vchMatriculaProfe` varchar(10) DEFAULT NULL,
  `vchMatriculaAlumno` varchar(10) DEFAULT NULL,
  `intIdMateria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCalif`),
  KEY `vchMatriculaProfe` (`vchMatriculaProfe`),
  KEY `vchMatriculaAlumno` (`vchMatriculaAlumno`),
  KEY `intIdMateria` (`intIdMateria`),
  CONSTRAINT `tblcalificaciones_ibfk_1` FOREIGN KEY (`vchMatriculaProfe`) REFERENCES `tblprofesor` (`vchMatricula`),
  CONSTRAINT `tblcalificaciones_ibfk_2` FOREIGN KEY (`vchMatriculaAlumno`) REFERENCES `tblalumnos` (`vchMatricula`),
  CONSTRAINT `tblcalificaciones_ibfk_3` FOREIGN KEY (`intIdMateria`) REFERENCES `tblmaterias` (`intId_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tblcalificaciones` */

/*Table structure for table `tblgrado` */

DROP TABLE IF EXISTS `tblgrado`;

CREATE TABLE `tblgrado` (
  `intId_grado` int(11) NOT NULL AUTO_INCREMENT,
  `vchGrado` varchar(10) DEFAULT NULL,
  `intCantidad_alumnos` int(11) DEFAULT NULL,
  PRIMARY KEY (`intId_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tblgrado` */

insert  into `tblgrado`(`intId_grado`,`vchGrado`,`intCantidad_alumnos`) values (1,'Primero',22),(2,'Segundo',32),(3,'Tercero',30);

/*Table structure for table `tblmaterias` */

DROP TABLE IF EXISTS `tblmaterias`;

CREATE TABLE `tblmaterias` (
  `intId_materia` int(11) NOT NULL AUTO_INCREMENT,
  `vchNombre_Materia` varchar(20) DEFAULT NULL,
  `vchMatricula` varchar(10) DEFAULT NULL,
  `intId_grado` int(11) DEFAULT NULL,
  PRIMARY KEY (`intId_materia`),
  KEY `vchMatricula` (`vchMatricula`),
  KEY `intId_grado` (`intId_grado`),
  CONSTRAINT `tblmaterias_ibfk_1` FOREIGN KEY (`vchMatricula`) REFERENCES `tblprofesor` (`vchMatricula`),
  CONSTRAINT `tblmaterias_ibfk_2` FOREIGN KEY (`intId_grado`) REFERENCES `tblgrado` (`intId_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tblmaterias` */

insert  into `tblmaterias`(`intId_materia`,`vchNombre_Materia`,`vchMatricula`,`intId_grado`) values (1,'Calculo','4234234',3),(2,'Ciencias','4234234',1),(3,'Historia','4234234',1);

/*Table structure for table `tblprofesor` */

DROP TABLE IF EXISTS `tblprofesor`;

CREATE TABLE `tblprofesor` (
  `vchMatricula` varchar(10) NOT NULL,
  `vchNombre` varchar(100) DEFAULT NULL,
  `vchApellido_p` varchar(50) DEFAULT NULL,
  `vchApellido_m` varchar(50) DEFAULT NULL,
  `vchArea` varchar(20) DEFAULT NULL,
  `vchHorario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vchMatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tblprofesor` */

insert  into `tblprofesor`(`vchMatricula`,`vchNombre`,`vchApellido_p`,`vchApellido_m`,`vchArea`,`vchHorario`) values ('00000000','galindo','juarez','hdz','Logica','8:00-13:00'),('4234234','Alberto','Sanchez','Torres11','Matematicas','8:00-13:00');

/*Table structure for table `tbluser` */

DROP TABLE IF EXISTS `tbluser`;

CREATE TABLE `tbluser` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `vchUser` varchar(50) DEFAULT NULL,
  `vchPassword` varchar(30) DEFAULT NULL,
  `enmTipoUser` enum('Administrador','Profesor','Alumno') DEFAULT NULL,
  `vchMatriculaProfe` varchar(10) DEFAULT NULL,
  `vchMatriculaAlumno` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `vchMatriculaProfe` (`vchMatriculaProfe`),
  KEY `vchMatriculaAlumno` (`vchMatriculaAlumno`),
  CONSTRAINT `tbluser_ibfk_1` FOREIGN KEY (`vchMatriculaProfe`) REFERENCES `tblprofesor` (`vchMatricula`),
  CONSTRAINT `tbluser_ibfk_2` FOREIGN KEY (`vchMatriculaAlumno`) REFERENCES `tblalumnos` (`vchMatricula`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `tbluser` */

insert  into `tbluser`(`idUser`,`vchUser`,`vchPassword`,`enmTipoUser`,`vchMatriculaProfe`,`vchMatriculaAlumno`) values (1,'admin1','12345','Administrador',NULL,NULL),(11,'roge','12345','Alumno',NULL,'20181333'),(12,'ole','12345','Alumno',NULL,'20181920'),(13,'ola','12345','Alumno',NULL,'20181920'),(14,'ola','12345','Alumno',NULL,'20181920'),(15,'ola','12345','Alumno',NULL,'20181920'),(16,'ola','12333','Alumno',NULL,'20181920'),(19,'gali','12345','Profesor','00000000',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
