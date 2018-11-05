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

$nota_credito->dp_nota_credito= $info[0]["dp_nota_credito"];
 
// query de lectura
$stmt = $nota_credito->readById();
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
            "dp_id_dnc"=>$dp_id_dnc, 
            "dp_nota_credito"=>$dp_nota_credito,
            "dp_id_prod_dnc"=>$dp_id_prod_dnc,
            "dp_codigo_prod_dnc"=>$dp_codigo_prod_dnc,
            "dp_iess_prod_dnc"=>$dp_iess_prod_dnc,
            "dp_nombre_prod_dnc"=>$dp_nombre_prod_dnc,
            "dp_cant_prod_dnc"=>$dp_cant_prod_dnc,
            "dp_iva_dnc"=>$dp_iva_dnc,
            "dp_precio_prod_dnc"=>$dp_precio_prod_dnc,
            "dp_descuento_prod_dnc"=>$dp_descuento_prod_dnc,
            "dp_subtotal_prod_dnc"=>$dp_subtotal_prod_dnc,
            "dp_total_prod_dnc"=>$dp_total_prod_dnc
        );
 
        array_push($nota_credito_arr["data"], $nota_credito_item);
    }
 
    echo json_encode($nota_credito_arr);
}
 
else{
    echo json_encode($nota_credito_arr);
}
?>