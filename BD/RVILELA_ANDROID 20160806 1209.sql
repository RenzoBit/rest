-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.21


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema rvilela_android
--

CREATE DATABASE IF NOT EXISTS rvilela_android;
USE rvilela_android;

--
-- Definition of table `aviso`
--

DROP TABLE IF EXISTS `aviso`;
CREATE TABLE `aviso` (
  `id_aviso` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(64) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `id_usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_aviso`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `aviso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aviso`
--

/*!40000 ALTER TABLE `aviso` DISABLE KEYS */;
INSERT INTO `aviso` (`id_aviso`,`titulo`,`fecha_inicio`,`fecha_fin`,`estado`,`id_usuario`) VALUES 
 (1,'aviso 1','2016-01-01 00:00:00','2016-01-02 00:00:00',NULL,NULL),
 (2,'aviso 2','2016-01-02 00:00:00','2016-01-03 00:00:00',NULL,NULL),
 (3,'notificacion 1','2016-07-18 00:00:00','2016-07-19 00:00:00',NULL,NULL),
 (4,'notificacion 2','2016-06-18 00:00:00','2016-06-19 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `aviso` ENABLE KEYS */;


--
-- Definition of table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) DEFAULT NULL,
  `descripcion` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id_categoria`,`nombre`,`descripcion`) VALUES 
 (1,'Smartphones','Celulares inteligentes'),
 (2,'Tablet','Tablet'),
 (3,'Libros','Libros');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Definition of table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE `detalle_pedido` (
  `id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedido`,`id_producto`,`id_pedido`),
  KEY `id_producto` (`id_producto`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalle_pedido`
--

/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;


--
-- Definition of table `dispositivo`
--

DROP TABLE IF EXISTS `dispositivo`;
CREATE TABLE `dispositivo` (
  `id_dispositivo` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) DEFAULT NULL,
  `codigo_gcm` varchar(255) DEFAULT NULL,
  `aplicacion` varchar(255) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_dispositivo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispositivo`
--

/*!40000 ALTER TABLE `dispositivo` DISABLE KEYS */;
INSERT INTO `dispositivo` (`id_dispositivo`,`usuario`,`codigo_gcm`,`aplicacion`,`mac`) VALUES 
 (1,'r1','APA91bFqI-ffFkuYS3kTex8VMV1NttV1UodJ51zZLvD8WBmoJJBXI1LjdZpsPXF8_KfNKpCbSkwdLBb8rtHwpBlJjUfQ8MTZyXjVJqx3_ZHyafv5dJI1IAL8ejd23__RZwvNtJWQ_A3V','androidavanzado3','14:1a:a3:22:7d:ed'),
 (2,'r2','APA91bHGdy7C4TjbNne9xhfe8eJVchf_rm-x00tbh9w-xiokXedVxCw1PVJ5G_A3BKUYEYKaUmWQTvxrpVcsB1hgBOL-WR4D6cqZFtLVyvVeoAVdOSAQeKehQhCcR8bpfhz-dInv1QFx','androidavanzado3','ec:89:f5:9f:b6:e7'),
 (3,'r3','APA91bHC46MwaALIyR4Ssu869P7AcfxDFoJYk_YV9czEUTcZwqZbR4UlAE9xZtd6aOD3T3dSui0ps3KW8WnTuCRSfFCrmRRtTulynMmTK9BiAz9og5aBOR6ALJzabRTvqQK8_tLFW0T6','proyectomovil','14:1a:a3:22:7d:ed'),
 (4,'r4','APA91bHbj3cJo6uZP4U97y3hxQ2mCF6QIj87uO8fEdAsL0vBvKzRbDURuD4a03i7GvrFhjgOZb79qTPREnQL2vkLO2o2mOKume1ORELSM7Im_VDq-fM7pBgwMVbfnQG6y_V77_JZf6Dt','proyectomovil','ec:89:f5:9f:b6:e7'),
 (5,'r5','APA91bHC46MwaALIyR4Ssu869P7AcfxDFoJYk_YV9czEUTcZwqZbR4UlAE9xZtd6aOD3T3dSui0ps3KW8WnTuCRSfFCrmRRtTulynMmTK9BiAz9og5aBOR6ALJzabRTvqQK8_tLFW0T6','proyectomovil','14:1a:a3:22:7d:ed'),
 (6,'r6','APA91bETTcEo0jFbTWjrKH-GhtudvXM6IjfH0ScSSa07PFsvrNzXhngObAXCCq4dak7yxn6ieYv1zPCKypB_scxXTCMx4thmaZPtzxGDbBPQedptRI9zlfuPJJdWRu2F2kqacky4fZy2','proyectomovil','ec:89:f5:9f:b6:e7'),
 (7,'emudaenerys','APA91bFPsDHJQbIgjV0a9sVU8ng7197eFUQCGJg91_yy7QBa3AAoPkySOijX65wUx60iSR_LbePHKk3vARBcGJnEWkiSvsWPeCIkO-9Vay58FMLkTfcNy7f6xQSRLVShxLLy1_nlOnnP','androidavanzado3',''),
 (8,'tablet','APA91bFIbRsuw5aaw6IaBHXCgVOSNKDT3tbuqf74UV1W4aenGdEMqBq5LQCK6PWukpC1TDjacDSr8E2dC2H_FCntPCVnbPq-ftyWTvj82A_L1VPv4NSIciPR3zSnFrprrCSY42L6eXNf','androidavanzado3','ec:89:f5:9f:b6:e7'),
 (9,'cell','APA91bF5zOPcLuxuVTwosrELaD25mcucLXxTU_7KRc_8bFC3J3GbGorDS-5ntFGAfpqhtsxjYSWNM0iDPwI1aO5pb5RX_qkm0-pboBwPj8CW9PBl8jD_0gU0ZT9lApQbjPauLStsqN1D','androidavanzado3','14:1a:a3:22:7d:ed'),
 (10,'emu','APA91bGfm0p03WmgwPQRLfwBfnEjCtsbfhunggxRg5OAQBYc9EMXolshpmJ05VsMozdxRRov1sjzJMZ-CF_EV5vddnBmPOtH5pFzfPflzij02JDPqQw05CgIHtU5dnCYcyEJFLTHPoT8','proyectomovil',''),
 (11,'mobi','APA91bECRSbwirhc5jj6LTobrcqQiagsDqE-ZexSHOIRqXcyLzpM33lwCBrROXrZufSiSEG19gUJH7Vb5ne8gBXzj92RD8_rNl0Sbvw6kCiYzcl1mBib-M_mOe30a8zl9ktL2u6h9mac','proyectomovil','14:1a:a3:22:7d:ed'),
 (12,'tablet','APA91bFVsxQ3h5GaX1kpxxhzcL_GnF_HJhWjPZxqlARhYP2hISGI2oQBrBuPRDyxnzAMfX66_6447xQo7zqJsgnWPPLhJ4snb-0segmYMYUB0sOI9N65AVBY3Xg2fZeasKj_fl9II3ML','proyectomovil','ec:89:f5:9f:b6:e7');
/*!40000 ALTER TABLE `dispositivo` ENABLE KEYS */;


--
-- Definition of table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
CREATE TABLE `mensaje` (
  `id_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(8) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `archivo` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_mensaje`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mensaje`
--

/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
INSERT INTO `mensaje` (`id_mensaje`,`tipo`,`descripcion`,`archivo`) VALUES 
 (1,'Consulta','como se llama','fname_1468374331165.jpg'),
 (2,'Denuncia','colación','fname_1468375008271.jpg'),
 (3,'Consulta','Napoleón dinamita','fname_1468451065025.jpg'),
 (4,'Denuncia','JJZJZJZJZ','fname_1468455633377.jpg'),
 (5,'Denuncia','chuck','fname_1468480130562.jpg'),
 (6,'Denuncia','chuck','fname_1468480130562.jpg'),
 (7,'Denuncia','chuck','fname_1468480536152.jpg'),
 (8,'Denuncia','','fname_1468482355445.jpg'),
 (9,'Consulta','coco','fname_1468521363350.jpg'),
 (10,NULL,NULL,NULL),
 (11,'Consulta','hhh','fname_1468541406021.jpg'),
 (12,'Denuncia','sabes bien que los tiempos no volverán','fname_1468549221426.jpg'),
 (13,'Consulta','cuando cua cua','fname_1468554004675.jpg'),
 (14,'Denuncia','Francia loco bomba','fname_1468556792030.jpg'),
 (15,'Consulta','yo soy mayimbu','fname_1468713000551.jpg'),
 (16,'Denuncia','yo soy mayimbu gordo','fname_1468713073656.jpg'),
 (17,'Denuncia','cua cua cua los pasos y los perros','fname_1468714358129.jpg'),
 (18,'Consulta','pelo madueño nuestras historias','fname_1468714462181.jpg'),
 (19,'Consulta','nia tepellin','fname_1468716641559.jpg'),
 (20,'Consulta','discovery channel','fname_1468805041716.jpg'),
 (21,'Consulta','discovery channel','fname_1468805071879.jpg'),
 (22,'Consulta','strezs','fname_1468812226325.jpg'),
 (23,'Denuncia','me faltaba el aire :\'v','fname_1468812300393.jpg'),
 (24,'Consulta','esto se va descontrolar','fname_1468870620267.jpg'),
 (25,'Consulta','esto se va descontrolar','fname_1468870695252.jpg'),
 (26,'Denuncia','Esta es mi denuncia contra el chinaman','fname_1468901871760.jpg'),
 (27,'Consulta','esta es mi consulta sobre brtitannt','fname_1468902651366.jpg'),
 (28,'Consulta','me llegó una notificación','fname_1468903553035.jpg'),
 (29,'Consulta','una vez que entras en este mundo','fname_1468904057575.jpg'),
 (30,'Denuncia','nico ni','fname_1468915036517.jpg'),
 (31,'Consulta','grimorum el mejor juego de hechizos','fname_1469132905063.jpg'),
 (32,'Consulta','no mame abuelo muy muy me tocó','fname_1469133153826.jpg'),
 (33,'Denuncia','comete está papá','fname_1469226464978.jpg'),
 (34,'Consulta','ya no veras más hentai\nni siquiera porno gay\na la onu no le gusta esto','fname_1469284978326.jpg');
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;


--
-- Definition of table `noticia`
--

DROP TABLE IF EXISTS `noticia`;
CREATE TABLE `noticia` (
  `id_noticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(256) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `descripcion` longtext,
  PRIMARY KEY (`id_noticia`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `noticia`
--

/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
INSERT INTO `noticia` (`id_noticia`,`titulo`,`fecha`,`descripcion`) VALUES 
 (1,'ALCALDESA DE SANTA ANITA JURAMENTÓ COMO PRESIDENTA DE LA MANCOMUNIDAD LIMA ESTE','2016-07-11 02:37:57','Alcaldes integrantes de la Mancomunidad Lima Este lanzan plan denominado“Carnavales Seguros 2016”\r\n\r\nAlcaldes de la Mancomunidad y la Teniente alcalde de Lima Metropolitana y autoridades de la PNP se comprometieron a trabajar unidos contra la inseguridad.\r\n\r\nCon la participación de los siete alcaldes integrantes de la Mancomunidad Lima Este se realizó el lanzamiento del plan Dispositivo denominado “Carnavales Seguros 2016”, el cual busca integrar, fortalecer e intensificar las acciones de Seguridad Ciudadana ante el acercamiento de los carnavales. Desde las primeras horas de la mañana se congregaron en la explanada de la Municipalidad de Santa Anita los burgomaestres de Cieneguilla Emilio Chavez Huaringa, de el Agustino Richard Soria Fuerte, de Pachacamac Hugo Ramos Lescano, de San Luis Ronald Fuertes Vega, de Chaclacayo David Aponte Jurado, de Lurigancho Chosica Luis Bueno Quino y la alcaldesa anfitriona y electa Presidenta de la Mancomunidad la señora Leonor Chumbimune Cajahuaringa, además el acto contó con la presencia del jefe de Estado Mayor Operativo de la zona este General PNP Edgar Gonzales Espinoza, los comisarios de los 7 distritos y la participación especial de la Teniente Alcalde de Lima Metropolitana Dra. Patricia Juarez Gallegos, quien en un momento de la ceremonia entregó la Medalla de Lima a la alcaldesa Chumbimune por su trayectoria y destacada gestión en Santa Anita.\r\n\r\nEn esta ceremonia los alcaldes se comprometieron a trabajar en conjunto con la Policía Nacional realizando un patrullaje intensivo, motorizado y a pie, a fin de reforzar los diferentes puntos críticos de cada distrito, más de dos mil miembros de la Mancomunidad entre policías y serenos se suman a esta importante labor que busca neutralizar a aquellos elementos que utilizan los juegos de carnaval, fiestas o yunzas, para realizar actos vandalicos y alterar el orden público. Tras su juramentación la alcaldesa de Santa Anita se comprometió a trabajar y doblegar esfuerzos pues la gestión de su antecesor ha sido realmente destacada. “Me comprometo a trabajar y con el apoyo de la Policía Nacional lograr hacer que nuestra Mancomunidad siga logrando importantes resultados, la valla que tengo es muy alta pero estoy dispuesta a afrontar el reto” afirmó L. Chumbimune. El Plan “Carnavales Seguros 2016” tiene como principal objetivo que el personal de la Policía Nacional y la Mancomunidad Municipal Lima Este logren contrarestar las posibles alteraciones del orden público, accidentes de tránsito, asaltos, robos y agresiones contra la integridad física de las personas y daños a la propiedad pública y privada, entre otros. '),
 (2,'ALCALDESA LEONOR CHUMBIMUNE RECIBIÓ CONDECORACIÓN EN SESIÓN SOLEMNE POR 481 ANIVERSARIO DE LIMA','2016-07-12 16:24:03','Alcalde de Lima realizó reconocimiento a la trayectoria y eficiente gestión de la alcaldesa de Santa Anita\r\n\r\nAlcalde de Lima Luis Castañeda Lossio realizó por primera vez esta condecoración a una alcaldesa en plena sesión solemne por Aniversario de Lima.\r\n\r\nComo parte de las actividades por el 481° aniversario de Lima, el pasado 18 de enero se realizó la tradicional sesión solemne capitalina en la cual participaron embajadores, parlamentarios, regidores de la comuna Limeña, el presidente del Consejo de Ministros, Pedro Cateriano Bellido y el alcalde de Lima Metropolitana, Luis Castañeda Lossio.\r\n\r\nEn la ceremonia que se llevó a cabo en el salón de recepciones del palacio municipal de Lima, se condecoró a distinguidas personalidades, entre ellas a la alcaldesa de Santa Anita Leonor Chumbimune, a quien se le otorgó la Medalla Cívica de la Ciudad de Lima y una Resolución de Alcaldía en reconocimiento a su trayectoria política e importante labor en favor de su distrito. La única alcalde mujer de todo Lima se mostró agradecida con el reconocimiento por parte de la primera autoridad Metropolitana, quien felicitó y destacó las cualidades de nuestra burgomaestre. '),
 (3,'ALCALDESA DE SANTA ANITA INAUGURA NUEVO CENTRO DE OPERACIONES DE DEFENSA CIVIL','2016-07-12 17:58:36','Bella obra se ubica en el cruce de las avenidas Virreyes con Huarochirí.\r\n\r\nEl viernes 18 de julio, el Dr. Hernando Tavera, Director del Instituto Geofísico del Perú (IGP) y la alcaldesa de Santa Anita Leonor Chumbimune inauguraron la Central de Operaciones y Emergencia Local (COEL) de Santa Anita en medio de una masiva concurrencia de vecinos que celebraron la apertura de esta importante obra. Durante el evento, el Dr. Tavera quien también apadrinó este novedoso local de prevención, agradeció la invitación y reconoció el interés de la primera autoridad por el trabajo que se viene realizando a fin de establecer una cultura de prevención en el distrito de Santa Anita. “Para mí es un gusto estar nuevamente con ustedes, ya que siempre hemos estado trabajando en la educación de la población y ahora toma relevancia el haber logrado formar un grupo humano que va a estar al frente de vuestro COEL, realmente es importante para el distrito de Santa Anita”, señaló.\r\n\r\nA su turno la alcaldesa de Santa Anita agradeció la aceptación del dr. Tavera de apadrinar el COEL y destacó las bondades de este nuevo centro de monitoreo de Defensa Civil: “Dr. Tavera es un honor contar con su presencia una vez más en Santa Anita y esta vez como padrino de esta bella obra, los módulos de información, prevención y de alerta con los que cuenta nuestro COEL además del abastecido almacén implementado con picos, lampas, megáfonos, colchones, carpas, enceres y demás implementos, nos garantiza un trabajo de prevención y de acción inmediata en favor de la seguridad ante desastres naturales y sísmicos en nuestra localidad. El evento estuvo presidido por la alcaldesa de la municipalidad de Santa Anita, Leonor Chumbimune, en la mesa de honor la acompañaron Hernando Tavera, la gobernadora, Carmen Buendía, el comisario de del distrito comandante Carlos Alcántara, el comisario de Villa Hermosa Luis Aliaga, el primer Jefe de la Compañía de Bomberos de Santa Anita, Javier del Busto, la representante de la Dirección del Callao de Indeci y la Lic. Victoria Villarubio, el evento culminó luego de la presentación de agrupaciones folckloricas y el desfile de las escoltas de los centros educativos de los alrededores de esta gran obra.'),
 (4,'MUNICIPALIDAD DE SANTA ANITA CLAUSURÓ MÁS DE 20 LOCALES QUE FUNCIONABAN EN ALREDEDORES DEL LLAMADO OVALO','2016-07-12 18:55:43','Ingreso de menores de edad, personas alcoholizadas protagonizando broncas en las calles, prostitución, calles sucias, son solo parte de la infracciones\r\n\r\nOperativo clausuró 26 locales que funcionaban de forma irregular.\r\n\r\nLuego de ser notificados, advertidos y hasta sancionados en algunos casos de forma reincidente, los locales que funcionaban en las calles Flamengos, Perdices y alrededores del llamado Ovalo de Santa Anita fueron clausurados por no acatar las ordenanzas municipales y alterar el orden público. Los locales, que en algunos casos han sido sancionados de forma reiterativa, incumplen las normas permitiendo el Ingreso de menores de edad a sus establecimientos, vendiendo licor sin contar con licencia para el giro, generando ello como consecuencia los conflictos y enfrentamientos en la vía pública, además de permitir la presencia de elementos de mal vivir en sus instalaciones.\r\n\r\nLa cantidad de basura y de desperdicios con que amanece esta zona del distrito, así como la presencia de meretrices en los alrededores, alteran la tranquilidad de los vecinos de la urbanización residencial Santa Anita. Estos son tan solo algunos motivos que propician el desorden, la delincuencia y la peligrosidad en los alrededores del llamado Ovalo de Santa Anita, por ello 27 locales fueron clausurados con muros de cemento y en algunos casos soldando la puerta de ingreso a los mencionados establecimientos. '),
 (5,'INAUGURACIÓN DE LA REMODELACIÓN DEL PARQUE N°2 DE LA URB. RESIDENCIAL RISSO','2016-07-12 19:05:50','Una nueva obra en favor del ornato, la seguridad y la recreación de la población\r\n\r\nPoblación celebró la inauguración de la remodelación de un nuevo parque.\r\n\r\nEl viernes 03 de julio fue inaugurada la remodelación del parque n°2 de la Urb. Residencial Risso “Los Libertadores”, con la participación la alcaldesa de Santa Anita Leonor Chumbimune, la comisión de obra presidida por la sra. Doris Berrocal y diversas organizaciones sociales de la zona se hicieron presente al evento que conglomeró al vecindario residente en los alrededores.\r\n\r\nEsta bella e importante obra consta de la remodelación total del mencionado parque, la colocación de pergolas, bancas, adoquinados, luminarias e inclusive la ampliación del área deportiva con la construcción de una losa multideportiva para la practica del vóley, la remodelación de la losa de fulbito y el enmallado de este sector. De esta manera se continúa con las remodelaciones de los parques de nuestro distrito, un compromiso asumido por nuestra alcaldesa y que hoy se ve plasmado en realidad. '),
 (6,'PROGRAMA “UNIVERSIDAD ABIERTA” LLENÓ AULAS DE LA UNIVERSIDAD SAN MARTIN DE PORRES','2016-07-12 19:06:49','USMP y la Municipalidad de Santa Anita continúan realizando importante labor en Responsabilidad Social\r\n\r\n\"Universidad Abierta\" un programa social que cautivo a centenares de Santanitenses.\r\n\r\nLa jornada denominada “Universidad Abierta” colmó las expectiva de los organizadore quienes se mostraron satisfechos de la masiva presencia de la ciudadanía que participó en los talleres de ideas de negocios. La Alcaldesa de Santa Anita, Leonor Chumbimune; el Dr. Reynaldo Bringas, Director de la Oficina de Extensión Universitaria, el Dr. Luis Ludeña, Director del Departamento Académico y el Lic. Félix Porles, felicitaron personalmente a los vecinos asistentes y aplaudieron esa iniciativa de pretender crecer cada día más. La universidad San Martín de Porres a través de su facultad de Ciencias Contables Económicas y Financieras, desarrolló el sábado 27 de junio este programa “Universidad Abierta”, que permitió capacitar a más de 800 pobladores del distrito de Santa Anita, las aulas universitarias estuvieron a disposición de su comunidad en forma totalmente gratuita.\r\n\r\nEl programa ha comprendido, el desarrollo de diez cursos que se elaboraron en base a una encuesta de necesidades de la población, por lo profesores especialistas del staff de la facultad, quienes dictaron los siguientes cursos; elaboración de presupuestos, impuesto a la renta, contabilidad básica, impuesto al IGV, planeamiento estratégico, flujo de caja, sistema de control financiero, ideas de negocios, gerencia y negociaciones, y orientación vocacional que se realizó mediante una sinergia de acciones gerenciales, entre la Municipalidad de Santa Anita; su alcaldesa la Srta. Leonor Chumbimune y por la Universidad el decano de la Facultad de Ciencias Contables Económicas y Financieras, el Dr. Juan Alva. En esta jornada no solamente vinieron jóvenes, sino también adultos mayores, microempresarios e igualmente algunas personas como los padres de familia de los jóvenes que también solicitaron asistir a los cursos en ese momento. '),
 (7,'FIESTA CULTURAL EN SANTA ANITA','2016-07-12 19:08:42','El Ballet Municipal de Lima brindó una presentación inolvidable.\r\n\r\nCon gran exito se llevo a cabo la primera Fiesta Cultural 2015, organizado por las Municipalidades de Lima Metropolitana y Santa Anita, el ballet municipal de Lima, agrupaciones de danzas, teatro y demás expresiones artisticas de ambas jurisdicciones se unieron y desplegaron lo mejor de su arte.\r\n\r\nEl teatro Municipal fue el escenario de este gran acontecimiento que se inicio con una feria cultural en la explanada de la Municipalidad de Santa Anita, para luego dentro del Teatro Municipal continuar con el programa. La alcaldesa de Santa Anita Leonor Chumbimune quien estuvo en la jornada recibió más de una felicitación de los funcionarios capitalinos al observar y comprobar la gran cantidad de talleres con lo que se cuenta en el distrito. '),
 (8,'EXITOSO OPERATIVO LOGRA RECUPERAR IMPORTANTE TRAMO DE LA AV. 22 DE JULIO','2016-07-12 20:46:57','Sujetos intentaron impedir la intervención arrojando bombas molotov desde los interiores del terreno cercado por una empresa de Maquinarias\r\n\r\nUn mega operativo acertadamente coordinado permitió que la demolición sea exitosa.\r\n\r\nEn un mega operativo realizado por las Municipalidades de Santa Anita y Lima Metropolitana, el cual contó con el apoyo de la Policía Nacional, se logró demoler un cerco construido por la empresa GP Maquinarias SAC (empresa dedicada a la venta de camiones y vehículos de carga pesada), el terreno público que comprendía aproximadamente más 16 mil metros cuadrados estaba ubicado en la Av. 22 de julio o conocida también como la prolongación de la Separadora Industrial. La incursión al terreno en disputa por parte de los miembros del orden liderados por el coronel Pedro Valdivieso, jefe de la Divter Este, fue pacifica a pesar de que un grupo de personas que se encontraban dentro del perímetro cercado intentaron enfrentarse a la policía y a los trabajadores municipales utilizando bombas molotov.\r\n\r\nLa alcaldesa de Santa Anita Leonor Chumbimune afirmó que de acuerdo a ley se debe de respetar el derecho a vía y la mencionada no puede estar bloqueada por privados, a su turno Cristian Rosenthal, gerente de fiscalización de la comuna metropolitana, explicó que con el desalojo se podrán ampliar las vías alternas de la Carretera Central, que fue cerrada por la construcción de la Línea 2 del Metro de Lima. Debemos de acotar que seis personas fueron detenidas luego de lanzar bombas molotov contra miembros de la policía nacional y serenos de la Municipalidad de Lima y de Santa Anita, quienes participaban en la demolición del cerco. En los próximos días la vía será completamente adecuada para el tránsito vehicular convirtiéndose así en un acceso que se suma a las vías alternas mientas se lleva a cabo la construcción de la Línea 2 del Metro de Lima. '),
 (9,'FERIA LABORAL EN SANTA ANITA','2016-07-12 20:48:30','Las empresas más importantes de nuestro país brindaron diversas alternativas laborales\r\n\r\nEl 5 de mayo se organizó la primera feria laboral del 2015, la explanada de nuestra Municipalidad recibió a diez de las empresas más importantes de nuestro país con el objetivo de que estas puedan ofrecer diversas alternativas laborales a los ciudadanos de nuestro distrito.\r\n\r\nEsta jornada es la primera del año y forma parte de las actividades de la Bolsa de trabajo de nuestra Municipalidad y que gracias a nuestra alcaldesa la señora Leonor Chumbimune logra brindarle un trabajo seguro a todos nuestros vecinos que no cuenten con un puesto laboral. Estas empresas entrevistaron a todos los asistentes, evaluando a las personas y dándoles la posibilidad de tener un trabajo digno y que cubra las expectativas de nuestros ciudadanos mayores de 18 años, Santa Anita sigue creciendo y creciendo con su gente. '),
 (10,'MEJORANDO EL SERVICIO DE LIMPIEZA EN SANTA ANITA','2016-07-13 09:20:20','Nuevas unidades para la recolección de residuos sólidos\r\n\r\nNuevas unidades para un mejor servicio a nuestros contribuyentes,\r\n\r\nEl viernes 15 de mayo fueron presentados a la ciudadanía de Santa Anita las nuevas unidades de recolección de residuos sólidos que ya trabaján en el distrito, modernos camiones compactadores que cuentan con gps satelital para un mejor control y sobre todo con mayor capacidad para brindarle un mejor servicio a toda la comuna.\r\n\r\nUna gestión de nuestra alcaldesa la señora Leonor Chumbimune quien busca que la empresa que se encarga de prestar el servicio de recolección de residuos sólidos brinde un servicio de calidad de forma constante. Hoy Santa Anita cuenta con la logística necesaria para brindar un servicio optimo, vecinos no olviden que depende de todos el que Santa Anita luzca limpia, saludable y bonita!. '),
 (11,'OPERATIVOS DE FISCALIZACIÓN Y ORDENAMIENTO EN LA AV. 22 DE JULIO','2016-07-14 00:28:04','Continúa el trabajo de fiscalización y de recuperación de vías\r\n\r\nEl trabajo del personal de fiscalización, serenazgo y la policía nacional a sido fundamental.\r\n\r\nUn importante trabajo de fiscalización viene realizando la Municipalidad de Santa Anita en la avenida 22 de julio conocida también como Separadora Industrial, con el importante aporte de la policía fiscalizadora, serenazgo y la policía nacional, quienes vienen informando, advirtiendo y sancionando a aquellos que ocupan de forma ilegal la mencionada vía, la cual debería estar despejada y así esta podría ser utilizada como alternativa importante en esta temporada en la que se vienen realizando obras de la línea 2 del Metro en plena carretera central.\r\n\r\nLos propietarios y en algunos casos los arendatarios de estos predios han sido visitados por la policía fiscalizadora y hoy están enterados del trabajo que se viene realizando en este sector con el objetivo de hacer respetar la vía pública, además se les informó de las posteriores medidas a tomar por la gerencia de seguridad ciudadana. El trabajo continúa, buscando así darle a nuestros vecinos la seguridad, tranquilidad y el mejor distrito para vivir. '),
 (12,'NOCHE INOLVIDABLE DE TEATRO EN SANTA ANITA','2016-07-18 21:17:01','Celebrando el día Internacional del Teatro alcaldesa Leonor Chumbimune premio a grandes estrellas del Teatro peruano\r\n\r\nUn año más en el que se reconoce a nuestros padres del Teatro y a quienes destacan de manera sobre saliente.\r\n\r\nUna noche inolvidable fue la que se vivió el último sábado 28 de marzo en las instalaciones del Teatro Municipal de Santa Anita, cuando nuestra alcaldesa la señora Leonor Chumbimune rindió homenaje a tres grandes actores del Teatro nacional, nos referimos a Ivonne Fraysssinet, Marcelo Oxenford y a Eduardo Cesti celebrando con ello el día internacional del Teatro. Con la participación de actores de trayectoria como también de jóvenes promesas, la noche se inició con la puesta en escena de Adú y su gran espectáculo denominado \"Afro Adú\" lo que una vez causo sensación entre los vecinos que llenaron las instalaciones del Teatro Municipal de Santa Anita.\r\n\r\nFinalizado el despliegue de música, color y baile de Adú, se inició la ceremonia de premiación, La actriz Ivonne Fraysssinet recibió el reconocimiento de la Municipalidad de Santa Anita de manos de la regidora Mariela Trujilllo y del regidor Zacarias Medina H., el actor Marcelo Oxenford recibió el reconocimiento de la Municipalidad de Santa Anita de manos de la Dra. Lizeth Huallanca y fue la alcaldesa de Santa Anita, la señora Leonor Chumbimune quien premió al gran eduardo Cesti, pero antes de condecorar al maestro Cesti, le agradeció todo lo hecho por el teatro nacional y señalo que el trofeo entregado es tan solo algo simbólico ante lo importante de su labor. El aún conocido capitán “GAMBOA” se mostró muy agradecido, beso el trofeo y agradeció a la alcaldesa de Santa Anita por el detalle de la premiación, así mismo felicitó por el gran escenario con el que cuenta Santa Anita. Al final del evento los homenajeados firmaron un cuadro con sus respectivas fotografías los cuales formarán parte de la Galería de estrellas del Teatro municipal de Santa Anita. '),
 (13,'INAUGURACIÓN DE MUROS DE CONTENCIÓN EN “HIJOS DE PERALES II”','2016-07-18 21:30:01','Población de Santa Anita celebró inauguración de importante obra que mejora el ornato y brinda seguridad a nuestros vecinos\r\n\r\nImponente y bello Muro de Contención que hoy protege a nuestros vecinos de \"Hijos de Perales II\".\r\n\r\nLa tarde del sábado 21 de marzo fue una de aquellas que dificilmente podremos olvidar pues la población de diversos sectores de nuestro distrito se instaló en la zona uno, con el objetivo de celebrar junto a nuestra alcaldesa la señora Leonor Chumbimune la inauguración de los muros de contención del AA.HH. “Hijos de Perales II”. Nuestra primera autoridad, junto a regidores y dirigentes de la zona participaron del evento que se inició con las palabras de los residentes del sector quienes se mostraron agradecidos por esta importante obra que le brindará seguridad y además embellece un sector olvidado por anteriores gestiones.\r\n\r\nA su turno nuestra alcaldesa destacó la importante labor que cumplen los dirigentes al haber sido parte del presupuesto participativo y por consiguiente ver hecha una realidad este imponente muro de contención que al igual que los anteriormente construidos se convierten en las zonas más seguras ante cualquier sismo o movimiento telúrico. Al final del protocolo todos los presentes liderados por nuestra alcaldesa recorrieron toda la extensión donde ha sido construido el muro y se comprometieron a seguir trabajando por el crecimiento del distrito. '),
 (14,'484 ALCALDES SE UNEN EN SANTA ANITA PARA LUCHAR CONTRA ACOSO SEXUAL Y VENTA DE DROGAS ','2016-07-18 21:44:07','Tras la primera semana de clases, autoridades y padres de familia toman medidas de seguridad conjunta\r\n\r\nLa alcaldesa de Santa Anita junto a los alcaldes de San Luis, Pachacàmac, El Agustino y Cieneguilla, se unen para presentar el Plan de seguridad \"Escuelas Seguras”, con el objetivo de hacer un alto a los problemas sociales que se dan en las afueras de los centros educativos, como es la venta de drogas, el acoso sexual, atropellos, robos y el expendio de bebidas alcohólicas a niños y adolescentes escolares. Este plan consiste en un trabajo de prevención y resguardo en los exteriores de los centros educativos de cada distrito, al ingreso y salida de los escolares, con la vigilancia de las BRIGADAS DE PADRES DE FAMILIA, que estarán bien identificados con chalecos y pitos, a esto se suma como todos los años el PATRULLAJE INTEGRADO DEL SERENAZGO Y POLICÍA NACIONAL, a fin de garantizar la integridad física, moral del educando, disminuyendo los factores de riesgo y el índice de percepción de inseguridad.\r\n\r\nLas brigadas de padres de familia de cada colegio serán capacitados por la Policía Nacional y el Serenazgo del distrito donde sabrán cómo identificar a personas sospechosas que se encuentran merodeando por los alrededores de los centros educativos. Al presenciar a un sospechoso, los padres de familia alertarán a la unidad de serenazgo que se encuentra con policía, para que procedan a identificar al sujeto. Esta jornada se inauguró simbolicamente en la Plaza de Armas de nuestro distrito y contó con la participación de las Brigadas de padres de familia de los centros educativos que se han unido a esta importante campaña en pro de la seguridad. ');
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;


--
-- Definition of table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pedido`
--

/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;


--
-- Definition of table `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `importancia` int(10) DEFAULT NULL,
  `imagen` varchar(20) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `producto`
--

/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id_producto`,`nombre`,`descripcion`,`precio`,`stock`,`importancia`,`imagen`,`id_categoria`) VALUES 
 (1,'Huawei1','Huawei','1000',10,1,NULL,1),
 (2,'Samsung','Samsung','1200',10,1,NULL,1),
 (3,'LG','LG','1300',10,1,NULL,1),
 (4,'IPhone','IPhone','1400',10,1,NULL,1),
 (5,'Lenovo','Lenovo','1500',10,1,NULL,1),
 (6,'Sony','Sony','1600',20,1,NULL,1),
 (7,'Motorola','Motorola','1800',20,1,NULL,1),
 (8,'Alcatel',NULL,'500',NULL,NULL,NULL,1),
 (11,'Xiomi',NULL,'40',NULL,NULL,NULL,1),
 (12,'Haier',NULL,'20',NULL,NULL,NULL,1),
 (13,'Libro 1',NULL,'100',NULL,NULL,NULL,3),
 (14,'Libro 2',NULL,'200',NULL,NULL,NULL,3),
 (15,'Libro 3',NULL,'300',NULL,NULL,NULL,3),
 (16,'Libro 4',NULL,'400',NULL,NULL,NULL,3),
 (17,'Libro 5',NULL,'500',NULL,NULL,NULL,3),
 (19,'Tablet Samsung',NULL,'2000',NULL,NULL,NULL,2),
 (20,'Tablet LG',NULL,'500',NULL,NULL,NULL,2),
 (21,'Ipad',NULL,'4000',NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;


--
-- Definition of table `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `rol_nombre` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rol_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rol`
--

/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` varchar(20) NOT NULL,
  `clave` varchar(20) DEFAULT NULL,
  `nombres` varchar(64) DEFAULT NULL,
  `paterno` varchar(64) DEFAULT NULL,
  `materno` varchar(64) DEFAULT NULL,
  `correo` varchar(64) DEFAULT NULL,
  `direccion` varchar(128) DEFAULT NULL,
  `telefono` varchar(32) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


--
-- Definition of table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
CREATE TABLE `usuario_rol` (
  `id_usuario` varchar(20) NOT NULL,
  `rol_nombre` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`rol_nombre`),
  KEY `rol_nombre` (`rol_nombre`),
  CONSTRAINT `usuario_rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `usuario_rol_ibfk_2` FOREIGN KEY (`rol_nombre`) REFERENCES `rol` (`rol_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario_rol`
--

/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
