<!-- Modal -->
<div class="modal fade" id="editarProveedor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Editar proveedor</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" id="modificar_proveedor" name="modificar_proveedor">
                    <div id="resultados_ajax"></div>
                    <div class="form-group producto">
                        <div class="form-group">
                            <label for="codigo" class="col-sm-3 control-label" style="text-align:left; margin-left: 2%;">CÓDIGO</label>
                            <div class="col-sm-8">
                                <input style="width: 95%; margin-left: -8px;" type="text" class="form-control" id="codigo" name="codigo" min="1" step="1" disabled>
                                <input type="hidden" id="id">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editRuc" class="col-sm-3 control-label" style="text-align:left; margin-left: 2%;">RUC<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input style="width: 95%; margin-left: -8px;" type="number" class="form-control" id="editRuc" name="editRuc" min="1" step="1" placeholder="RUC" required>
                            </div>
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="editNombre" class="col-sm-3 control-label" style="text-align:left;">Nombre<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editNombre" name="editNombre" placeholder="Nombre" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editDireccion" class="col-sm-3 control-label" style="text-align:left;">Dirección</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editDireccion" name="editDireccion" placeholder="Dirección">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editTelefono" class="col-sm-3 control-label" style="text-align:left;">Teléfono</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editTelefono" name="editTelefono" placeholder="Teléfono">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editCorreo" class="col-sm-3 control-label" style="text-align:left;">Email</label>
                            <div class="col-sm-8">
                                <input type="email" class="form-control" id="editCorreo" name="editCorreo" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editPagweb" class="col-sm-3 control-label" style="text-align:left;">Pág Web</label>
                            <div class="col-sm-8">
                                <input type="url" class="form-control" id="editPagweb" name="editPagweb" placeholder="http://www.pagweb.com">
                            </div>
                        </div>
                        <h4 style="text-align:left; ">Persona de Contacto</h4>
                        <div class="form-group">
                            <label for="editNombre_contacto" class="col-sm-3 control-label" style="text-align:left;">Nombre</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editNombre_contacto" name="editNombre_contacto" placeholder="Nombre Contacto">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editTelefono_contacto" class="col-sm-3 control-label" style="text-align:left;">Teléfono</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editTelefono_contacto" name="editTelefono_contacto" placeholder="Teléfono Contacto">
                            </div>
                        </div>
                    </div>
                <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-primary" id="modificar">Modificar</button>
        </div>
    </form>
</div>
</div>
</div>
<link rel="stylesheet" href="./css/cliente.css">