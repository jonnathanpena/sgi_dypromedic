<?php
class Banco {

    // conexión a la base de datos y nombre de la tabla
    private $conn;

    // Propiedades del objeto
    //Nombre igualitos a las columnas de la base de datos
    public $df_id_banco;
    public $df_fecha_banco;
    public $df_usuario_id_banco;
    public $df_tipo_movimiento;
    public $df_monto_banco;
    public $df_saldo_banco;
    public $df_num_documento_banco;
    public $df_detalle_mov_banco;
    public $df_modificadoBy_banco;
    public $dp_perfil_banco_id;
    
    //constructor con base de datos como conexión
    public function __construct($db){
        $this->conn = $db;
    }

    // obtener facturaRecepcion de login
    function read(){
    
        // select all query
        $query = "SELECT `df_id_banco`, `df_fecha_banco`, `df_usuario_id_banco`, `df_tipo_movimiento`, 
                    `df_monto_banco`, `df_saldo_banco`, `df_num_documento_banco`, `df_detalle_mov_banco`, 
                    `df_modificadoBy_banco`, `dp_perfil_banco_id`,  `dp_descripcion_per_ban`, 
                    `dp_banco_per_ban`, `dp_cuenta_per_ban`, `dp_tipo_cuenta_per_ban`, `dp_tipo_per_ban`
                FROM `df_banco` as ban
                INNER JOIN `dp_perfil_banco` as perban ON (ban.`dp_perfil_banco_id` = perban.dp_id_perfil_ban)
                WHERE ban.`dp_perfil_banco_id` = ".$this->dp_perfil_banco_id."
                order by df_id_banco desc";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }


    // obtener facturaRecepcion por ID de df_guia_remision_detrem
    function readById(){
    
        // select all query
        $query = "SELECT `df_id_banco`, `df_fecha_banco`, `df_usuario_id_banco`, `df_tipo_movimiento`, `df_monto_banco`,
                    `df_saldo_banco`, `df_num_documento_banco`, `df_detalle_mov_banco`, `df_modificadoBy_banco`, `dp_perfil_banco_id`
                    FROM `df_banco`
                    WHERE df_id_banco = ".$this->df_id_banco;
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    function readAutocomplete(){
    
        // select all query
        $query = "SELECT DISTINCT  `df_detalle_mov_banco`
                    FROM `df_banco`
                    WHERE df_detalle_mov_banco LIKE '%".$this->df_detalle_mov_banco."%'
                    and `df_tipo_movimiento` = 'Egreso'";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    function readAutocompleteIng(){
    
        // select all query
        $query = "SELECT DISTINCT  `df_detalle_mov_banco`
                    FROM `df_banco`
                    WHERE df_detalle_mov_banco LIKE '%".$this->df_detalle_mov_banco."%'
                    and `df_tipo_movimiento` = 'Ingreso'";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // insertar un facturaRecepcion
    function insert(){
    
        // query to insert record
        $query = "INSERT INTO `df_banco`(`df_fecha_banco`, `df_usuario_id_banco`, `df_tipo_movimiento`, `df_monto_banco`,
                    `df_saldo_banco`, `df_num_documento_banco`, `df_detalle_mov_banco`, `df_modificadoBy_banco`, `dp_perfil_banco_id`) 
                    VALUES (
                            '".$this->df_fecha_banco."',
                            ".$this->df_usuario_id_banco.",
                            '".$this->df_tipo_movimiento."',
                            ".$this->df_monto_banco.",
                            ".$this->df_saldo_banco.",
                            '".$this->df_num_documento_banco."',
                            '".$this->df_detalle_mov_banco."',
                            0,
                            ".$this->dp_perfil_banco_id.")";

        // prepara la sentencia del query
        $stmt = $this->conn->prepare($query);   

        if($stmt->execute()){
            return $this->conn->lastInsertId();
        }else{
            return false;
        } 
        
        
    }

    // actualizar datos de facturaRecepcion
    function update(){
    
        // query 
        $query = "UPDATE `df_banco` SET 
                `df_fecha_banco`= '".$this->df_fecha_banco."',
                `df_usuario_id_banco`= ".$this->df_usuario_id_banco.",
                `df_tipo_movimiento`= '".$this->df_tipo_movimiento."',
                `df_monto_banco` = ".$this->df_monto_banco.",
                `df_saldo_banco`= ".$this->df_saldo_banco.",
                `df_num_documento_banco`= '".$this->df_num_documento_banco."',
                `df_detalle_mov_banco`= '".$this->df_detalle_mov_banco."',
                `df_modificadoBy_banco`= ".$this->df_modificadoBy_banco."
                `dp_perfil_banco_id` = ".$this->dp_perfil_banco_id."
                WHERE `df_id_banco` = ".$this->df_id_banco;

        // prepara la sentencia del query
        $stmt = $this->conn->prepare($query);
        
        // execute query
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }       
        
    }
       

}
?>