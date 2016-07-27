<?php
class MensajeDAO {
	public function insertar($vo) {
		try {
			$db = Conexion::getConexion ();
			$stmt = $db->prepare ( 'INSERT INTO mensaje (tipo, descripcion, archivo) VALUES (?, ?, ?)' );
			$datos = array (
					$vo->tipo,
					$vo->descripcion,
					$vo->archivo 
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