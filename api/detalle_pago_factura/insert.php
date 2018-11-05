<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// incluye la configuración de la base de datos y la conexión
include_once '../config/database.php';
include_once '../objects/detalle_pago_factura.php';

// inicia la conexión a la base de datos
$database = new Database();
$db = $database->getConnection();
 
// inicia el objeto
$detalle_pago_factura = new DetallePagoFactura($db);
 
// get posted data
$data = json_decode(file_get_contents('php://input'), true);

$info = array($data);

// configura los valores recibidos en post de la app
$detalle_pago_factura->factura_id = $info[0]["factura_id"];
$detalle_pago_factura->metodo_pago_id = $info[0]["metodo_pago_id"];
$detalle_pago_factura->banco_emisor = $info[0]["banco_emisor"];
$detalle_pago_factura->banco_receptor = $info[0]["banco_receptor"];
$detalle_pago_factura->codigo = $info[0]["codigo"];
$detalle_pago_factura->fecha = $info[0]["fecha"];
$detalle_pago_factura->tipo_tarjeta = $info[0]["tipo_tarjeta"];
$detalle_pago_factura->franquicia = $info[0]["franquicia"];
$detalle_pago_factura->recibo = $info[0]["recibo"];
$detalle_pago_factura->titular = $info[0]["titular"];
$detalle_pago_factura->cheque = $info[0]["cheque"];

// insert detalle_pago_factura
$response = $detalle_pago_factura->insert();
if($response == true){
    echo json_encode(true); 
}else{
    // Error en caso de que no se pueda modificar
    echo json_encode(false); 
}
?>