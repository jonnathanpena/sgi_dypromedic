<?php
   $active_administracion = "active";
   $active_facturas = "";
   $active_ingresos = "";
   $active_egresos = "";
   $active_guias = "";
   $active_bodega = "";
   $active_reportes = "";
   $active_reportes_usuarios = "";
   $title="Nuevo Personal | SGI";   
?>
<!DOCTYPE html>
<html lang="en">
   <head>
      <?php include("head.php");?>
   </head>
   <body>
      <?php
         include("navbar.php");
         ?>  
      <div class="container">
        <div class="panel panel-info">         
            <div class="panel-heading">
                <div class="btn-group pull-right" onclick="nuevo_externo()">
                    <a class="btn btn-info">
                        <span class="glyphicon glyphicon-plus" ></span> Externno
                    </a>
                </div>
                <div class="btn-group pull-right" style="margin-right: 2%;" onclick="nuevo_personal()">
                    <a class="btn btn-info">
                        <span class="glyphicon glyphicon-plus" ></span> Personal
                    </a>
                </div>
                
               <h4 id="tituloE"><i class='glyphicon glyphicon-edit'></i> Nuevo Personal Externo</h4>
               <h4 id="tituloP"><i class='glyphicon glyphicon-edit'></i> Nuevo Personal</h4>
            </div>
            <div class="panel-body">

<?php
    include("modal/load.php");
