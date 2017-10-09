<table border=1>
<?php
include '../conexion.php';
mysqli_set_charset($conexion, "utf8");
$peticion ="SELECT pedidos.idpedido AS idpedido,fecha,estado,nombre,apellidos FROM pedidos LEFT JOIN clientes ON pedidos.idcliente = clientes.idcliente ORDER BY estado,fecha ASC";
$resultado = mysqli_query($conexion, $peticion);
while($fila = mysqli_fetch_array($resultado)){
	$estado = $fila['estado'];
	switch ($estado){
		case 0:$diestado ="No Enviado";break;
		case 1:$diestado ="Enviado";break;
		case 2:$diestado ="Anulado";break;
	}
		echo '<tr';
	switch ($estado){
		case 0:echo 'style="background:rgb(255,200,200);"';break;
		case 1:echo 'style="background:rgb(200,255,200);"';break;
		case 2:echo 'style="background:rgb(255,255,200);"';break;
	}
		echo'><td>'.$fila['nombre']." ".$fila['apellidos'].'</td>
		<td>'.$diestado.'</td><td><a href="gestionpedido.php?id='.$fila['idpedido'].'"><button>Gestionar</button></a></td>
		<td><a href="pedidoservido.php?id='.$fila['idpedido'].'"><button>Pedido Enviado</button></a></td>
		<td><a href="cancelarpedido.php?id='.$fila['idpedido'].'"><button>Cancelar Pedido</button></a></td>

		</tr>';
}
mysqli_close($conexion);
?>
</table>
