<?php
class NoticiaDAO {
	public function listar() {
		try {
			$db = Conexion::getConexion ();
			$stmt = $db->prepare ( 'SELECT * FROM noticia' );
			$stmt->execute ();
			$filas = $stmt->fetchAll ( PDO::FETCH_ASSOC );
			foreach ( $filas as $fila ) {
				$vo = new Noticia ();
				$vo->idNoticia = $fila ['id_noticia'];
				$vo->titulo = $fila ['titulo'];
				$vo->fecha = $fila ['fecha'];
				$vo->descripcion = $fila ['descripcion'];
				$objetos [] = $vo;
			}
			return $objetos;
		} catch ( PDOException $e ) {
			$db->rollback ();
			$mensaje = '<b>Consulta inválida:</b> ' . $e->getMessage () . '<br/>';
			$mensaje .= '<b>Consulta: </b>' . $sql;
			die ( $mensaje );
		}
	}
	public function listarRecientes() {
		try {
			$db = Conexion::getConexion ();
			$stmt = $db->prepare ( 'SELECT id_noticia, titulo, fecha FROM noticia ORDER BY fecha DESC LIMIT 500' );
			// $stmt = $db->prepare('SELECT id_noticia, titulo, fecha FROM noticia ORDER BY fecha DESC');
			$stmt->execute ();
			$filas = $stmt->fetchAll ( PDO::FETCH_ASSOC );
			foreach ( $filas as $fila ) {
				$vo = new Noticia ();
				$vo->idNoticia = $fila ['id_noticia'];
				$vo->titulo = $fila ['titulo'];
				$vo->fecha = $fila ['fecha'];
				$objetos [] = $vo;
			}
			return $objetos;
		} catch ( PDOException $e ) {
			$db->rollback ();
			$mensaje = '<b>Consulta inválida:</b> ' . $e->getMessage () . '<br/>';
			$mensaje .= '<b>Consulta: </b>' . $sql;
			die ( $mensaje );
		}
	}
	public function obtener($idNoticia) {
		try {
			$db = Conexion::getConexion ();
			$stmt = $db->prepare ( 'SELECT * FROM noticia WHERE id_noticia = ?' );
			$stmt->bindValue ( 1, $idNoticia, PDO::PARAM_INT );
			$stmt->execute ();
			$fila = $stmt->fetchObject ();
			$vo = new Noticia ();
			$vo->idNoticia = $fila->id_noticia;
			$vo->titulo = $fila->titulo;
			$vo->fecha = $fila->fecha;
			$vo->descripcion = $fila->descripcion;
			return $vo;
		} catch ( PDOException $e ) {
			$db->rollback ();
			$mensaje = '<b>Consulta inválida:</b> ' . $e->getMessage () . '<br/>';
			$mensaje .= '<b>Consulta: </b>' . $sql;
			die ( $mensaje );
		}
	}
	public function insertar($vo) {
		try {
			$db = Conexion::getConexion ();
			$stmt = $db->prepare ( 'INSERT INTO noticia (titulo, descripcion) VALUES (?, ?)' );
			$datos = array (
					$vo->titulo,
					$vo->descripcion 
			);
			$db->beginTransaction ();
			$stmt->execute ( $datos );
			$db->commit ();
		} catch ( PDOException $e ) {
			$db->rollback ();
			$mensaje = '<b>Consulta inválida:</b> ' . $e->getMessage () . '<br/>';
			$mensaje .= '<b>Consulta: </b>' . $sql;
			die ( $mensaje );
		}
	}
}

?>