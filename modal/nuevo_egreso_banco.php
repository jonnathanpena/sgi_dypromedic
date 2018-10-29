<?php

$fecha = date("d/m/Y");

?>
<!-- Modal -->
<div class="modal fade" id="nuevoEgresoBanco" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Nuevo egreso</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="guardar_egreso" name="guardar_egreso">
                    <div id="resultados_ajax"></div>
                    <div class="form-group producto">
                        <div class="form-group">
                            <label for="usuario_egreso" class="col-sm-3 control-label" style="text-align:left; margin-left:15px;">Usuario</label>
                            <div class="col-sm-8">
                                <select style="width: 95%; margin-left: -8px;" name="usuario_egreso" id="usuario_egreso" class="form-control" disabled>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="fecha_egreso" class="col-sm-3 control-label" style="text-align:left; margin-left:15px;">Fecha<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input style="width: 95%; margin-left: -8px;" type="date" class="form-control" id="fecha_egreso" name="fecha_egreso"  require>
                            </div>
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="perfilEg" class="col-sm-3 control-label" style="text-align:left;">Banco<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select class="form-control" id="perfilEg" name="perfilEg" disabled></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="movimiento" class="col-sm-3 control-label" style="text-align:left;">Detalle<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select class="form-control" id="movimiento" name="movimiento"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="documento_egreso" class="col-sm-3 control-label" style="text-align:left;">Número documento<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="documento_egreso" name="documento_egreso" placeholder="Número documento">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="valor_egreso" class="col-sm-3 control-label" style="text-align:left;">Valor<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="valor_egreso" name="valor_egreso" placeholder="Valor" min="0.01" step="0.01" max="10000" onkeyup="calcularEgreso()" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="saldo" class="col-sm-3 control-label" style="text-align:left;">Saldo</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="saldo" name="saldo" min="0.01" step="0.01" disabled>
                            </div>
                        </div>
                    </div>
                <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-primary" id="guardar">Guardar</button>
        </div>
    </form>
</div>
</div>
</div>
<link rel="stylesheet" href="./css/cliente.css">