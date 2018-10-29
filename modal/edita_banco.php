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
                    <div class="form-group producto">
                        <div class="form-group">
                            <label for="editUsuario" class="col-sm-3 control-label" style="text-align:left; margin-left:15px;">Usuario</label>
                            <div class="col-sm-8">
                                <select style="width: 95%; margin-left: -8px;" name="editUsuario" id="editUsuario" class="form-control" disabled>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editDescripcion" class="col-sm-3 control-label" style="text-align:left; margin-left:15px;">Alias<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input style="width: 95%; margin-left: -8px;" type="text" class="form-control" id="editDescripcion" name="editDescripcion" placeholder="Alias" required>                                
                                <input class="hidden" id="id" >                                
                            </div>
                        </div>
                    </div>
                        <div class="form-group row">
                        <label for="editBanco" class="col-md-3 control-label" style="text-align:left;">Banco<span class="obligatorio">*</span></label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="editBanco" name="editBanco" placeholder="Banco" required>                                                            
                        </div> 
                        </div>
                        <div class="form-group">
                            <label for="editCuenta" class="col-sm-3 control-label" style="text-align:left;">Número de Cuenta<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="editCuenta" name="editCuenta" placeholder="Número de Cuenta" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editTipo-cuenta" class="col-sm-3 control-label" style="text-align:left;">Tipo Cuenta<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select name="editTipo-cuenta" id="editTipo-cuenta" class="form-control">
                                    <option value="null">Seleccione...</option>
                                    <option value="Ahorro">Ahorro</option>
                                    <option value="Corriente">Corriente</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editTipo" class="col-sm-3 control-label" style="text-align:left;">Tipo<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select name="editTipo" id="editTipo" class="form-control">
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
<link rel="stylesheet" href="./css/cliente.css">