?>  
                <form style="display: none;" class="form-horizontal" role="form" id="form_nuevo_externo">
                    <div class="form-group row">
                        <label for="profesion" class="col-md-1 control-label" style="text-align:left;">Profesional<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <select name="profesion" id="profesion" class="form-control">
                                <option value="null">Seleccione...</option>
                                <option value="Doctor">Doctor</option>
                                <option value="Instrumentista">Instrumentista</option>
                            </select>
                        </div>
                        <label for="nombre-profesion" class="col-md-1 control-label" style="text-align:left;">Nombre<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" id="nombre-profesion" nombre="nombre" placeholder="Nombre" required>
                        </div>
                        <label for="apellido-profesion" class="col-md-1 control-label" style="text-align:left;">Apellido<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" id="apellido-profesion" name="apellido" placeholder="Apellido" required>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="pull-right">
                            <a href="personal.php"  class="btn btn-danger">
                                <span class="glyphicon glyphicon-remove"></span> Cancelar
                            </a>
                            <button type="submit" class="btn btn-success" id="btn-guardar-e"> 
                                <span class="glyphicon glyphicon-floppy-disk"></span> Guardar
                            </button>
                        </div>
                    </div>
                </form>
               <form style="display: none;" class="form-horizontal" role="form" id="form_nuevo_personal">
                    <div class="form-group row">
                        <label for="tipo_documento" class="col-md-1 control-label" style="text-align:left;">Tipo Documento</label>
                        <div class="col-md-2">
                            <select name="tipo_documento" id="tipo_documento" class="form-control">
                                <option value="null">Seleccione...</option>
                                <option value="Cedula">Cédula</option>
                                <option value="RUC">RUC</option>
                                <option value="Pasaporte">Pasaporte</option>
                            </select>
                        </div>
                        <label for="documento" class="col-md-1 control-label" style="text-align:left;">Documento</label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" id="documento" name="documento" placeholder="Documento del cliente" onkeyup="getDocumento()" >
                            <span style="color: red;" id="span_documento">¡Documento ya registrado!</span>
                        </div>
                        <label for="nombre" class="col-md-1 control-label" style="text-align:left;">Nombre<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" id="nombre" nombre="nombre" placeholder="Nombre" required>
                        </div>
                        <label for="apellido" class="col-md-1 control-label" style="text-align:left;">Apellido<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" id="apellido" name="apellido" placeholder="Apellido" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="tlf" class="col-md-1 control-label" style="text-align:left;">Teléfono</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control input-sm" id="tlf" name="tlf" placeholder="Teléfono">
                        </div>
                        <label for="celular" class="col-md-1 control-label" style="text-align:left;">Celular</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control input-sm" id="celular" name="celular" placeholder="Celular">
                        </div>
                        <label for="email" class="col-md-1 control-label" style="text-align:left;">Email</label>
                        <div class="col-md-2">
                            <input type="email" class="form-control input-sm" id="email" name="email" placeholder="Email">
                        </div>
                        <label for="fecha_nac" class="col-md-1 control-label" style="text-align:left;">F.Nacimiento</label>
                        <div class="col-md-2">
                            <input type="date" class="form-control input-sm" id="fecha_nac" name="fecha_nac">
                        </div>                        
                    </div>
                    <div class="form-group row">
                        <label for="direccion" class="col-md-1 control-label" style="text-align:left;">Dirección</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control input-sm" id="direccion" name="direccion" placeholder="Dirección">
                        </div>
                        <label for="fecha_ingreso" class="col-md-1 control-label" style="text-align:left;">F.Ingreso</label>
                        <div class="col-md-2">
                            <input type="date" class="form-control input-sm" id="fecha_ingreso" name="fecha_ingreso">
                        </div>
                        <label for="contrato" class="col-md-1 control-label" style="text-align:left;">Contrato<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <select name="cargo" id="contrato" class="form-control">
                                <option value="null">Seleccione...</option>
                                <option value="Nómina">Nómina</option>
                                <option value="Externo">Externo</option>
                            </select>
                        </div>                        
                    </div>
                    <div class="form-group row">
                        <label for="cargo" class="col-md-1 control-label" style="text-align:left;">Cargo<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <select name="cargo" id="cargo" class="form-control" onchange="sleccionaCargo()">
                                <option value="null">Seleccione...</option>
                                <option value="Administrador">Administrador</option>
                                <option value="Asistente">Asistente</option>
                                <option value="Contador">Contador</option>
                                <option value="Vendedor">Vendedor</option>
                            </select>
                        </div>
                        <label for="sueldo" class="col-md-1 control-label" style="text-align:left;">Sueldo</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control input-sm" id="sueldo" name="sueldo" placeholder="Sueldo" min="0.00" step="0.01">
                        </div>                                         
                        <label for="es_usuario" class="col-md-1 control-label" style="text-align:left;">¿Usuario?</label>
                        <div class="form-check col-md-2">
                            <input type="checkbox" data-toggle="toggle" id="toggle-usuario" data-on="SI" data-off="NO" data-onstyle="info" data-size="small">
                            <input type="hidden" name="es_usuario" id="es_usuario" value="0">
                        </div> 
                        <label for="usuario" class="col-md-1 control-label usuario" style="text-align:left;">Usuario<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm usuario" id="usuario" name="usuario" placeholder="Usuario">
                        </div>                          
                    </div>
                    <div class="form-group row"> 
                        <label for="clave" class="col-md-1 control-label usuario" style="text-align:left;">Contraseña<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="password" class="form-control input-sm usuario" id="clave" name="clave" placeholder="Contraseña">
                        </div>                                          
                        <label for="confirme" class="col-md-1 control-label usuario" style="text-align:left;">Repetir Clave<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="password" name="confirme" id="confirme" class="form-control usuario" placeholder="Repetir Clave">
                            <input type="hidden" id="perfil" >
                        </div>
                        <!--<div class="form-group">
                            <label for="perfil" class="col-md-1 control-label usuario">Perfil</label>
                            <div class="col-md-2">
                                <select name="perfil" id="perfil" class="form-control usuario" disabled>
                                    <option value="null">Seleccione...</option>
                                    <option value="Supervisor">Supervisor</option>
                                    <option value="Ventas">Ventas</option>
                                </select>
                            </div>
                        </div>-->
                    </div>                            
                    <div class="form-group row producto">
                        <h4 style="margin-left: 2%;">Persona de Contacto</h4>
                        <label for="nombre_contacto" class="col-md-1 control-label" style="text-align:left;">Nombre</label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" id="nombre_contacto" name="nombre_contacto" placeholder="Nombre" autofocus>
                        </div>
                        <label for="tlf-contacto" class="col-md-1 control-label" style="text-align:left;">Teléfono</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control input-sm" placeholder="Teléfono" id='tlf-contacto'>
                        </div>                                
                    </div>
                    <div class="col-md-12">
                        <div class="pull-right">
                            <a href="personal.php"  class="btn btn-danger">
                                <span class="glyphicon glyphicon-remove"></span> Cancelar
                            </a>
                            <button type="submit" class="btn btn-success" id="btn-guardar"> 
                                <span class="glyphicon glyphicon-floppy-disk"></span> Guardar
                            </button>
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
      <script type="text/javascript" src="js/nuevo_personal.js"></script>
      <link rel="stylesheet" href="./css/nueva_compra.css">
   </body>
</html>

