<?php
	session_start();
	if(!isset($_SESSION['contador'])) {$_SESSION['contador'] =0;}
?>
<html>
	
	<head>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<style media="screen">
			.carrito{
				color: #ffffff;
			}
		</style>
	</head>

	<body>
		<a href="index.php"><h2> Tienda </h1></a>
		<div id="carrito" style="background:black;color:white;">
		  Carrito
		  </div>
		  <div>
				<a href="destruir.php"><button>Vaciar Carrito</button></a>
				<a href="confirmar.php"><button>Confirmar compra</button></a>

		  </div>

	</body>
	</html>
