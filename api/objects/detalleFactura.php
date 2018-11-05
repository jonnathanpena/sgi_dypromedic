<?php
class DetalleFactura {

    // conexión a la base de datos y nombre de la tabla
    private $conn;

    // Propiedades del objeto
    //Nombre igualitos a las columnas de la base de datos
    public $df_id_factura_detfac;
    public $df_num_factura_detfac;
    public $df_prod_codigo_detfac;
    public $df_prod_iess_detfac;
    public $df_prod_nombre_detfac;
    public $df_prod_precio_detfac;
    public $df_precio_prod_detfac;
    public $df_cantidad_detfac;
    public $df_nombre_und_detfac;
    public $df_cant_x_und_detfac;
    public $df_valor_sin_iva_detfac;
    public $df_iva_detfac;
    public $df_valor_total_detfac;

    //constructor con base de datos como conexión
    public function __construct($db){
        $this->conn = $db;
    }

    // obtener factura de login
    function readById(){    

        $query = "SELECT `df_id_factura_detfac`, `df_num_factura_detfac`, `df_prod_codigo_detfac`, 
                    `df_prod_iess_detfac`, `df_prod_nombre_detfac`, `df_prod_precio_detfac`, `df_precio_prod_detfac`,
                    `df_cantidad_detfac`, `df_nombre_und_detfac`, `df_cant_x_und_detfac`,
                    `df_valor_sin_iva_detfac`, `df_iva_detfac`, `df_valor_total_detfac` 
                    FROM `df_detalle_factura` 
                    WHERE det.df_num_factura_detfac = ".$this->df_num_factura_detfac;
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // insertar un factura
    function insert(){
    
        // query to insert record
        $query = "INSERT INTO `df_detalle_factura`(`df_num_factura_detfac`, `df_prod_codigo_detfac`, 
                `df_prod_iess_detfac`, `df_prod_nombre_detfac`, `df_prod_precio_detfac`, `df_precio_prod_detfac`,
                `df_cantidad_detfac`, `df_nombre_und_detfac`, `df_cant_x_und_detfac`,
                `df_valor_sin_iva_detfac`, `df_iva_detfac`, `df_valor_total_detfac`) 
                    VALUES (
                        ".$this->df_num_factura_detfac.",
                        '".$this->df_prod_codigo_detfac."',
                        '".$this->df_prod_iess_detfac."',
                        '".$this->df_prod_nombre_detfac."',
                        '".$this->df_prod_precio_detfac."',
                        ".$this->df_precio_prod_detfac.",
                        ".$this->df_cantidad_detfac.",
                        '".$this->df_nombre_und_detfac."',
                        ".$this->df_cant_x_und_detfac.",
                        ".$this->df_valor_sin_iva_detfac.",
                        ".$this->df_iva_detfac.",
                        ".$this->df_valor_total_detfac.")";
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