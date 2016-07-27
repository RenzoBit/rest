<?php
class AvisoDAO {
	public function listar() {
		try {
			$db = Conexion::getConexion ();
			$stmt = $db->prepare ( 'SELECT * FROM aviso' );
			$stmt->execute ();
			$filas = $stmt->fetchAll ( PDO::FETCH_ASSOC );
			foreach ( $filas as $fila ) {
				$vo = new Aviso ();
				$vo->idAviso = $fila ['id_aviso'];
				$vo->titulo = $fila ['titulo'];
				$vo->fechaInicio = $fila ['fecha_inicio'];
				$vo->fechaFin = $fila ['fecha_fin'];
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
	public function buscarPorTitulo($titulo) {
		try {
			$db = Conexion::getConexion ();
			$stmt = $db->prepare ( 'SELECT * FROM aviso WHERE titulo LIKE ?' );
			$stmt->bindValue ( 1, "%$titulo%", PDO::PARAM_STR );
			$stmt->execute ();
			$filas = $stmt->fetchAll ( PDO::FETCH_ASSOC );
			$objetos = array ();
			foreach ( $filas as $fila ) {
				$vo = new Aviso ();
				$vo->idAviso = $fila ['id_aviso'];
				$vo->titulo = $fila ['titulo'];
				$vo->fechaInicio = $fila ['fecha_inicio'];
				$vo->fechaFin = $fila ['fecha_fin'];
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
	public function insertar($vo) {
		try {
			$db = Conexion::getConexion ();
			$stmt = $db->prepare ( 'INSERT INTO aviso (titulo, fecha_inicio, fecha_fin) values (?, ?, ?)' );
			$datos = array (
					$vo->titulo,
					$vo->fechaInicio,
					$vo->fechaFin 
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