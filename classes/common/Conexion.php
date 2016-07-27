<?php
class Conexion {
	private static $instance;
	public static function getConexion() {
		if (self::$instance == NULL) {
			// $PDOinstance = new PDO ( 'mysql:host=localhost;dbname=rvilela_android;charset=utf8', 'rvilela_android', '123abc' );
			$PDOinstance = new PDO ( 'mysql:host=stevie.heliohost.org;dbname=rvilela_android;charset=utf8', 'rvilela_android', '123abc' );
			$PDOinstance->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
			self::$instance = $PDOinstance;
		}
		return self::$instance;
	}
}

?>