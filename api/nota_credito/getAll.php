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

$nota_credito->dp_num_notacred= $info[0]["dp_num_notacred"];
 
// query de lectura
$stmt = $nota_credito->read();
$num = $stmt->rowCount();

//nota_credito array
$nota_credito_arr=array();
$nota_credito_arr["data"]=array();
 
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
        $nota_credito_item=array(
            "dp_num_notacred"=>$dp_num_notacred, 
            "dp_fecha_nc"=>$dp_fecha_nc,
            "dp_factura_nc"=>$dp_factura_nc,
            "dp_fecha_fac_nc"=>$dp_fecha_fac_nc,
            "dp_cliente_id_nc"=>$dp_cliente_id_nc,
            "dp_cliente_tipo_doc_nc"=>$dp_cliente_tipo_doc_nc,
            "dp_cliente_documento_nc"=>$dp_cliente_documento_nc,
            "dp_cliente_nombre_nc"=>$dp_cliente_nombre_nc,
            "dp_cliente_correo_nc"=>$dp_cliente_correo_nc,
            "dp_motivo_nc"=>$dp_motivo_nc,
            "dp_tipo_doc_venta_nc"=>$dp_tipo_doc_venta_nc,
            "dp_subtotal_nc"=>$dp_subtotal_nc,
            "dp_iva_nc"=>$dp_iva_nc,
            "dp_total_nc"=>$dp_total_nc,
            "dp_creadoby"=>$dp_creadoby,
            "dp_fecha_creacion"=>$dp_fecha_creacion
        );
 
        array_push($nota_credito_arr["data"], $nota_credito_item);
    }
 
    echo json_encode($nota_credito_arr);
}
 
else{
    echo json_encode($nota_credito_arr);
}
?>