<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// incluye la configuración de la base de datos y la conexión
include_once '../config/database.php';
include_once '../objects/nota_credito.php';
 
// inicia la conexión a la base de datos
$database = new Database();
$db = $database->getConnection();
 
// inicia el objeto
$nota_credito = new NotaCredito($db);
 
// get posted data
$data = json_decode(file_get_contents('php://input'), true);

$info = array($data);

// configura los valores recibidos en post de la app
$nota_credito->dp_fecha_nc= $info[0]["dp_fecha_nc"];
$nota_credito->dp_clave_acceso_nc= $info[0]["dp_clave_acceso_nc"];
$nota_credito->dp_factura_nc= $info[0]["dp_factura_nc"];
$nota_credito->dp_fecha_fac_nc= $info[0]["dp_fecha_fac_nc"];
$nota_credito->dp_cliente_id_nc= $info[0]["dp_cliente_id_nc"];
$nota_credito->dp_cliente_tipo_doc_nc= $info[0]["dp_cliente_tipo_doc_nc"];
$nota_credito->dp_cliente_documento_nc= $info[0]["dp_cliente_documento_nc"];
$nota_credito->dp_cliente_nombre_nc= $info[0]["dp_cliente_nombre_nc"];
$nota_credito->dp_cliente_correo_nc= $info[0]["dp_cliente_correo_nc"];
$nota_credito->dp_motivo_nc= $info[0]["dp_motivo_nc"];
$nota_credito->dp_tipo_doc_venta_nc= $info[0]["dp_tipo_doc_venta_nc"];
$nota_credito->dp_subtotal_nc= $info[0]["dp_subtotal_nc"];
$nota_credito->dp_iva_nc= $info[0]["dp_iva_nc"];
$nota_credito->dp_total_nc= $info[0]["dp_total_nc"];
$nota_credito->dp_creadoby= $info[0]["dp_creadoby"];
$nota_credito->dp_fecha_creacion= $info[0]["dp_fecha_creacion"];


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