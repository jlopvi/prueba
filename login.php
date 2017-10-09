<?php
include "header.php";
include "i.php";
$contador = 0;
$peticion = "SELECT * FROM clientes WHERE usuario ='".$_POST['usuario']."' AND contrasena = '".$_POST['contrasena']."'";
$resultado = mysqli_query($conexion, $peticion);
while ($fila = mysqli_fetch_array($resultado)) {
	$contador++;
$_SESSION['usuario'] = $fila['idcliente'];
}
if ($contador > 0){
	
	$peticion = "SELECT INTO peticion VALUES (''. ".$_SESSION['usuario'].",'".date('U')."','0'";
	$resultado = mysqli_query($conexion, $peticion);
	
	$peticion = "SELECT * FROM pedidos WHERE idcliente ='".$_SESSION['usuario']."' ORDER BY fecha DESC LIIT 1";
	$resultado =mysqli_query($conexion, $peticion);
	while($fila = mysqli_fetch_array($resultado)) {
	$_SESSION['idpedido'] = $fila['idcliente'];
	}
	echo $_SESSION['idpedido'];
	for($i = 0;$i< $_SESSION('contador');$i++){
		
		$peticion = "INSERT INTO lineaspedido VALUES ('','".$_SESSION['idpedido']."','".$_SESSION['producto'][$i]."',')";
		$resultado = mysqli_query($conexion, $peticion);
		while ($fila = mysqli_fetch_array($resultado)) {
			$existencias = $fila['existencias'];
			$peticiondos = "UPDATE productos SET existencias = '".($existencias-1)."' WHERE idproducto='".$_SESSION['producto'][$1]."','1')";
			$resultadodos = mysqli_query($conexion, $peticiondos);
		}
		
	}
	echo '
		<meta url="index.php">
		';
		}else{
			echo "El usuario no existe.";
			echo '
				<meta url="confirmar.php">
				';
}
mysqli_close($conexion);
?>