/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.3.15-MariaDB : Database - bdhospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bdhospital` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bdhospital`;

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `Dept_No` int(11) NOT NULL,
  `DNombre` varchar(50) DEFAULT NULL,
  `Loc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Dept_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dept` */

insert  into `dept`(`Dept_No`,`DNombre`,`Loc`) values (10,'CONTABILIDAD','ELCHE'),(20,'INVESTIGACIÓN','MADRID'),(30,'VENTAS','BARCELONA'),(40,'PRODUCCIÓN','SALAMANCA');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `Doctor_No` int(11) NOT NULL,
  `Hospital_Cod` int(11) NOT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Especialidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Doctor_No`),
  KEY `FK_Doctor_Hospital` (`Hospital_Cod`),
  CONSTRAINT `FK_Doctor_Hospital` FOREIGN KEY (`Hospital_Cod`) REFERENCES `hospital` (`Hospital_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `doctor` */

insert  into `doctor`(`Doctor_No`,`Hospital_Cod`,`Apellido`,`Especialidad`) values (386,22,'Cabeza D.','Psiquiatría'),(398,22,'Best D.','Urología'),(435,19,'López A.','Cardiología'),(453,22,'Gillberto','Pediatría'),(522,45,'Adams C.','Neurología'),(585,18,'Hernandez','Ginecología'),(607,45,'Chuki P.','Pediatría'),(982,18,'Cajal R.','Cardiología');

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `Emp_No` int(11) NOT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Oficio` varchar(50) DEFAULT NULL,
  `Dir` int(11) DEFAULT NULL,
  `Fecha_Alt` datetime DEFAULT NULL,
  `Salario` decimal(9,2) DEFAULT NULL,
  `Comision` decimal(9,2) DEFAULT NULL,
  `Dept_No` int(11) DEFAULT NULL,
  PRIMARY KEY (`Emp_No`),
  KEY `FK_Emp_Dept` (`Dept_No`),
  CONSTRAINT `FK_Emp_Dept` FOREIGN KEY (`Dept_No`) REFERENCES `dept` (`Dept_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp` */

insert  into `emp`(`Emp_No`,`Apellido`,`Oficio`,`Dir`,`Fecha_Alt`,`Salario`,`Comision`,`Dept_No`) values (7119,'SERRA','DIRECTOR',7839,'0000-00-00 00:00:00',225000.00,39000.00,20),(7322,'GARCIA','EMPLEADO',7119,'0000-00-00 00:00:00',129000.00,0.00,20),(7369,'SANCHEZ','EMPLEADO',7902,'0000-00-00 00:00:00',10400.00,0.00,20),(7499,'ARROYO','VENDEDOR',7698,'0000-00-00 00:00:00',208000.00,39000.00,30),(7521,'SALA','VENDEDOR',689,'0000-00-00 00:00:00',162500.00,65000.00,30),(7566,'JIMENEZ','DIRECTOR',7839,'0000-00-00 00:00:00',386750.00,0.00,20),(7654,'MARTIN','VENDEDOR',7698,'0000-00-00 00:00:00',182000.00,182000.00,30),(7698,'NEGRO','DIRECTOR',7839,'0000-00-00 00:00:00',370500.00,0.00,30),(7782,'CEREZO','DIRECTOR',7839,'0000-00-00 00:00:00',318500.00,0.00,10),(7788,'NINO','ANALISTA',7566,'0000-00-00 00:00:00',390000.00,0.00,20),(7839,'REY','PRESIDENTE',0,'0000-00-00 00:00:00',650000.00,0.00,10),(7844,'TOVAR','VENDEDOR',7698,'0000-00-00 00:00:00',195000.00,0.00,30),(7876,'ALONSO','EMPLEADO',7788,'0000-00-00 00:00:00',143000.00,0.00,20),(7900,'JIMENO','EMPLEADO',7698,'0000-00-00 00:00:00',123500.00,0.00,30),(7902,'FERNANDEZ','ANALISTA',7566,'0000-00-00 00:00:00',390000.00,0.00,20),(7934,'MUÑOZ','EMPLEADO',7782,'0000-00-00 00:00:00',169000.00,0.00,10);

/*Table structure for table `enfermo` */

DROP TABLE IF EXISTS `enfermo`;

CREATE TABLE `enfermo` (
  `Inscripcion` int(11) NOT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Fecha_Nac` varchar(50) DEFAULT NULL,
  `S` varchar(2) DEFAULT NULL,
  `NSS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enfermo` */

