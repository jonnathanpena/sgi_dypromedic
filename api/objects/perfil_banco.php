<?php
class PerfilBanco {

    // conexión a la base de datos y nombre de la tabla
    private $conn;

    // Propiedades del objeto
    //Nombre igualitos a las columnas de la base de datos
    public $dp_id_perfil_ban;
    public $dp_descripcion_per_ban;
    public $dp_banco_per_ban;
    public $dp_cuenta_per_ban;
    public $dp_tipo_cuenta_per_ban;
    public $dp_tipo_per_ban;
    public $dp_fecha_creacion_per_ban;
    public $dp_creadoby_per_ban;
    public $dp_fecha_modifica_per_ban;
    public $dp_modificadoby_per_ban;

    //constructor con base de datos como conexión
    public function __construct($db){
        $this->conn = $db;
    }

    // obtener todos los perfiles de banco
    function readAll(){
    
        // select all query
        $query = "SELECT `dp_id_perfil_ban`, `dp_descripcion_per_ban`, `dp_banco_per_ban`, `dp_cuenta_per_ban`, 
                    `dp_tipo_cuenta_per_ban`, `dp_tipo_per_ban`,  `dp_fecha_creacion_per_ban`,
                    `dp_creadoby_per_ban`, `dp_fecha_modifica_per_ban`, `dp_modificadoby_per_ban` 
                FROM `dp_perfil_banco` 
                WHERE `dp_descripcion_per_ban` LIKE '%".$this->dp_descripcion_per_ban."%' 
                        or `dp_banco_per_ban` LIKE '%".$this->dp_banco_per_ban."%'
                ORDER BY `dp_descripcion_per_ban` ASC";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // obtener perfil por nombre
    function readByAlias(){
    
        // select all query
        $query = "SELECT `dp_id_perfil_ban`, `dp_descripcion_per_ban`, `dp_banco_per_ban`, `dp_cuenta_per_ban`, 
                        `dp_tipo_cuenta_per_ban`, `dp_tipo_per_ban`,`dp_fecha_creacion_per_ban`,
                        `dp_creadoby_per_ban`, `dp_fecha_modifica_per_ban`, `dp_modificadoby_per_ban` 
                    FROM `dp_perfil_banco` 
                    WHERE `dp_descripcion_per_ban` = '".$this->dp_descripcion_per_ban."'";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    function readById(){
    
        // select all query
        $query = "SELECT `dp_id_perfil_ban`, `dp_descripcion_per_ban`, `dp_banco_per_ban`, `dp_cuenta_per_ban`, 
                    `dp_tipo_cuenta_per_ban`, `dp_tipo_per_ban`,  `dp_fecha_creacion_per_ban`,
                    `dp_creadoby_per_ban`, `dp_fecha_modifica_per_ban`, `dp_modificadoby_per_ban` 
                FROM `dp_perfil_banco` 
                WHERE `dp_id_perfil_ban` = ".$this->dp_id_perfil_ban;
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // insertar un perfil banco
    function insert(){
    
        // query to insert record
        $query = "INSERT INTO `dp_perfil_banco`(`dp_descripcion_per_ban`, `dp_banco_per_ban`, `dp_cuenta_per_ban`, 
                    `dp_tipo_cuenta_per_ban`, `dp_tipo_per_ban`, `dp_fecha_creacion_per_ban`, 
                    `dp_creadoby_per_ban`, `dp_fecha_modifica_per_ban`, `dp_modificadoby_per_ban`) VALUES (
                        '".$this->dp_descripcion_per_ban."',
                        '".$this->dp_banco_per_ban."',
                        '".$this->dp_cuenta_per_ban."',
                        '".$this->dp_tipo_cuenta_per_ban."',
                        '".$this->dp_tipo_per_ban."',
                        '".$this->dp_fecha_creacion_per_ban."',
                        ".$this->dp_creadoby_per_ban.",
                        null,
                        null)";

        // prepara la sentencia del query
        $stmt = $this->conn->prepare($query);    
        
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }   
        
        
    }

    // actualizar datos de perfil banco
    function update(){
    
        // query 
        $query = "UPDATE `dp_perfil_banco` SET                     
                    `dp_descripcion_per_ban`= '".$this->dp_descripcion_per_ban."',
                    `dp_banco_per_ban`= '".$this->dp_banco_per_ban."',
                    `dp_cuenta_per_ban`= '".$this->dp_cuenta_per_ban."',
                    `dp_tipo_cuenta_per_ban`= '".$this->dp_tipo_cuenta_per_ban."',
                    `dp_tipo_per_ban`= '".$this->dp_tipo_per_ban."',
                    `dp_fecha_modifica_per_ban`= '".$this->dp_fecha_modifica_per_ban."',
                    `dp_modificadoby_per_ban` = ".$this->dp_modificadoby_per_ban."
                WHERE `dp_id_perfil_ban`= ".$this->dp_id_perfil_ban;
    
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