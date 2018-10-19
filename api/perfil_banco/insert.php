<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// incluye la configuración de la base de datos y la conexión
include_once '../config/database.php';
include_once '../objects/perfil_banco.php';
 
// inicia la conexión a la base de datos
$database = new Database();
$db = $database->getConnection();
 
// inicia el objeto
$perfilBanco = new PerfilBanco($db);
 
// get posted data
$data = json_decode(file_get_contents('php://input'), true);

$info = array($data);
 
// configura los valores recibidos en post de la app
$perfilBanco->dp_descripcion_per_ban= $info[0]["dp_descripcion_per_ban"];
$perfilBanco->dp_banco_per_ban= $info[0]["dp_banco_per_ban"];
$perfilBanco->dp_cuenta_per_ban= $info[0]["dp_cuenta_per_ban"];
$perfilBanco->dp_tipo_cuenta_per_ban= $info[0]["dp_tipo_cuenta_per_ban"];
$perfilBanco->dp_tipo_per_ban= $info[0]["dp_tipo_per_ban"];
$perfilBanco->dp_fecha_creacion_per_ban= $info[0]["dp_fecha_creacion_per_ban"];
$perfilBanco->dp_creadoby_per_ban= $info[0]["dp_creadoby_per_ban"];


// insert perfilBanco
$response = $perfilBanco->insert();
if($response == true){
    echo json_encode(true); 
}else{
    // Error en caso de que no se pueda modificar
    echo json_encode(false); 
}
?>