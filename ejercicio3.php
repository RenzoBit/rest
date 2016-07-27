<?php

// Estructura condicional
$edad = $_REQUEST ["txtEdad"];

if ($edad >= 18) {
	echo "Mayor de edad";
} else {
	echo "Menor de edad";
}

?>