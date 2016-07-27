<?php

class DispositivoDAO {
    	
	public function insertar($vo) {
		try { 
			$db = Conexion::getConexion();			
			$stmt = $db->prepare('INSERT INTO dispositivo (usuario, codigo_gcm, aplicacion, mac) values (?, ?, ?, ?)');
			$datos = array($vo->usuario, $vo->codigoGCM, $vo->aplicacion, $vo->mac);
			$db->beginTransaction();
			$stmt->execute($datos);
			$db->commit();
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . '<br/>';
			$mensaje .= '<b>Consulta: </b>' . $sql;
			die($mensaje);
		}		
	}
}

?>