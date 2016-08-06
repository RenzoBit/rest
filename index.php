<?php
require_once './autoload.php';
require_once './lib/Slim/Slim.php';

// Autocarga de la librería
\Slim\Slim::registerAutoloader ();

// Creando una instancia del Slim
$app = new \Slim\Slim ();
$app->response->header ( 'Content-Type', 'application/json' );

$app->get ( '/productos', function () {
	$dao = new ProductoDAO ();
	$lista = $dao->listar ();
	echo json_encode ( $lista );
} );

$app->get ( '/productos/:nombre', function ($nombre) {
	$dao = new ProductoDAO ();
	$objeto = $dao->buscarPorNombre ( $nombre );
	echo json_encode ( $objeto );
} );

$app->post ( '/productos', function () use ($app) {
	$idCategoria = $app->request ()->post ( 'idCategoria' );
	$nombre = $app->request ()->post ( 'nombre' );
	$precio = $app->request ()->post ( 'precio' );
	
	$vo = new Producto ();
	$vo->idCategoria = $idCategoria;
	$vo->nombre = $nombre;
	$vo->precio = $precio;
	
	$dao = new ProductoDAO ();
	$dao->insertar ( $vo );
	echo json_encode ( array (
			'mensaje' => 'Producto registrado satisfactoriamente',
			'estado' => 'CORRECTO' 
	) );
} );

$app->get ( '/productos/producto/:idProducto', function ($idProducto) {
	$dao = new ProductoDAO ();
	$objeto = $dao->obtener ( $idProducto );
	echo json_encode ( $objeto );
} );

$app->put ( '/productos/:idProducto/:nombre/:precio', function ($idProducto, $nombre, $precio) {
	$dao = new ProductoDAO ();
	$objeto = $dao->obtener ( $idProducto );
	$objeto->nombre = $nombre;
	$objeto->precio = $precio;
	$dao->actualizar ( $objeto );
	echo json_encode ( array (
			'mensaje' => 'Producto actualizado satisfactoriamente',
			'estado' => 'CORRECTO' 
	) );
} );

/*
 * $app->put('/productos/:id', function($id) use ($app) {
 * $body = $app->request->getBody();
 * $producto = json_decode($body);
 * $producto->id = $id;
 * $dao = new ProductoDAO();
 * $dao->actualizar($producto);
 * echo json_encode(array('mensaje' => 'Producto actualizado satisfactoriamente'));
 * });
 *
 * $app->delete('/productos/:id', function($id) {
 * $dao = new ProductoDAO();
 * $dao->eliminar($id);
 * echo json_encode(array('mensaje' => 'Producto eliminado satisfactoriamente'));
 * });
 */

$app->get ( '/avisos', function () {
	$dao = new AvisoDAO ();
	$lista = $dao->listar ();
	echo json_encode ( $lista );
} );

$app->get ( '/avisos/:titulo', function ($titulo) {
	$dao = new AvisoDAO ();
	$objeto = $dao->buscarPorTitulo ( $titulo );
	echo json_encode ( $objeto );
} );

$app->post ( '/avisos', function () use ($app) {
	$titulo = $app->request ()->post ( 'titulo' );
	$fechaInicio = $app->request ()->post ( 'fechaInicio' );
	$fechaFin = $app->request ()->post ( 'fechaFin' );
	
	$vo = new Aviso ();
	$vo->titulo = $titulo;
	$vo->fechaInicio = $fechaInicio;
	$vo->fechaFin = $fechaFin;
	
	$dao = new AvisoDAO ();
	$dao->insertar ( $vo );
	echo json_encode ( array (
			'mensaje' => 'Aviso registrado satisfactoriamente' 
	) );
} );

$app->get ( '/noticias', function () {
	$dao = new NoticiaDAO ();
	$lista = $dao->listarRecientes ();
	echo json_encode ( $lista );
} );

$app->get ( '/noticias/:idNoticia', function ($idNoticia) {
	$dao = new NoticiaDAO ();
	$objeto = $dao->obtener ( $idNoticia );
	echo json_encode ( $objeto );
} );

$app->post ( '/mensajes', function () use ($app) {
	$tipo = $app->request ()->post ( 'tipo' );
	$descripcion = $app->request ()->post ( 'descripcion' );
	$archivo = $app->request ()->post ( 'archivo' );
	$foto = $app->request ()->post ( 'foto' );
	
	$vo = new Mensaje ();
	$vo->tipo = $tipo;
	$vo->descripcion = $descripcion;
	$vo->archivo = $archivo;
	
	$dao = new MensajeDAO ();
	$dao->insertar ( $vo );
	
	$data = base64_decode ( $foto );
	// file_put_contents('fotos/' . $archivo, $data);
	file_put_contents ( '/home/rvilela/public_html/fotos/' . $archivo, $data );
	echo json_encode ( array (
			'mensaje' => 'Mensaje registrado satisfactoriamente' 
	) );
} );

$app->post ( '/dispositivos', function () use ($app) {
	$usuario = $app->request ()->post ( 'usuario' );
	$codigoGCM = $app->request ()->post ( 'codigoGCM' );
	$aplicacion = $app->request ()->post ( 'aplicacion' );
	$mac = $app->request ()->post ( 'mac' );
	
	$vo = new Dispositivo ();
	$vo->usuario = $usuario;
	$vo->codigoGCM = $codigoGCM;
	$vo->aplicacion = $aplicacion;
	$vo->mac = $mac;
	
	$dao = new DispositivoDAO ();
	$dao->insertar ( $vo );
	echo json_encode ( array (
			'estado' => 'CORRECTO' 
	) );
} );

$app->run ();

?>