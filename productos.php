<?php
	$active_administracion = "";
    $active_facturas = "";
    $active_ingresos = "";
    $active_egresos = "";
    $active_guias = "";
    $active_bodega = "active";
    $active_reportes = "";
    $active_reportes_usuarios = "";
	$title="Productos | SGI";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
	<?php include("head.php");?>
    <link rel="stylesheet" href="js/lib/autocomplete/autocomplete.css">
  </head>
  <body>
 	<?php
	include("navbar.php");
	?> 
    <div class="container">
		<div class="panel panel-info">
		<div class="panel-heading">
		    <div class="btn-group pull-right">
				<button type='button' class="btn btn-info" onclick="nuevoProducto()">
                    <span class="glyphicon glyphicon-plus" ></span> Nuevo Producto
                </button>
                <button class="btn btn-info" style="margin-left: 10px;" onclick="exportar()">
                    <span class="glyphicon glyphicon-cloud-download" ></span>
                </button>
			</div>
			<h4><i class='glyphicon glyphicon-search'></i> Buscar Producto</h4>
		</div>	
		<div class="panel-body">
<?php
include("modal/nuevo_producto.php");
include("modal/editar_producto.php");
?>
            <form class="form-horizontal" role="form" id="datos_cotizacion">
                <div class="form-group row">
                    <label for="q" class="col-md-2 control-label">Nombre o Código</label>
                    <div class="col-md-5">
                        <input type="text" class="form-control" id="q" placeholder="Nombre o Código" onkeyup='load()'>
                    </div>
                    <div class="col-md-3">
                        <button type="button" class="btn btn-default" onclick='load()' style="display: none;">
                            <span class="glyphicon glyphicon-search" ></span> Buscar</button>
                            <span id="loader"></span>
                    </div>
                </div>
            </form>
            <div id="resultados">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr class="info">
                                <th>Tipo</th>
                                <th>Código</th>
                                <th>Cód IESS</th>
                                <th>Nombre</th>
                                <!--<th class="text-center">PPP</th>-->
                                <th class="text-center">Precio 1</th>
                                <th class="text-center">Precio 2</th>
                                <th>Categoría</th>
                                <!--<th class="text-center">PVP</th>-->
                                <!--<th class="text-center">IVA</th>-->
                                <!--<th class="text-center">Min Sugerido</th>-->
                                <!--<th class="text-center">Unidad Caja</th>-->
                                <!--<th class="text-center">Utilidad</th>-->
                                <th class='text-right'>Acciones</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
                <div id="pager" style="float: right;">
                    <ul id="pagination" class="pagination-sm"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
<hr>
<?php
include("footer.php");
?>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/lib/autocomplete/autocomplete.js"></script>
<script type="text/javascript" src="js/productos.js"></script>
</body>
</html>