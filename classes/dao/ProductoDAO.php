<?php

class ProductoDAO {

	public function listar() {
		try {
			$db = Conexion::getConexion();
			$stmt = $db->prepare('SELECT * FROM producto');
			$stmt->execute();
			$filas = $stmt->fetchAll(PDO::FETCH_ASSOC);
			foreach($filas as $fila) {
				$vo = new Producto();
				$vo->idProducto = $fila['id_producto'];
				$vo->nombre = $fila['nombre'];
				$vo->descripcion = $fila['descripcion'];
				$vo->precio = $fila['precio'];
				$vo->stock = $fila['stock'];
				$vo->importancia = $fila['importancia'];
				$vo->imagen = $fila['imagen'];
				$vo->idCategoria = $fila['id_categoria'];
				$objetos[] = $vo;
			}
			return $objetos;
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . '<br/>';
			$mensaje .= '<b>Consulta: </b>' . $sql;
			die($mensaje);
		}
	}

	public function buscarPorNombre($nombre) {
		try {
			$db = Conexion::getConexion();
			$stmt = $db->prepare('SELECT * FROM producto WHERE nombre LIKE ?');
			$stmt->bindValue(1, "%$nombre%", PDO::PARAM_STR);
			$stmt->execute();
			$filas = $stmt->fetchAll(PDO::FETCH_ASSOC);
			$objetos = array();
			foreach($filas as $fila) {
				$vo = new Producto();
				$vo->idProducto = $fila['id_producto'];
				$vo->nombre = $fila['nombre'];
				$vo->descripcion = $fila['descripcion'];
				$vo->precio = $fila['precio'];
				$vo->stock = $fila['stock'];
				$vo->importancia = $fila['importancia'];
				$vo->imagen = $fila['imagen'];
				$vo->idCategoria = $fila['id_categoria'];
				$objetos[] = $vo;
			}
			return $objetos;
		} catch (PDOException $e) {
			$db->rollback();
			$mensaje  = '<b>Consulta inválida:</b> ' . $e->getMessage() . '<br/>';
			$mensaje .= '<b>Consulta: </b>' . $sql;
			die($mensaje);
		}
	}

	public function insertar($vo) {
		try {
			$db = Conexion::getConexion();
			$stmt = $db->prepare('INSERT INTO producto (nombre, descripcion, precio, stock, importancia, imagen, id_categoria) VALUES (?, ?, ?, ?, ?, ?, ?)');
			$datos = array($vo->nombre, $vo->descripcion, $vo->precio, $vo->stock, $vo->importancia, $vo->imagen, $vo->idCategoria);
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

	public function actualizar($vo) {
		try {
			$db = Conexion::getConexion();
			$stmt = $db->prepare('UPDATE producto SET nombre = ?, descripcion = ?, precio = ?, stock = ?, importancia = ?, imagen = ?, id_categoria = ? WHERE id_producto = ?');
			$datos = array($vo->nombre, $vo->descripcion, $vo->precio, $vo->stock, $vo->importancia, $vo->imagen, $vo->idCategoria, $vo->idProducto);
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

	public function eliminar($idProducto) {
		try {
			$db = Conexion::getConexion();  
			$stmt = $db->prepare('DELETE FROM producto WHERE id_producto = ?');
			$datos = array($idProducto);
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