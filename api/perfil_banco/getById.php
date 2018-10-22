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
$perfilBanco->dp_id_perfil_ban = $info[0]["dp_id_perfil_ban"];


// query de lectura
$stmt = $perfilBanco->readById();
$num = $stmt->rowCount();

// perfilBanco array
$perfilBanco_arr=array();
$perfilBanco_arr["data"]=array();
 
// check if more than 0 record found
if($num>0){ 
    
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);

        $perfilBanco_item=array(
            "dp_id_perfil_ban"=>$dp_id_perfil_ban,
            "dp_descripcion_per_ban"=>$dp_descripcion_per_ban, 
            "dp_banco_per_ban"=>$dp_banco_per_ban,
            "dp_cuenta_per_ban"=>$dp_cuenta_per_ban,
            "dp_tipo_cuenta_per_ban"=>$dp_tipo_cuenta_per_ban,
            "dp_tipo_per_ban"=>$dp_tipo_per_ban,
            "dp_fecha_creacion_per_ban"=>$dp_fecha_creacion_per_ban,
            "dp_creadoby_per_ban"=>$dp_creadoby_per_ban,
            "dp_fecha_modifica_per_ban"=>$dp_fecha_modifica_per_ban,
            "dp_modificadoby_per_ban"=>$dp_modificadoby_per_ban
        );
 
        array_push($perfilBanco_arr["data"], $perfilBanco_item);
    }
 
    echo json_encode($perfilBanco_arr);
}
 
else{
    echo json_encode($perfilBanco_arr);
}
?>