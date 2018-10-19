<?php

$fecha = date("d/m/Y");

?>
<!-- Modal -->
<div class="modal fade" id="editaBanco" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Modificar Banco</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="editar_banco" name="editar_banco">
                    <div id="resultados_ajax"></div>
                        <div class="form-group">
                            <label for="usuario" class="col-sm-3 control-label" style="text-align:left;">Usuario</label>
                            <div class="col-sm-8">
                                <select name="usuario" id="usuario" class="form-control" disabled>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descripcion" class="col-sm-3 control-label" style="text-align:left;">Alias<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Alias" required>                                
                            </div>
                        </div>
                        <div class="form-group row">
                        <label for="banco" class="col-md-3 control-label" style="text-align:left;">Banco<span class="obligatorio">*</span></label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="banco" name="banco" placeholder="Banco" required>                                                            
                        </div> 
                        </div>
                        <div class="form-group">
                            <label for="cuenta" class="col-sm-3 control-label" style="text-align:left;">Número de Cuenta<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="cuenta" name="cuenta" placeholder="Número de Cuenta" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tipo-cuenta" class="col-sm-3 control-label" style="text-align:left;">Tipo Cuenta<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select name="tipo-cuenta" id="tipo-cuenta" class="form-control">
                                    <option value="null">Seleccione...</option>
                                    <option value="Ahorro">Ahorro</option>
                                    <option value="Corriente">Corriente</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tipo" class="col-sm-3 control-label" style="text-align:left;">Tipo<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select name="tipo" id="tipo" class="form-control">
                                    <option value="null">Seleccione...</option>
                                    <option value="Empresarial">Empresarial</option>
                                    <option value="Personal">Personal</option>
                                </select>
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