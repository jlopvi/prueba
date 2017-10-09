<?php
session_start();
include 'conexion.php';
$suma=0;
if(isset($_GET['p'])){
	$_SESSION['producto'][$_SESSION['contador']] =$_GET['p'];
	$_SESSION['contador']++;
}
echo"<table class='carrito'>";
echo "Carrito: ".$_SESSION['contador']." ";
if($_SESSION['contador'] > 1) {
	echo "productos <br>";
} elseif ($_SESSION['contador'] == 1) {
	echo "producto <br>";
}
for($i =0; $i< ($_SESSION['contador']);$i++){


			$peticion = "SELECT * FROM productos WHERE idproducto=".$_SESSION['producto'][$i]."";
			$resultado = mysqli_query($conexion, $peticion);
			echo "<meta charset ='UTF-8'>";
			while($fila = mysqli_fetch_array($resultado)) {
				echo "<tr><td>".$fila['nombre']."</tr><td>".$fila['precio']."</td></tr>";
				$suma += $fila['precio'];
			}
}
echo "<tr><td>Subtotal</tr><td>".number_format($suma,2)."</td></tr>";
echo "</table>";

?>
