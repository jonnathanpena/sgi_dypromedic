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

// query de lectura
$stmt = $detalle_pago_factura->readByFactura();
$num = $stmt->rowCount();

// detalle_pago_factura array
$detalle_pago_factura_arr=array();
$detalle_pago_factura_arr["data"]=array();
 
// check if more than 0 record found
if($num>0){ 
    
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
        
        $detalle_pago_factura_item=array(
            "id_dpf"=>$id_dpf, 
            "factura_id"=>$factura_id, 
            "metodo_pago_id"=>$metodo_pago_id, 
            "banco_emisor"=>$banco_emisor, 
            "nombre_emisor"=>$nombre_emisor, 
            "banco_receptor"=>$banco_receptor, 
            "dp_descripcion_per_ban"=>$dp_descripcion_per_ban, 
            "codigo"=>$codigo,
            "fecha"=>$fecha,
            "tipo_tarjeta"=>$tipo_tarjeta,
            "franquicia"=>$franquicia,
            "recibo"=>$recibo,
            "titular"=>$titular,
            "cheque"=>$cheque
        );
 
        array_push($detalle_pago_factura_arr["data"], $detalle_pago_factura_item);
    }
 
    
}
 
echo json_encode($detalle_pago_factura_arr);

?>