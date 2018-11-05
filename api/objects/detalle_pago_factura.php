<?php
class DetallePagoFactura {

    // conexión a la base de datos y nombre de la tabla
    private $conn;

    // Propiedades del objeto
    //Nombre igualitos a las columnas de la base de datos
    public $id_dpf;
    public $factura_id;
    public $metodo_pago_id;
    public $banco_emisor;
    public $banco_receptor;
    public $codigo;
    public $fecha;
    public $tipo_tarjeta;
    public $franquicia;
    public $recibo;
    public $titular;
    public $cheque;

    //constructor con base de datos como conexión
    public function __construct($db){
        $this->conn = $db;
    }

    // obtener todos los detalles compra gasto por id de la compra
    function readByFactura(){
    
        // select one query
        $query = "SELECT dpf.`id_dpf`, dpf.`factura_id`, dpf.`metodo_pago_id`, dpf.`banco_emisor`, 
                    ban.`nombre_bancos` as nombre_emisor, dpf.`banco_receptor`, 
                    perb.dp_descripcion_per_ban as nombre_receptor, dpf.`codigo`, dpf.`fecha`, dpf.`tipo_tarjeta`,
                    dpf.`franquicia`, dpf.`recibo`, dpf.`titular`, dpf.`cheque` 
                    FROM `detalle_pagos_factura` as dpf
                    LEFT JOIN  `bancos` as ban ON (ban.id_bancos = dpf.`id_dpf`)
                    LEFT JOIN `dp_perfil_banco` as perb ON (perb.dp_id_perfil_ban = dpf.`id_dpf`)
                    WHERE dpf.`factura_id` = ".$this->factura_id;

        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // insertar un detalle compra gasto
    function insert(){

        if ($this->metodo_pago_id === 3) {
            // query to insert record
            $query = "INSERT INTO `detalle_pagos_factura`(`factura_id`, `metodo_pago_id`, `banco_emisor`, `banco_receptor`, `codigo`, `fecha`, `tipo_tarjeta`, 
                        `franquicia`, `recibo`, `titular`, `cheque`) 
                        VALUES (
                            ".$this->factura_id.",
                            ".$this->metodo_pago_id.",
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null
                        )";
        }  else if ($this->metodo_pago_id === 2) {
            $query = "INSERT INTO `detalle_pagos_factura`(`factura_id`, `metodo_pago_id`, `banco_emisor`, `banco_receptor`, `codigo`, `fecha`, `tipo_tarjeta`, 
                        `franquicia`, `recibo`, `titular`, `cheque`) 
                        VALUES (
                            ".$this->factura_id.",
                            ".$this->metodo_pago_id.",
                            ".$this->banco_emisor.",
                            ".$this->banco_receptor.",
                            '".$this->codigo."',
                            '".$this->fecha."',
                            null,
                            null,
                            null,
                            null,
                            null
                        )";
        } else if ($this->metodo_pago_id === 5) {
            $query = "INSERT INTO `detalle_pagos_factura`(`factura_id`, `metodo_pago_id`, `banco_emisor`, `banco_receptor`, `codigo`, `fecha`, `tipo_tarjeta`, 
                        `franquicia`, `recibo`, `titular`, `cheque`) 
                        VALUES (
                            ".$this->factura_id.",
                            ".$this->metodo_pago_id.",
                            ".$this->banco_emisor.",
                            null,
                            null,
                           '".$this->fecha."',
                            ".$this->tipo_tarjeta.",
                            ".$this->franquicia.",
                            '".$this->recibo."',
                            '".$this->titular."',
                            null
                        )";
        } else if ($this->metodo_pago_id === 1) {
            $query = "INSERT INTO `detalle_pagos_factura`(`factura_id`, `metodo_pago_id`, `banco_emisor`, `banco_receptor`, `codigo`, `fecha`, `tipo_tarjeta`, 
                        `franquicia`, `recibo`, `titular`, `cheque`) 
                        VALUES (
                            ".$this->factura_id.",
                            ".$this->metodo_pago_id.",
                            ".$this->banco_emisor.",
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            '".$this->titular."',
                            '".$this->cheque."'
                        )";
        } else if ($this->metodo_pago_id === 6) {
            $query = "INSERT INTO `detalle_pagos_factura`(`factura_id`, `metodo_pago_id`, `banco_emisor`, `banco_receptor`, `codigo`, `fecha`, `tipo_tarjeta`, 
                        `franquicia`, `recibo`, `titular`, `cheque`) 
                        VALUES (
                            ".$this->factura_id.",
                            ".$this->metodo_pago_id.",
                            null,
                            null,
                            '".$this->codigo."',
                            null,
                            null,
                            null,
                            null,
                            '".$this->titular."',
                            null
                        )";
        } else if ($this->metodo_pago_id === 4) {
            $query = "INSERT INTO `detalle_pagos_factura`(`factura_id`, `metodo_pago_id`, `banco_emisor`, `banco_receptor`, `codigo`, `fecha`, `tipo_tarjeta`, 
                        `franquicia`, `recibo`, `titular`, `cheque`) 
                        VALUES (
                            ".$this->factura_id.",
                            ".$this->metodo_pago_id.",
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null
                        )";
        }
        
        // prepara la sentencia del query
        $stmt = $this->conn->prepare($query);    
        
        if($stmt->execute()){
            return true;
        }else{
            return false;
        } 
        
    }

}
?>