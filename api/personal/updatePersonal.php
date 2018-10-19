<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// incluye la configuración de la base de datos y la conexión
include_once '../config/database.php';
include_once '../objects/personal.php';
 
// inicia la conexión a la base de datos
$database = new Database();
$db = $database->getConnection();
 
// inicia el objeto
$personal = new Personal($db);
 
// get posted data
$data = json_decode(file_get_contents('php://input'), true);

$info = array($data);
 
// configura los valores recibidos en post de la app
$personal->df_tipo_documento_per=$info[0]["df_tipo_documento_per"];
$personal->df_documento_per=$info[0]["df_documento_per"];
$personal->df_nombre_per= $info[0]["df_nombre_per"];
$personal->df_apellido_per= $info[0]["df_apellido_per"];
$personal->df_cargo_per= $info[0]["df_cargo_per"];
$personal->df_fecha_ingreso= $info[0]["df_fecha_ingreso"];
$personal->df_correo_per= $info[0]["df_correo_per"];
$personal->df_codigo_personal= $info[0]["df_codigo_personal"];
$personal->df_telefono_per= $info[0]["df_telefono_per"];
$personal->df_celular_per= $info[0]["df_celular_per"];
$personal->df_fecha_nac_per= $info[0]["df_fecha_nac_per"];
$personal->df_direccion_per= $info[0]["df_direccion_per"];
$personal->df_contrato_per= $info[0]["df_contrato_per"];
$personal->df_nombre_contacto= $info[0]["df_nombre_contacto"];
$personal->df_telefono_contacto= $info[0]["df_telefono_contacto"];
$personal->df_activo_per= $info[0]["df_activo_per"];
$personal->df_id_personal= $info[0]["df_id_personal"];

// modificar personal
$response = $personal->updatePersonal();
if($response == true){
    echo json_encode(true); 
}else{
    // Error en caso de que no se pueda modificar
    echo json_encode(false); 
}
?>