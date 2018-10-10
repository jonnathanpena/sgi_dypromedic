<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// incluye la configuración de la base de datos y la conexión
include_once '../config/database.php';
include_once '../objects/producto.php';
 
// inicia la conexión a la base de datos
$database = new Database();
$db = $database->getConnection();
 
// inicia el objeto
$producto = new Producto($db);
 
// query de lectura
$stmt = $producto->readIdMax();
$num = $stmt->rowCount();

//producto array
$producto_arr=array();
$producto_arr["data"]=array();
 
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
        $producto_item=array(
            "df_id_producto"=>$df_id_producto
        );
 
        array_push($producto_arr["data"], $producto_item);
    }
 
    echo json_encode($producto_arr);
}
 
else{
    echo json_encode($producto_arr);
}
?>