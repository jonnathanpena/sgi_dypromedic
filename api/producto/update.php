<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// incluye la configuración de la base de datos y la conexión
include_once '../config/database.php';
include_once '../objects/producto.php';
 
// inicia la conexión a la base de datos
$database = new Database();
$db = $database->getConnection();
 
// inicia el objeto
$producto = new Producto($db);
 
// get posted data
$data = json_decode(file_get_contents('php://input'), true);

$info = array($data);
 
// configura los valores recibidos en post de la app
$producto->df_nombre_producto= $info[0]["df_nombre_producto"];
$producto->df_codigo_prod= $info[0]["df_codigo_prod"];
$producto->dp_codigo_iess_pro= $info[0]["dp_codigo_iess_pro"];
$producto->dp_tipo_pro= $info[0]["dp_tipo_pro"];
$producto->dp_categoria_pro= $info[0]["dp_categoria_pro"];
$producto->dp_materia_prima_pro= $info[0]["dp_materia_prima_pro"];
$producto->dp_producto_final_pro= $info[0]["dp_producto_final_pro"];
$producto->dp_servicio_pro= $info[0]["dp_servicio_pro"];
$producto->dp_impuesto_compra_pro= $info[0]["dp_impuesto_compra_pro"];
$producto->df_id_producto= $info[0]["df_id_producto"];

// modificar producto
$response = $producto->update();
if($response == true){
    echo json_encode(true); 
}else{
    // Error en caso de que no se pueda modificar
    echo json_encode(false); 
}
?>