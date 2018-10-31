<?php
   $active_administracion = "";
   $active_facturas = "active";
   $active_ingresos = "";
   $active_egresos = "";
   $active_guias = "";
   $active_bodega = "";
   $active_reportes = "";
   $active_reportes_usuarios = "";
   $title="Nueva Factura | SGI";  
   $fecha = Date('d/m/Y');
   $fact = '001-001-000012234';
?>

<!DOCTYPE html>
<html lang="en">
   <head>
      <?php include("head.php");?>
      <link rel="stylesheet" href="./css/nueva_compra.css">
      <link rel="stylesheet" href="js/lib/autocomplete/autocomplete.css">
   </head>
   <body>
      <?php
         include("navbar.php");
        ?>  
      <div class="container">
         <div class="panel panel-info">
            <div class="panel-heading">
               <div class="pull-right">
                    <input style="text-align:right; font-weight: bold; font-size: 15px;" type="text" class="form-control input-sm" id="fact" name="fact" value="<?php echo $fact; ?>" readonly>
                </div>
               <h4><i class='glyphicon glyphicon-edit'></i> Nueva Factura</h4>

            </div>
            <div class="panel-body">
<?php
include("modal/consultar_clientes.php");
include("modal/consultar_productos.php");
include("modal/load.php");
include("modal/nuevo_producto.php");
include("modal/nuevo_cliente.php");
include("modal/editar_cliente.php");
?>
               <form class="form-horizontal" role="form" id="form_nueva_factura">
                  <div class="form-group row">
                     <label for="usuario" class="col-md-1 control-label" style="text-align:left">Usuario</label>
                     <div class="col-md-2">
                        <select name="usuario" id="usuario" class="form-control" readonly>
                        </select>
                     </div>
                     <label for="fecha" class="col-md-1 control-label" style="text-align:left">Fecha</label>
                     <div class="col-md-2">
                        <input type="text" class="form-control input-sm" id="fecha" name="fecha" value="<?php echo $fecha; ?>" readonly>
                     </div>
                     <label for="personal" class="col-md-2 control-label" style="text-align:left">Vendedor <span class="obligatorio">*</span></label>
                     <div class="col-md-4">
                        <select name="personal" id="personal" class="form-control"></select>
                     </div>                     
                  </div>
                  <div class="form-group row">
                    <label for="documento_cliente" class="col-md-2 control-label" style="text-align:left">Documento Cliente <span class="obligatorio">*</span></label>
                     <div class="col-md-2">
                        <input type="text" class="form-control input-sm" id="documento_cliente" name="documento_cliente" placeholder="Documento Cliente" onclick="consultarCliente()" style="cursor: pointer;" readonly>
                        <input type="hidden" id="cliente_id" >
                     </div>
                     <div class="btn-group col-md-2">
                        <button type='button' class="btn btn-primary" data-toggle="modal" data-target="#nuevoCliente" onclick="nuevoCliente()">
						    <span class="glyphicon glyphicon-plus" ></span> Nuevo Cliente
					    </button>
                     </div>
                    <label for="nombre_cliente" class="col-md-2 control-label" style="text-align:left">Nombre Cliente</label>
                     <div class="col-md-4">
                        <input type="text" class="form-control input-sm" id="nombre_cliente" name="nombre_cliente" placeholder="Nombre Cliente" readonly>
                     </div>                                                                                                                      
                  </div>  
                  <div class="form-group row">
                    <label for="direccion_cliente" class="col-md-2 control-label" style="text-align:left">Dirección Cliente <span class="obligatorio">*</span></label>
                     <div class="col-md-4">
                        <input type="text" class="form-control input-sm" id="direccion_cliente" name="direccion_cliente" placeholder="Dirección Cliente" readonly>
                        <input type="hidden" id="cliente_id" >
                        <input type="hidden" id="cliente_tipo_doc" >
                     </div> 
                     <label for="telefono_cliente" class="col-md-2 control-label" style="text-align:left">Teléfono Cliente <span class="obligatorio">*</span></label>
                     <div class="col-md-3">
                        <input type="text" class="form-control input-sm" id="telefono_cliente" name="telefono_cliente" placeholder="Teléfono Cliente" readonly>                       
                     </div>    
                     <div class="col-md-1">
                        <span class="pull-right"><a href="#" class="btn btn-warning" title="Modificar Cliente" onclick="detallar()"><i class="glyphicon glyphicon-edit"></i> </a></span>
                     </div>
                  </div>   
                  <div class="form-group row">
                  <label for="sector" class="col-md-2 control-label" style="text-align:left; display: none;">Sector</label>
                     <div class="col-md-3" style="display: none;">
                        <select name="sector" id="sector" class="form-control" disabled>
                            <option value="null">Seleccione...</option>
                        </select>
                     </div>
                     <label for="correo_cliente" class="col-md-2 control-label" style="text-align:left">Email Cliente <span class="obligatorio">*</span></label>
                     <div class="col-md-4">
                        <input type="text" class="form-control input-sm" id="correo_cliente" name="correo_cliente" placeholder="Email Cliente" readonly>                           
                     </div> 
                     <label for="fecha_cirugia" class="col-md-2 control-label" style="text-align:left; ">Fecha Cirugía <span class="obligatorio">*</span></label>
                     <div class="col-md-2">
                        <input type="date" class="form-control input-sm" id="fecha_cirugia" name="fecha_cirugia" required>
                     </div>
                  </div>
                   <div class="form-group row">
                    <label for="documento_paciente" class="col-md-2 control-label" style="text-align:left; ">Documento Paciente<span class="obligatorio">*</span></label>
                    <div class="col-md-2">
                        <input type="text" class="form-control input-sm" id="documento_paciente" name="documento_paciente" placeholder="Documento Paciente" required >
                    </div>
                    <div class="col-md-2">
                    </div>
                    <label for="paciente" class="col-md-2 control-label" style="text-align:left; ">Nombre Paciente <span class="obligatorio">*</span></label>
                    <div class="col-md-4">
                        <input type="text" class="form-control input-sm" id="paciente" name="paciente" placeholder="Paciente" required >
                    </div>                    
                  </div>
                  <div class="form-group row">
                    <label for="doctor" class="col-md-1 control-label" style="text-align:left; ">Doctor <span class="obligatorio">*</span></label>
                    <div class="col-md-2">
                        <select name="doctor" id="doctor" class="form-control" required>                            
                        </select>
                    </div>
                    <label for="instrumentista" class="col-md-2 control-label" style="text-align:left; ">Instrumentista <span class="obligatorio">*</span></label>
                    <div class="col-md-2">
                        <select name="instrumentista" id="instrumentista" class="form-control" required>                            
                        </select>
                    </div>
                    <label for="cirugia" class="col-md-2 control-label" style="text-align:left; ">Tipo de Cirugía <span class="obligatorio">*</span></label>
                    <div class="col-md-3">
                        <select name="cirugia" id="cirugia" class="form-control" required>
                            <option value="null">Seleccione...</option>
                            <option value="OSTEOSINTESIS">OSTEOSINTESIS</option>
                            <option value="OSTEOSINTESIS + INJERTO">OSTEOSINTESIS + INJERTO</option>
                            <option value="OSTEOSINTESIS + INJERTO + KIT">OSTEOSINTESIS + INJERTO + KIT</option>
                            <option value="SOLO INJERTO">SOLO INJERTO</option>
                            <option value="CADERA PARCIAL">CADERA PARCIAL</option>
                            <option value="PROTESIS DE CADERA">PROTESIS DE CADERA</option>
                            <option value="PROTESIS DE RODILLA">PROTESIS DE RODILLA</option>
                            <option value="SOLO TORNILLOS - KIRSCHNER">SOLO TORNILLOS - KIRSCHNER</option>
                            <option value="MALLA DE EXANGUINACION">MALLA DE EXANGUINACION</option>
                        </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="observacion" class="col-md-2 control-label" style="text-align:left; ">Observación</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control input-sm" id="observacion" name="observacion" placeholder="Observaciones">
                    </div> 
                  </div>
                    <div class="col-md-2">
                        <select name="forma_pago" id="forma_pago" class="form-control" style="display: none;">
                            <option value="EFECTIVO" selected>Efectivo</option> 
                            <option value="TRANSFERENCIA">Transferencia</option>
                            <option value="CHEQUE">Cheque</option>                                                       
                            <option value="CREDITO">Crédito</option>                                                       
                        </select>
                     </div>                  
                    <div class="form-group row" style="margin-top: 20px;">                                               
                    </div>    
                    <div class="form-group row producto">
                        <label for="cdigo_producto" class="col-md-1 control-label">Código</label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" id="codigo_producto" name="codigo_producto" placeholder="Código producto" autofocus>
                        </div>
                        <label for="cdigo_producto" class="col-md-1 control-label">Producto</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control input-sm" placeholder="Producto" id='nombre_producto'  autofocus>
                        </div>
                        <div class="btn-group col-md-4" style="margin: 0 0 10px 0;">
                            <button type='button' class="btn btn-primary"  onclick="nuevoProducto()" >
                                <span class="glyphicon glyphicon-plus" ></span> Nuevo Producto
                            </button>
                        </div>
                        <label for="cdigo_producto" class="col-md-1 control-label">Unidad</label>
                        <div class="col-md-2">
                            <select name="unidad_producto" id="unidad_producto" class="form-control" onchange="seleccionaUnidad()">
                                <option value="CAJA">Caja</option>
                                <option value="UND" selected>Unidad</option>
                            </select>
                        </div> 
                        <label for="cdigo_producto" class="col-md-1 control-label">Cant</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control input-sm" id="cantidad_producto" name="cantidad_producto" value="1">
                        </div>
                        <label for="cdigo_producto" class="col-md-2 control-label">Precio Unitario</label>
                        <div class="col-md-2">
                            <select name="precio_unitario_producto" id="precio_unitario_producto" class="form-control">
                                <option value="null">Seleccione...</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-success" onclick="agregar()"><i class="glyphicon glyphicon-plus"></i></button>
                        </div>
                    </div>          
                    <div class="col-md-12" style="margin-top: 20px;">
                        <div class="table-wrapper">
                            <table id="table_productos" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th width="100">Código</th>
                                        <th>Producto</th>
                                        <th width="100">Unidad</th>
                                        <th width="100">Cantidad</th>
                                        <th width="100">P.Unitario $</th>
                                        <th width="100">Total $</th>
                                        <th width="100">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-12" id="costos">
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <td class='text-right' colspan=5>SUBTOTAL</td>
                                    <td class='text-right' colspan=1><span id="subtotal">0.00</span></td>
                                </tr>
                                <tr>
                                    <td class='text-right' colspan=5>DESCUENTO</td>
                                    <td class='text-right' colspan=1><span id="descuento">0.00</span></td>
                                </tr>
                                <tr>
                                    <td class='text-right' colspan=5>TOTAL IVA (12%)</td>
                                    <td class='text-right' colspan=1><span id="total_iva">0.00</span></td>
                                </tr>
                                <tr>
                                    <td class='text-right' colspan=5>TOTAL</td>
                                    <td class='text-right' colspan=1><span id="total">0.00</span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="pull-right">
                            <a href="facturas.php"  class="btn btn-danger">
                                <span class="glyphicon glyphicon-remove"></span> Cancelar
                            </a>
                            <button type="button" class="btn btn-success" id="btn-guardar" onclick="guardar()">
                                <span class="glyphicon glyphicon-floppy-disk"></span> Guardar
                            </button>
                        </div>
                    </div>
                </div>
            </form>			
         </div>
      </div>
    </div>
    <hr>
<?php
    include("footer.php");
 ?>      
      <script type="text/javascript" src="js/config.js"></script>
      <script type="text/javascript" src="js/lib/autocomplete/autocomplete.js"></script>
      <script type="text/javascript" src="js/nueva_factura.js"></script>
      <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   </body>
</html>