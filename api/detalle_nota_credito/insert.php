<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// incluye la configuración de la base de datos y la conexión
include_once '../config/database.php';
include_once '../objects/detalle_nota_credito.php';
 
// inicia la conexión a la base de datos
$database = new Database();
$db = $database->getConnection();
 
// inicia el objeto
$nota_credito = new DetalleNotaCredito($db);
 
// get posted data
$data = json_decode(file_get_contents('php://input'), true);

$info = array($data);

// configura los valores recibidos en post de la app
$nota_credito->dp_nota_credito= $info[0]["dp_nota_credito"];
$nota_credito->dp_id_prod_dnc= $info[0]["dp_id_prod_dnc"];
$nota_credito->dp_codigo_prod_dnc= $info[0]["dp_codigo_prod_dnc"];
$nota_credito->dp_iess_prod_dnc= $info[0]["dp_iess_prod_dnc"];
$nota_credito->dp_nombre_prod_dnc= $info[0]["dp_nombre_prod_dnc"];
$nota_credito->dp_cant_prod_dnc= $info[0]["dp_cant_prod_dnc"];
$nota_credito->dp_iva_dnc= $info[0]["dp_iva_dnc"];
$nota_credito->dp_precio_prod_dnc= $info[0]["dp_precio_prod_dnc"];
$nota_credito->dp_descuento_prod_dnc= $info[0]["dp_descuento_prod_dnc"];
$nota_credito->dp_subtotal_prod_dnc= $info[0]["dp_subtotal_prod_dnc"];
$nota_credito->dp_total_prod_dnc= $info[0]["dp_total_prod_dnc"];

// insert nota_credito
$response = $nota_credito->insert();
if($response != false){
    $response = $response * 1;
    echo json_encode($response); 
}else{
    // Error en caso de que no se pueda modificar
    echo json_encode(false);
}
?>