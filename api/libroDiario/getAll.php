<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// incluye la configuración de la base de datos y la conexión
include_once '../config/database.php';
include_once '../objects/libroDiario.php';
 
// inicia la conexión a la base de datos
$database = new Database();
$db = $database->getConnection();
 
// inicia el objeto
$libroDiario = new LibroDiario($db);
 
// query de lectura
$stmt = $libroDiario->read();
$num = $stmt->rowCount();

//libroDiario array
$libroDiario_arr=array();
$libroDiario_arr["data"]=array();
 
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
        $libroDiario_item=array(
            "df_id_libro_diario"=>$df_id_libro_diario, 
            "df_fuente_ld"=>$df_fuente_ld, 
            "df_valor_inicial_ld"=>$df_valor_inicial_ld,
            "df_fecha_ld"=>$df_fecha_ld,
            "df_descipcion_ld"=>$df_descipcion_ld,
            "df_ingreso_ld"=>$df_ingreso_ld,
            "df_egreso_ld"=>$df_egreso_ld,
            "df_usuario_id_ld"=>$df_usuario_id_ld
        );
 
        array_push($libroDiario_arr["data"], $libroDiario_item);
    }
 
    echo json_encode($libroDiario_arr);
}
 
else{
    echo json_encode($libroDiario_arr);
}
?>