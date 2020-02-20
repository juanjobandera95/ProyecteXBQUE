-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-02-2020 a las 13:47:09
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `xbqe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nomCategoria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nomCategoria`) VALUES
(1, 'deporte'),
(2, 'medio ambiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `idComentario` int(11) NOT NULL,
  `new_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_public` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`idComentario`, `new_id`, `author_id`, `content`, `date_public`) VALUES
(4, 1, 1, 'hola', '2019-12-17 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `idnews` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_public` datetime NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `summary` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `comentarios` longtext NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`idnews`, `author_id`, `title`, `date_public`, `content`, `summary`, `comentarios`, `user`) VALUES
(1, 1, 'Barça vs Javea', '2020-02-19 12:00:00', 'EL javea empata en barcelona con un empate dudoso', 'fsdgsdfgdhgdyf', '', ''),
(2, 1, 'Comienza la retirada de las algas podridas de la cienága del Arenal', '2020-02-11 00:00:00', '\r\n0\r\nTiempo de lectura: < 1 minuto\r\n\r\nEl Ayuntamiento de Xàbia ha iniciado la retirada de las algas podridas que se encontraban en la parte del sur de la playa del Arenal, en la que se había formado una charca de agua verde, que los vecinos ya comparaban con una ciénaga.\r\n\r\nDesde primera hora de la mañana la pala que lleva días trabajando en el otro lado de la playa se ha adentrado en la charca y está trasladando las algas podridas al otro lado de la playa donde están amontonadas para su traslado a un vertedero autorizado.\r\n\r\nLa máquina entra y sale sin problemas de la zona, y no se hunde, una de las causas que adujo el Ayuntamiento hasta el martes para que no se interviniera en el área.\r\n\r\nJunto a esta charca, los operarios de una empresa de fosas sépticas retiran las algas que se han acumulado en la salida del pluvial que se encuentra debajo del paseo del Arenal y vierte sus aguas precisamente en este punto. Esas algas atascan la entrada e impiden la correcta salida del agua que llega desde la avenida de la Libertad.\r\n', 'El Ayuntamiento de Xàbia ha iniciado la retirada de las algas podridas que se encontraban en la parte del sur de la playa del Arenal, en la que se había formado una charca de agua verde, que los vecinos ya comparaban con una ciénaga.', '', ''),
(3, 1, 'Las empresas podrán aportar mejoras en este punto, la frase que más se repite en el pliego del nuevo contrato de la recogida de la basura de Xàbia', '2020-02-26 00:00:00', 'El coste total ascenderá a 5,69 millones de euros\r\n\r\nEl pleno del ayuntamiento de Xàbia debatirá el próximo lunes la aprobación del pliego de condiciones del nuevo contrato de recogida de la basura y limpieza varia, un documento que el lunes fue debatido en la comisión de Hacienda y que este viernes volverá a debatirse en la de Urbanismo.\r\n\r\nEsta redacción ha podido acceder al contenido del pliego, que han elaborado los servicios técnicos municipales y que cuenta con los informes favorables tanto del secretario, como de la interventora con alguna salvedad y es que sugiere una revisión de la tasa, toda vez que el gasto en general aumenta. El documento describe una contratación anual de unos 5,69 millones de euros que se desglosan en 3,094 millones la recogida y otros 2,86 millones la limpieza viaria y mantenimiento de playas.\r\n\r\nEl contrato se hará para ocho años y no prevé ninguna prórroga, ya que la Ley de Contratos no lo permite. Asimismo recoge en el apartado de la recogida de los residuos que el ayuntamiento pagará a la concesionaria un máximo de 206 euros por cada tonelada extraída de los contenedores, lo que da un máximo anual de 14.984 toneladas de residuos, según los datos del año 2019.\r\n\r\nUna vez sea aprobado por el pleno de la corporación, el contrato saldrá a concurso público y las empresas interesadas presentarán sus ofertas. De los 100 puntos de valoración, 55 están vinculados a “criterios de evaluación automática: de los que 35 se refieren al mejor precio y otros 20 a las mejoras que propongan las empresas, y otros 45 puntos de máximo en función de “criterios de evaluación objetiva”.\r\n\r\nAlgunas mejoras que cita el pliego se refieren a aspectos como:\r\n\r\n-aumentar el número y gestión de contenedores de recogida selectiva\r\n-limpiezas adicionales de los contenedores\r\n-incremento de Punts Verds (dice como máximo 3 más y ya hay 19).\r\n-Equipo específico para “puntos negros”.\r\n-Realización de campañas de concienciación hasta el 2% del presupuesto anual. Por contrato ya debe destinar el 1% que corresponde con 50.000 euros.\r\n-Equipo específico de apoyo limpieza de playas “hasta un máximo de 30 días por año”.\r\n-Responsable de gestión ambiental, distinto del encargado/gerente del servicio.\r\n\r\nEl pliego expone que hay tres temporadas para la recogida de la basura y la limpieza viaria:\r\n\r\nAlta: del 1 de julio al 15 de septiembre y Semana Santa\r\nMedia: del 1 de mayo al 30 de junio, del 16 de septiembre al 1 de noviembre, y del 22 de diciembre al 7 de enero.\r\nBaja: del 2 de noviembre al 21 de diciembre, del 7 de enero a Semana Santa y desde el final de Semana Santa hasta el 1 de mayo.\r\n\r\nAsimismo obliga al concesionario a la renovación total de los “aproximadamente 311 contenedores” que hay repartidos por todo el término municipal, así como a la implantación del llamado contenedor marrón para la fracción resto, lo que obligará al concesioanario a realizar una fuerte campaña de difusión/promoción del tipo de residuos que se aceptan en este nuevo contenedor.\r\n\r\nOtra de las grandes renovaciones que deberá afrontar el adjudicatario es la del conjunto de los camiones que prestan el servicio. Todos los vehículos tienen entre 12 y 13 años de antigüedad, excepto uno o dos que son de 2010. Una obligación que deberá cumplir en los tres meses siguientes a la firma del contrato y de no hacerlo tendrá una penalización del 3% del importe total anual.\r\n\r\nCon todo las previsiones del equipo de gobierno se recogen en el propio pliego y no será hasta el último trimestre del año cuando entre en vigor el contrato, ya que el concejal de Hacienda ha hecho una retención de crédito en el presupuesto de 2017 prorrogado tres veces, con el fin de incluir tres mensualidades de este nuevo contrato, por un importe de 1,5 millones de euros.\r\n\r\n    Bolsa de empleo temporal y autorización previa para contratar personal\r\n\r\nLas fuentes consultadas por XAD han señalado que una de las cosas que recoge el pliego es una frase que deja muy abierto el servicio y dice “las empresas podrán presentar mejoras en este punto”, una frase que permite al ayuntamiento no fijar una posición respecto a cuestiones del servicio de limpieza y la recogida en sí. Estas fuentes subrayaron que quedan a la decisión de las empresas aspectos como el personal que debe tener para prestar el servicio, ya que el pliego adjunta el número de contratos realizados, y no detalla como en otros contratos cual es el personal necesario para realizarlo de una forma adecuada.\r\n\r\nAdemás indicaron que exige la creación de una bolsa de trabajo temporal y que “en caso de necesidad de ampliación de personal para la prestación del servicio, deberá comunicarse con carácter previo al Ayuntamiento para su autorización”.', '    Bolsa de empleo temporal y autorización previa para contratar personal', '', ''),
(4, 1, 'El Porrat de Ròtova patrimonio, tradición y gastronomía en un fin de semana único\r\n', '2020-02-21 00:00:00', 'La edición de 2020 se ha reforzado con la Fira Agroalimentaària y actuaciones de teatro y música en la calle\r\n\r\nEl Porrat de Sant Macià que celebra Ròtova, en el interior de la Safor, este fin de semana ofrece la oportunidad perfecta para conocer este municipio de la Safor, una localidad de paso entre la costa y el interior de la provincia, situada a 9 kilómetros de Gandia, que nos sorprenderá por su importante patrimonio histórico y cultural y, como no, por sus famosas coques de dacsa.\r\n\r\nPodemos empezar nuestro recorrido por Ròtova en uno de los elementos más destacados en muchos municipios valencianos: el castillo. En este caso, el Castillo de Borró, bautizado así porque lo encontramos en la parte alta de la Peña de Borró, a una altitud de 240 metros y del que hoy nos quedan las ruinas. Mejor conservado está el Palacio de los Condes de Ròtova, un edificio de finales del siglo XVI, aunque ha sufrido importantes modificaciones, sobre todo en el siglo XVIII. Es el típico palacio rural, con un patio de armas o patio central a partir del cual se configuran el resto de estancias.\r\n\r\nLes Coques de Dacsa, patrimonio gastronómico\r\n\r\nPero si se conocida Ròtova es por sus “Coques de Dacsa”. Un plato muy típico de la comarca de la Safor pero que tiene en esta localidad su máximo exponente. Las “coques de dacsa” o tortas de maíz se hacen escaldando harina con agua hirviendo y luego se tuestan a la plancha. Normalmente se acompaña con huevo duro, atún, tomate y anchoas aunque si pregunta, en cada casa rotovina se comen de una manera.\r\n\r\nTanto las clásicas como las versiones más atrevidas las podrá probar este fin de semana en alguno de los bares y restaurantes de Ròtova. Sin duda, la mejor opción para coger fuerzas y continuar disfrutando al máximo de todas las propuestas que nos ofrece la edición del Porrat de Sant Macià de 2020.\r\n\r\nPorrat de Sant Macià\r\n\r\nComo cada año, el último fin de semana completo de febrero Ròtova se convierte en punto de encuentro entre las comarcas de la Safor y la Vall d’Albaida. Durante los cuatro días, este hecho se verá reforzado con la presencia de agrupaciones de las dos comarcas: las dos muixerangues harán un encuentro, balladors y balladores de la Safor y de la Vall d’Albaida acudirán al sarao de la Rondalla Agredolç; y se inaugurarán en el municipio dos exposiciones de ambas comarcas.\r\n\r\nLa edición de 2020 verá reforzada la Fira Agroalimentaria, Artesana i Turística, que se ubicará en una carpa, y en la que se sortearán obsequios de los establecimientos de Ròtova, entre la gente que acuda a comprar a él, en una campaña -Torna a Ròtova- que quiere fomentar el retorno de visitantes; además, establecimientos y paradas del municipio harán posible probar las ya comentadas “Coques de Dacsa”. Uno de los espacios nuevos será el que acogerá el patio del palacio condal, con una programación de cuentos y novelas y la presencia de editoriales.\r\n\r\nEntre las actuaciones destacadas, están las de Jonatan Penalba y la que busca dirigirse al público infantil, Trobadorets. Finalmente, otra de las novedades de este año tendrá lugar la noche del sábado, que se vivirá en una carpa joven, con la actuación de la discomóvil The Luxe.\r\n\r\nHistoria, cultura, patrimonio, gastronomia, diversión… todo esto se dará cita en el Porrat de Sant Macià este fin de semana. La excusa perfecta para acercarnos a conocer Ròtova y todo lo que tiene para ofrecernos.\r\n\r\nConsulta aquí toda la programación:', 'Les Coques de Dacsa, patrimonio gastronómico', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia_categoria`
--

CREATE TABLE `noticia_categoria` (
  `noticia_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `iduser` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET ucs2 COLLATE ucs2_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci DEFAULT NULL,
  `roles` longtext CHARACTER SET ucs2 COLLATE ucs2_unicode_ci NOT NULL,
  `imagen_user` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`iduser`, `username`, `password`, `fullname`, `email`, `roles`, `imagen_user`) VALUES
(1, 'juanjo', 'juanjo', 'juanjose', 'banderajj1995@gmail.com', 'admin', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nomCategoria` (`nomCategoria`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `IDX_53AD8F834B89032C` (`new_id`),
  ADD KEY `IDX_53AD8F83F675F31B` (`author_id`);

--
-- Indices de la tabla `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`idnews`),
  ADD KEY `author_id` (`author_id`) USING BTREE;
ALTER TABLE `noticias` ADD FULLTEXT KEY `title` (`title`);

--
-- Indices de la tabla `noticia_categoria`
--
ALTER TABLE `noticia_categoria`
  ADD PRIMARY KEY (`noticia_id`,`categoria_id`),
  ADD KEY `noticia_id` (`noticia_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `idnews` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `FK_53AD8F83F675F31B` FOREIGN KEY (`author_id`) REFERENCES `usuarios` (`iduser`);

--
-- Filtros para la tabla `noticia_categoria`
--
ALTER TABLE `noticia_categoria`
  ADD CONSTRAINT `FK_6ABC1CC44B89032C` FOREIGN KEY (`noticia_id`) REFERENCES `noticias` (`idnews`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6ABC1CC4BAD26311` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
