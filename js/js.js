// $(document).ready(inicio)
// function inicio(){
// 	$(".botoncompra").click(agregar)
// }
// function agregar(){
// 	$("#carrito").append($(this).val());
// }
//



$(document).ready(inicio)
function inicio(){
	$(".botoncompra").click(agregar)
	$("#carrito").load("poncarrito.php");

}
function agregar(){
	$("#carrito").load("poncarrito.php?p="+$(this).val());

}
