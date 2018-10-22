<?php
	$active_administracion = "";
    $active_facturas = "";
    $active_ingresos = "";
    $active_egresos = "active";
    $active_guias = "";
    $active_bodega = "";
    $active_reportes = "";
    $active_reportes_usuarios = "";
	$title="Banco | SGI";
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <?php include("head.php");?>
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="libraries/autocomplete/easy-autocomplete.min.css"> 
    <link rel="stylesheet" href="libraries/autocomplete/easy-autocomplete.themes.min.css">
  </head>
  <body>
<?php
	include("navbar.php");
?>
    <div class="container">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="btn-group pull-right">
                    <button type='button' class="btn btn-info" onclick="nuevoBanco()">
                        <span class="glyphicon glyphicon-plus" ></span> 
                        Nuevo Banco
                    </button>                    
                </div>
                <h4><i class='glyphicon glyphicon-usd'></i> Bancos Empresa</h4>
            </div>
            <div class="panel-body">

<?php
    include("modal/nuevo_banco.php");
    include("modal/edita_banco.php");
?>

                <form class="form-horizontal" role="form" style="margin-bottom: 25px;">
                    <div class="form-group row">
                        <label for="q" class="col-md-2 control-label"  style="text-align:left;">Alias o Banco:</label>
						<div class="col-md-5"  style="text-align:left;">
							<input type="text" class="form-control" id="q" placeholder="Nombre o Documento" onkeyup='load();'>
						</div>
                        <div class="col-md-3">
                            <button type="button" class="btn btn-default" onclick='load();' style="display: none;">
                                <span class="glyphicon glyphicon-search" ></span> Buscar
                            </button>
                            <span id="loader"></span>
                        </div>
					</div>
                </form>
                <div id="resultados">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr class="info">
                                    <th style="text-align:left;">Alias</th>
                                    <th style="text-align:left;">Banco</th>
                                    <th style="text-align:left;">#Cuenta</th>
                                    <th style="text-align:left;">Tipo Cuenta</th>
                                    <th style="text-align:left;">Tipo</th>
                                    <th class='text-right'>Acciones</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    <div id="pager" style="float: right;">
                        <ul id="pagination" class="pagination-sm"></ul>
                    </div>
                </div><!-- Carga los datos ajax -->
            </div>
        </div>
    </div>
    <hr>
<?php
    include("footer.php");
?>
    <script type="text/javascript" src="js/config.js"></script>
    <script type="text/javascript" src="js/adm_banco.js"></script>
    </body>
</html>