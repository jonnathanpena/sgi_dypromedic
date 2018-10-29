<!-- Modal -->
<div class="modal fade" id="editarCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Modificar cliente</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="modificar_cliente" name="modificar_cliente">
                    <div id="resultados_ajax"></div>
                    <div class="form-group producto">
                        <div class="form-group">
                            <label for="editCodigo" class="col-sm-3 control-label" style="text-align:left; margin-left:15px;">Código</label>
                            <div class="col-sm-8">
                                <input style="width: 95%; margin-left: -8px;" type="text" class="form-control" id="editCodigo" name="editCodigo" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editTipo_documento" class="col-sm-3 control-label" style="text-align:left; margin-left:15px;">Tipo Documento<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select style="width: 95%; margin-left: -8px;" name="editTipo_documento" id="editTipo_documento" class="form-control" required>
                                    <option value="null">Seleccione...</option>
                                    <option value="Cedula">Cédula</option>
                                    <option value="RUC">R.U.C</option>
                                    <option value="Pasaporte">Pasaporte</option>
                                </select>
                            </div>
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="editDocumento" class="col-sm-3 control-label" style="text-align:left;">Documento<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input style="width: 95%; margin-left: -8px;" type="number" class="form-control" id="editDocumento" name="editDocumento" min="1" step="1" placeholder="Documento">
                                <input style="width: 95%; margin-left: -8px;" type="number" class="form-control" id="editRuc" name="editRuc" min="1" step="1" placeholder="Documento">
                                <input style="width: 95%; margin-left: -8px;" type="number" class="form-control" id="editPasaporte" name="editPasaporte" placceholder="Documento">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editNombre" class="col-sm-3 control-label" style="text-align:left;">Nombre<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editNombre" name="editNombre" placeholder="Nombre" required>
                            </div>
                        </div>                    
                        <div class="form-group" style="display: none;">
                            <label for="editRazon_social" class="col-sm-3 control-label">Razón Social</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editRazon_social" name="editRazon_social" placeholder="Razón Social">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editDireccion" class="col-sm-3 control-label" style="text-align:left;">Dirección<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editDireccion" name="editDireccion" placeholder="Dirección" required>
                            </div>
                        </div>
                        <div class="form-group" style="display: none;">
                            <label for="editReferencia" class="col-sm-3 control-label">Referencia<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editReferencia" name="editReferencia" placeholder="Referencia">
                            </div>
                        </div>
                        <div class="form-group" style="display: none;">
                            <label for="editSector" class="col-sm-3 control-label">Sector<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select class="form-control" name="editSector" id="editSector">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editEmail" class="col-sm-3 control-label" style="text-align:left;">Email<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="email" class="form-control" id="editEmail" name="editEmail" placeholder="Email" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editTelefono" class="col-sm-3 control-label" style="text-align:left;">Teléfono</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editTelefono" name="editTelefono" placeholder="Teléfono" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editCelular" class="col-sm-3 control-label" style="text-align:left;">Celular</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editCelular" name="editCelular" placeholder="Celular" >
                                <input type="hidden" class="form-control" id="id">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editCalificacion" class="col-sm-3 control-label" style="text-align:left;">Calificación</label>
                            <div class="col-sm-8">
                                <select name="editCalificacion" id="editCalificacion" class="form-control">
                                    <option value="null">Seleccione...</option>
                                    <option value="Clientes A">Clientes A</option>
                                    <option value="Clientes B">Clientes B</option>
                                    <option value="Clientes C">Clientes C</option>
                                    <option value="Clientes D">Clientes D</option>
                                </select>
                            </div>
                        </div>
                    </div>
                <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-primary" id="modificar">Guardar</button>
        </div>
    </form>
</div>
</div>
</div>
<link rel="stylesheet" href="./css/cliente.css">