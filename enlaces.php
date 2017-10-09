<?php
session_start();
if(!isset($_SESSION['contador'])) {$_SESSION['contador'] =0;}
?>
<?php
	include 'i.php';
	include 'header.php';
	$peticion = "SELECT * FROM productos";
	$resultado = mysqli_query($conexion, $peticion);
	while($fila = mysqli_fetch_array($resultado) {
		echo "<article>";
	$peticion2 = "SELECT * FROM imagenproducto WHERE idproducto = ".$fila ['idproducto']." LIMIT 1";
	$resultado2 = mysqli_query($conexion, $peticion2) or die (mysql_error());
	while($fila2 = mysqli_fetch_array($resultado2)){
		echo "<img src='img/".$fila2 ['imagen']."' width=100px>";
	}
	echo "<h3>".$fila ['nombre']."</h3>";
	echo "<p>Precio: $".$fila ['precio']."</p>";
	echo "<a href='producto.php?idproducto=".$fila['idproducto']."'><button>Mas informacion</button></a>";
	echo"<button value='".$fila['idproducto']."' class='botoncompra'>Comprar ahora</button>";
	echo "</article>";
	
	}
	
	mysqli_close($conexion);
	?>