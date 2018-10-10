<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// incluye la configuración de la base de datos y la conexión
include_once '../config/database.php';
include_once '../objects/kardex.php';
 
// inicia la conexión a la base de datos
$database = new Database();
$db = $database->getConnection();
 
// inicia el objeto
$kardex = new Kardex($db);
 
// query de lectura
$stmt = $kardex->readIdMax();
$num = $stmt->rowCount();

//kardex array
$kardex_arr=array();
$kardex_arr["data"]=array();
 
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
        $kardex_item=array(
            "df_kardex_id"=>$df_kardex_id * 1
        );
 
        array_push($kardex_arr["data"], $kardex_item);
    }
 
    echo json_encode($kardex_arr);
}
 
else{
    echo json_encode($kardex_arr);
}
?>