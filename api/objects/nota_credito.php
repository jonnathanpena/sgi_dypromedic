<?php

class NotaCredito {

    // conexión a la base de datos y nombre de la tabla

    private $conn;

    // Propiedades del objeto

    //Nombre igualitos a las columnas de la base de datos

    public $dp_num_notacred;
    public $dp_fecha_nc;
    public $dp_factura_nc;
    public $dp_fecha_fac_nc;
    public $dp_cliente_id_nc;
    public $dp_cliente_tipo_doc_nc;
    public $dp_cliente_documento_nc;
    public $dp_cliente_nombre_nc;
    public $dp_cliente_correo_nc;
    public $dp_motivo_nc;
    public $dp_tipo_doc_venta_nc;
    public $dp_subtotal_nc;
    public $dp_iva_nc;
    public $dp_total_nc;
    public $dp_fecha_creacion;
    public $dp_creadoby;

    //constructor con base de datos como conexión

    public function __construct($db){
        $this->conn = $db;
    }

    // obtener todas las notas de credito

    function read(){
        // select all query
        $query = "SELECT `dp_num_notacred`, `dp_fecha_nc`, `dp_factura_nc`, `dp_fecha_fac_nc`, `dp_cliente_id_nc`, 
                    `dp_cliente_tipo_doc_nc`, `dp_cliente_documento_nc`, `dp_cliente_nombre_nc`, `dp_cliente_correo_nc`,
                    `dp_motivo_nc`, `dp_tipo_doc_venta_nc`, `dp_subtotal_nc`, `dp_iva_nc`, `dp_total_nc`, 
                    `dp_creadoby`, `dp_fecha_creacion` 
                    FROM `dp_nota_credito` 
                    WHERE `dp_num_notacred` like '%".$this->dp_num_notacred."%'
                    ORDER BY dp_num_notacred DESC";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }

    // obtener notas de credito por id
    function readById(){    

        // select all query

        $query = "SELECT `dp_num_notacred`, `dp_fecha_nc`, `dp_factura_nc`, `dp_fecha_fac_nc`, `dp_cliente_id_nc`, 
                    `dp_cliente_tipo_doc_nc`, `dp_cliente_documento_nc`, `dp_cliente_nombre_nc`, `dp_cliente_correo_nc`,
                    `dp_motivo_nc`, `dp_tipo_doc_venta_nc`, `dp_subtotal_nc`, `dp_iva_nc`, `dp_total_nc`, 
                    `dp_creadoby`, `dp_fecha_creacion` 
                    FROM `dp_nota_credito` 
                    WHERE `dp_num_notacred` = ".$this->dp_num_notacred;

        // prepare query statement

        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();

        return $stmt;
    }

    // insertar una nota de credito
    function insert(){
        // query to insert record
        $query = "INSERT INTO `dp_nota_credito` (`dp_fecha_nc`, `dp_factura_nc`, `dp_fecha_fac_nc`, `dp_cliente_id_nc`, 
                `dp_cliente_tipo_doc_nc`, `dp_cliente_documento_nc`, `dp_cliente_nombre_nc`, `dp_cliente_correo_nc`,
                `dp_motivo_nc`, `dp_tipo_doc_venta_nc`, `dp_subtotal_nc`, `dp_iva_nc`, `dp_total_nc`, 
                `dp_creadoby`, `dp_fecha_creacion`) 
                VALUES (
                        '".$this->dp_fecha_nc."',
                        ".$this->dp_factura_nc.",
                        '".$this->dp_fecha_fac_nc."',
                        ".$this->dp_cliente_id_nc.",
                        '".$this->dp_cliente_tipo_doc_nc."',
                        '".$this->dp_cliente_documento_nc."',
                        '".$this->dp_cliente_nombre_nc."',
                        '".$this->dp_cliente_correo_nc."',
                        '".$this->dp_motivo_nc."',
                        ".$this->dp_tipo_doc_venta_nc.",
                        ".$this->dp_subtotal_nc.",
                        ".$this->dp_iva_nc.",
                        ".$this->df_iva_fac.",
                        ".$this->dp_total_nc.",
                        ".$this->dp_creadoby.",
                        '".$this->dp_fecha_creacion."')";

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