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
$personal = new personal($db);

// get posted data
$data = json_decode(file_get_contents('php://input'), true);

$info = array($data);

// configura los valores recibidos en post de la app
$personal->df_nombre_per= $info[0]["df_nombre_per"];

// query de lectura
$stmt = $personal->readByNombre();
$num = $stmt->rowCount();

// personal array
$personal_arr=array();
$personal_arr["data"]=array();
 
// check if more than 0 record found
if($num>0){ 
    
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $personal_item=array(
            "df_id_personal"=>$df_id_personal,
            "df_nombre_per"=>$df_nombre_per,
            "df_cargo_per"=>$df_cargo_per,
            "df_fecha_ingreso"=>$df_fecha_ingreso,
            "df_documento_per"=>$df_documento_per,
            "df_correo_per"=>$df_correo_per,
            "df_codigo_personal"=>$df_codigo_personal,
            "df_activo_per"=>$df_activo_per,
            "df_tipo_documento_per"=>$df_tipo_documento_per,
            "df_id_usuario"=>$df_id_usuario,
            "df_tipo_documento_usuario"=>$df_tipo_documento_usuario,
            "df_documento_usuario"=>$df_documento_usuario,
            "df_nombre_usuario"=>$df_nombre_usuario,
            "df_apellido_usuario"=>$df_apellido_usuario,
            "df_usuario_usuario"=>$df_usuario_usuario,
            "df_personal_cod"=>$df_personal_cod,
            "df_clave_usuario"=>$df_clave_usuario,
            "df_activo"=>$df_activo,
            "df_correo"=>$df_correo,
            "df_tipo_usuario"=>$df_tipo_usuario,
            "df_id_detper"=>$df_id_detper,
            "df_sueldo_detper"=>$df_sueldo_detper,
            "df_bono_detper"=>$df_bono_detper,
            "df_anticipo_detper"=>$df_anticipo_detper,
            "df_descuento_detper"=>$df_descuento_detper,
            "df_decimos_detper"=>$df_decimos_detper,
            "df_vacaciones_detper"=>$df_vacaciones_detper,
            "df_tabala_comision_detper"=>$df_tabala_comision_detper,
            "df_comisiones_detper"=>$df_comisiones_detper,
            "df_personal_cod_detper"=>$df_personal_cod_detper,
            "df_usuario_detper"=>$df_usuario_detper,
            "df_fecha_proceso"=>$df_fecha_proceso
        );
 
        array_push($personal_arr["data"], $personal_item);
    }
 
    echo json_encode($personal_arr);
}
 
else{
    echo json_encode($personal_arr);
}
?>