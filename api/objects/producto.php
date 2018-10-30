<?php
class Producto {

    // conexión a la base de datos y nombre de la tabla
    private $conn;

    // Propiedades del objeto
    //Nombre igualitos a las columnas de la base de datos
    public $df_id_producto;
    public $df_nombre_producto;
    public $df_codigo_prod;
    public $df_prod_precio_detfac;
    public $dp_codigo_iess_pro;
    public $dp_tipo_pro;
    public $dp_categoria_pro;
    public $dp_materia_prima_pro;
    public $dp_producto_final_pro;
    public $dp_servicio_pro;
    public $dp_impuesto_compra_pro;

    public $codigo;
    public $df_id_precio;
    public $df_producto_id;
    public $df_ppp;
    public $df_pvt1;
    public $df_pvt2;
    public $df_pvp;
    public $df_iva;
    public $df_min_sugerido;
    public $df_und_caja;
    public $df_utilida;
    public $df_valor_impuesto;
    public $df_cant_bodega;

    //constructor con base de datos como conexión
    public function __construct($db){
        $this->conn = $db;
    }

    // obtener maximo id producto
    function read(){
    
        // select all query
        $query = "SELECT `df_id_producto`, `df_nombre_producto`, `df_codigo_prod`, `dp_codigo_iess_pro`, `dp_tipo_pro`, `dp_categoria_pro`, 
                    `dp_materia_prima_pro`, `dp_producto_final_pro`, `dp_servicio_pro`, `dp_impuesto_compra_pro` 
                    FROM `df_producto` 
                    WHERE `df_codigo_prod` like '%".$this->df_nombre_producto."%' OR `df_nombre_producto` like '%".$this->df_nombre_producto."%'
                    ORDER BY df_nombre_producto ASC";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    function readCategoria(){
    
        // select all query
        $query = "SELECT DISTINCT dp_categoria_pro
                    FROM `df_producto` 
                    ORDER BY dp_categoria_pro ASC";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    function readAll(){
    
        // select all query
        $query = "SELECT prod.`df_id_producto`, prod.`df_nombre_producto`, prod.`df_codigo_prod`,
        prod.`dp_codigo_iess_pro`, prod.`dp_tipo_pro`, prod.`dp_categoria_pro`, 
        prod.`dp_materia_prima_pro`, prod.`dp_producto_final_pro`, prod.`dp_servicio_pro`, prod.`dp_impuesto_compra_pro`, 
        pp.`df_id_precio`, pp.`df_producto_id`, pp.`df_ppp`, pp.`df_pvt1`, 
        pp.`df_pvt2`, pp.`df_pvp`, pp.`df_iva`, pp.`df_min_sugerido`, pp.`df_unidad_prop`, pp.`df_und_caja`, 
        pp.`df_utilidad`, iva.`df_valor_impuesto`
        FROM `df_producto` as prod
        JOIN `df_producto_precio` as pp ON (prod.`df_id_producto` = pp.`df_producto_id`)
        JOIN `df_impuesto` as iva ON (pp.`df_iva` = iva.`df_id_impuesto`)
        WHERE prod.`df_codigo_prod` like '%".$this->df_codigo_prod."%' OR prod.`df_nombre_producto` like '%".$this->df_nombre_producto."%'
        ORDER BY prod.df_nombre_producto ASC";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // obtener producto de login
    function readById(){
    
        // select all query
        $query = "SELECT `df_id_producto`, `df_nombre_producto`, `df_codigo_prod`, `dp_codigo_iess_pro`, 
                    `dp_tipo_pro`, `dp_categoria_pro`, `dp_materia_prima_pro`, `dp_producto_final_pro`, 
                    `dp_servicio_pro`, `dp_impuesto_compra_pro`
                    FROM `df_producto` 
                    WHERE df_id_producto = ".$this->df_id_producto;
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // obtener producto de login
    function readByCodigoFactura(){
    
        // select all query
        $query = "SELECT prod.`df_id_producto`, prod.`df_nombre_producto`, prod.`df_codigo_prod`,
                    prod.`dp_codigo_iess_pro`, prod.`dp_tipo_pro`, prod.`dp_categoria_pro`, 
                    prod.`dp_materia_prima_pro`, prod.`dp_producto_final_pro`, prod.`dp_servicio_pro`, prod.`dp_impuesto_compra_pro`, 
                    pp.`df_id_precio`, pp.`df_producto_id`, pp.`df_ppp`, pp.`df_pvt1`, 
                    pp.`df_pvt2`, pp.`df_pvp`, pp.`df_iva`, pp.`df_min_sugerido`, pp.`df_und_caja`, 
                    pp.`df_utilidad`, iva.`df_valor_impuesto`, inv.`df_cant_bodega`
                    FROM `df_producto` as prod
                    JOIN `df_producto_precio` as pp ON (prod.`df_id_producto` = pp.`df_producto_id`)
                    JOIN `df_impuesto` as iva ON (pp.`df_iva` = iva.`df_id_impuesto`)
                    LEFT JOIN `df_inventario` as inv ON (prod.`df_id_producto` = inv.`df_producto`)
                    WHERE prod.`df_codigo_prod` = '".$this->codigo."'";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // obtener producto de login
    function readByName(){
    
        // select all query
        $query = "SELECT `df_id_producto`, `df_nombre_producto`, `df_codigo_prod`, `dp_codigo_iess_pro`, 
                    `dp_tipo_pro`, `dp_categoria_pro`, `dp_materia_prima_pro`, `dp_producto_final_pro`, 
                    `dp_servicio_pro`, `dp_impuesto_compra_pro`
                    FROM `df_producto` 
                    WHERE df_nombre_producto like '%".$this->df_nombre_producto."%'";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // obtener producto 
    function readByFactura(){
    
        // select all query
        $query = "SELECT COUNT(`df_num_factura_detfac`) AS factura FROM `df_detalle_factura` 
                    WHERE df_prod_precio_detfac = ".$this->df_prod_precio_detfac;
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // obtener producto 
    function readIdMax(){
    
        // select all query
        $query = "SELECT MAX(`df_id_producto`) as df_id_producto FROM `df_producto`";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

    // insertar un producto
    function insert(){
    
        // query to insert record
        $query = "INSERT INTO `df_producto`(`df_nombre_producto`, `df_codigo_prod`, `dp_codigo_iess_pro`, 
                    `dp_tipo_pro`, `dp_categoria_pro`, `dp_materia_prima_pro`, `dp_producto_final_pro`, 
                    `dp_servicio_pro`, `dp_impuesto_compra_pro`) VALUES (
                        '".$this->df_nombre_producto."',
                        '".$this->df_codigo_prod."',
                        '".$this->dp_codigo_iess_pro."',
                        '".$this->dp_tipo_pro."',
                        '".$this->dp_categoria_pro."',
                        '".$this->dp_materia_prima_pro."',
                        '".$this->dp_producto_final_pro."',
                        ".$this->dp_servicio_pro.",
                        ".$this->dp_impuesto_compra_pro.")";
        // prepara la sentencia del query
        $stmt = $this->conn->prepare($query);    
        
        if($stmt->execute()){
            return $this->conn->lastInsertId();
        }else{
            return false;
        }   
        
        
    }

    // actualizar datos de producto
    function update(){
    
        // query 
        $query = "UPDATE `df_producto` SET                     
                    `df_nombre_producto`= '".$this->df_nombre_producto."',
                    `df_codigo_prod`= '".$this->df_codigo_prod."', 
                    `dp_codigo_iess_pro`= '".$this->dp_codigo_iess_pro."', 
                    `dp_tipo_pro`= '".$this->dp_tipo_pro."', 
                    `dp_categoria_pro`= '".$this->dp_categoria_pro."', 
                    `dp_materia_prima_pro`= '".$this->dp_materia_prima_pro."', 
                    `dp_producto_final_pro` = '".$this->dp_producto_final_pro."', 
                    `dp_servicio_pro`= ".$this->dp_servicio_pro.", 
                    `dp_impuesto_compra_pro` = ".$this->dp_impuesto_compra_pro."
                    WHERE `df_id_producto`= ".$this->df_id_producto;                          

        // prepara la sentencia del query
        $stmt = $this->conn->prepare($query);
        
        // execute query
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }       
        
    }


    // actualizar datos de delete
    function delete(){
    
        // query 
        $query = "DELETE FROM `df_producto` WHERE `df_id_producto`= ".$this->df_id_producto;                        

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