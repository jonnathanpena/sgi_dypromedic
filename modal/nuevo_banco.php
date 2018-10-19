<?php

$fecha = date("d/m/Y");

?>
<!-- Modal -->
<div class="modal fade" id="nuevoBanco" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Nuevo Banco</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="guardar_banco" name="guardar_banco">
                    <div id="resultados_ajax"></div>
                        <div class="form-group">
                            <label for="usuario" class="col-sm-3 control-label" style="text-align:left;">Usuario</label>
                            <div class="col-sm-8">
                                <select name="usuario" id="usuario" class="form-control" disabled>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descripcion" class="col-sm-3 control-label" style="text-align:left;">Descripción<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Descripción" required>                                
                            </div>
                        </div>
                        <div class="form-group row">
                        <label for="banco" class="col-md-3 control-label" style="text-align:left;">Banco<span class="obligatorio">*</span></label>
                        <div class="col-md-8">
                            <select class='form-control input-sm' id="banco" name="banco">
                            </select>
                        </div> 
                        </div>
                        <div class="form-group">
                            <label for="cuenta" class="col-sm-3 control-label" style="text-align:left;">Número de Cuenta<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="cuenta" name="cuenta" placeholder="Número de Cuenta" required>
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



