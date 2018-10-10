<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// incluye la configuración de la base de datos y la conexión
include_once '../config/database.php';
include_once '../objects/detalleEntrega.php';
 
// inicia la conexión a la base de datos
$database = new Database();
$db = $database->getConnection();
 
// inicia el objeto
$detalleEntrega = new DetalleEntrega($db);

// get posted data
$data = json_decode(file_get_contents('php://input'), true);

$info = array($data);

$detalleEntrega->df_guia_entrega= $info[0]["df_guia_entrega"];
// query de lectura
$stmt = $detalleEntrega->readById();
$num = $stmt->rowCount();

//detalleEntrega array
$detalleEntrega_arr=array();
$detalleEntrega_arr["data"]=array();
 
// check if more than 0 record found
if($num>0){ 
    
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
        
        //Los nombres acá son iguales a los de la clase iguales a las columnas de la BD
        $detalleEntrega_item=array(
            "df_id_detent"=>$df_id_detent, 
			"df_guia_entrega"=>$df_guia_entrega,
			"df_cod_producto"=>$df_cod_producto, 
             "df_cant_producto_detent"=>$df_cant_producto_detent,
             "df_factura_detent"=>$df_factura_detent,
             "df_nom_producto_detent"=>$df_nom_producto_detent,
             "df_num_factura_detent"=>$df_num_factura_detent
        );
 
        array_push($detalleEntrega_arr["data"], $detalleEntrega_item);
    }
 
    echo json_encode($detalleEntrega_arr);
}
 
else{
    echo json_encode($detalleEntrega_arr);
}
?>