insert  into `enfermo`(`Inscripcion`,`Apellido`,`Direccion`,`Fecha_Nac`,`S`,`NSS`) values (10995,'Laguía M.','Goya 20','16-may-56','M',280862422),(14024,'Fernández M.','Recoletos 50','21-may-60','F',284991452),(18004,'Serrano V.','Alcalá 12','23-jun-67','F',321790059),(36658,'Domin S.','Mayor 71','01-ene-42','M',160654471),(38702,'Neal R.','Orense 11','18-jun-40','F',380010217),(39217,'Cervantes M.','Perón 38','29-feb-52','M',440294390),(59076,'Miller B.','López de Hoyos 2','16-sep-45','F',311969044),(63827,'Ruiz P.','Ezquerdo 103','26-dic-80','M',100973253),(64823,'Fraiser A.','Soto 3','10-jul-80','F',285201776),(74835,'Benítez E.','Argentina','05-oct-57','M',154811767);

/*Table structure for table `hospital` */

DROP TABLE IF EXISTS `hospital`;

CREATE TABLE `hospital` (
  `Hospital_Cod` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Num_Cama` int(11) DEFAULT NULL,
  PRIMARY KEY (`Hospital_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hospital` */

insert  into `hospital`(`Hospital_Cod`,`Nombre`,`Direccion`,`Telefono`,`Num_Cama`) values (18,'General','Atocha s/n','595-3111',987),(19,'Provincial','O Donell 50','964-4256',502),(22,'La Paz','Castellana 1000','923-5411',412),(45,'San Carlos','Ciudad Universitaria','597-1500',845);

/*Table structure for table `plantilla` */

DROP TABLE IF EXISTS `plantilla`;

CREATE TABLE `plantilla` (
  `Empleado_No` int(11) NOT NULL,
  `Sala_Cod` int(11) NOT NULL,
  `Hospital_Cod` int(11) NOT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Funcion` varchar(50) DEFAULT NULL,
  `T` varchar(15) DEFAULT NULL,
  `Salario` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`Empleado_No`),
  KEY `FK_Plantilla_Sala01` (`Sala_Cod`,`Hospital_Cod`),
  CONSTRAINT `FK_Plantilla_Sala01` FOREIGN KEY (`Sala_Cod`, `Hospital_Cod`) REFERENCES `sala` (`Sala_Cod`, `Hospital_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plantilla` */

insert  into `plantilla`(`Empleado_No`,`Sala_Cod`,`Hospital_Cod`,`Apellido`,`Funcion`,`T`,`Salario`) values (1009,6,22,'Higueras D.','Enfermera','T',200500.00),(1280,4,45,'Amigo R.','Interino','N',221000.00),(3106,6,19,'Hernández','Enfermero','T',275000.00),(3754,6,19,'Díaz B.','Enfermera','T',226200.00),(6065,1,22,'Rivera G.','Enfermera','N',162600.00),(6357,4,18,'Karplus W.','Interino','T',337900.00),(7379,1,22,'Carlos R.','Enfermera','T',211900.00),(8422,6,22,'Bocina G.','Enfermero','M',183800.00),(8526,1,45,'Frank H.','Enfermera','T',252200.00),(9901,2,22,'Núñez C.','Interino','M',221000.00);

/*Table structure for table `sala` */

DROP TABLE IF EXISTS `sala`;

CREATE TABLE `sala` (
  `Sala_Cod` int(11) NOT NULL,
  `Hospital_Cod` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Num_Cama` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sala_Cod`,`Hospital_Cod`),
  KEY `FK_Sala_Hospital` (`Hospital_Cod`),
  CONSTRAINT `FK_Sala_Hospital` FOREIGN KEY (`Hospital_Cod`) REFERENCES `hospital` (`Hospital_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sala` */

insert  into `sala`(`Sala_Cod`,`Hospital_Cod`,`Nombre`,`Num_Cama`) values (1,22,'Recuperación',10),(1,45,'Recuperación',15),(2,22,'Maternidad',34),(2,45,'Maternidad',24),(3,18,'Cuidados Intensivos',10),(3,19,'Cuidados Intensivos',21),(4,18,'Cardiología',53),(4,45,'Cardiología',55),(6,19,'Psiquiátricos',67),(6,22,'Psiquiátricos',118);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
