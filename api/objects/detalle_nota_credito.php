<?php

class DetalleNotaCredito {

    // conexión a la base de datos y nombre de la tabla

    private $conn;

    // Propiedades del objeto

    //Nombre igualitos a las columnas de la base de datos

    public $dp_id_dnc;
    public $dp_nota_credito;
    public $dp_id_prod_dnc;
    public $dp_codigo_prod_dnc;
    public $dp_iess_prod_dnc;
    public $dp_nombre_prod_dnc;
    public $dp_cant_prod_dnc;
    public $dp_iva_dnc;
    public $dp_precio_prod_dnc;
    public $dp_descuento_prod_dnc;
    public $dp_subtotal_prod_dnc;
    public $dp_total_prod_dnc;

    //constructor con base de datos como conexión

    public function __construct($db){
        $this->conn = $db;
    }   

    // obtener detalle nota de credito
    function readById(){    

        // select all query

        $query = "SELECT `dp_id_dnc`, `dp_nota_credito`, `dp_id_prod_dnc`, `dp_codigo_prod_dnc`, `dp_iess_prod_dnc`, 
                `dp_nombre_prod_dnc`, `dp_cant_prod_dnc`, `dp_iva_dnc`, `dp_precio_prod_dnc`, `dp_descuento_prod_dnc`,
                `dp_subtotal_prod_dnc`, `dp_total_prod_dnc` 
                    FROM `dp_detalle_nota_credito`  
                    WHERE `dp_nota_credito` = ".$this->dp_nota_credito;

        // prepare query statement

        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();

        return $stmt;
    }

    // insertar un factura
    function insert(){
        // query to insert record
        $query = "INSERT INTO `dp_detalle_nota_credito` (`dp_nota_credito`, `dp_id_prod_dnc`, `dp_codigo_prod_dnc`, 
        `dp_iess_prod_dnc`, `dp_nombre_prod_dnc`, `dp_cant_prod_dnc`, `dp_iva_dnc`, `dp_precio_prod_dnc`, 
        `dp_descuento_prod_dnc`, `dp_subtotal_prod_dnc`, `dp_total_prod_dnc`) 
                VALUES (
                        ".$this->dp_nota_credito.",
                        ".$this->dp_id_prod_dnc.",
                        '".$this->dp_codigo_prod_dnc."',
                        '".$this->dp_iess_prod_dnc."',
                        '".$this->dp_nombre_prod_dnc."',
                        ".$this->dp_cant_prod_dnc.",
                        ".$this->dp_iva_dnc.",
                        ".$this->dp_precio_prod_dnc.",
                        ".$this->dp_descuento_prod_dnc.",
                        ".$this->dp_subtotal_prod_dnc.",
                        ".$this->dp_total_prod_dnc.")";

        // prepara la sentencia del query

        $stmt = $this->conn->prepare($query);    
        
        if($stmt->execute()){
            return $this->conn->lastInsertId();
        }else{
            return false;
        }   
    }

}

?>