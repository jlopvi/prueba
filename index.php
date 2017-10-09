<?php
include 'header.php';
include 'conexion.php';
$peticion="SELECT * FROM productos";
$resultado = mysqli_query($conexion, $peticion);
echo "<meta charset='UTF-8'>";

while($fila = mysqli_fetch_array($resultado)){
	echo "<article>";
	$peticion2="SELECT * FROM imagenesproducto WHERE idproducto = ".$fila['idproducto']." LIMIT 1";
	$resultado2 = mysqli_query($conexion, $peticion2);
while($fila2 = mysqli_fetch_array($resultado2)){
	echo "<img src='photo/".$fila2['imagen']."' width=100px>";
	}
	echo "<h3>".$fila['nombre']."</h3>";
	echo "<p>Precio $".$fila['precio']."</p>";
	echo "<a href='producto.php?idproducto=".$fila['idproducto']."'><button>Mas información</button></a>";
	echo "<button value='".$fila['idproducto']."' class='botoncompra'>Comprar Ahora</button>";
	echo "<article>";
}
mysqli_close($conexion);
?>
