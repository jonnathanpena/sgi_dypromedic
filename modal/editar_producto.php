<!-- Modal -->
<div class="modal fade" id="editarProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Editar producto</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="modificar_producto" name="modificar_producto">
                    <div id="resultados_ajax"></div>
                    <div class="form-group producto">
                        <div class="form-group">
                            <label for="editipo" class="col-sm-3 control-label" style="text-align:left; margin-left:15px;">Tipo<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select style="width: 95%; margin-left: -8px;" name="editipo" id="editipo" class="form-control" required>
                                    <option value="Producto">Producto</option>
                                    <option value="Servicio">Servicio</option>
                                </select>
                            </div>
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="editcategoria" class="col-sm-3 control-label" style="text-align: left;">Categoría<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editcategoria" name="editcategoria" placeholder="Categoría" autofocus required> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="codigo" class="col-sm-3 control-label" style="text-align: left;">Código</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="codigo" name="codigo" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editcodigoiess" class="col-sm-3 control-label" style="text-align: left;">Código IESS</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editcodigoiess" name="editcodigoiess" placeholder="Código IESS" autofocus> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editNombre" class="col-sm-3 control-label" style="text-align: left;">Nombre<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <textarea type="text" class="form-control" id="editNombre" name="editNombre" placeholder="Nombre" autofocus required></textarea>
                                <input type="hidden" class="form-control" id="id" >
                                <input type="hidden" class="form-control" id="id_precio" >
                                <input type="hidden" class="form-control" id="editPpp" >
                                <input type="hidden" class="form-control" id="editMin" >
                                <input type="hidden" class="form-control" id="editUtilidad" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editPvt1" class="col-sm-3 control-label" style="text-align: left;">Precio 1<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="editPvt1" name="editPvt1" min="0.01" step="0.01" placeholder="Precio Normal x Caja" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editPvt2" class="col-sm-3 control-label" style="text-align: left;">Precio 2</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="editPvt2" name="editPvt2"  placeholder="Precio Descuento x Caja">
                            </div>
                        </div>
                        <div class="form-group" style="display:none;">
                            <label for="editPvp" class="col-sm-3 control-label" style="text-align: left;">PVP<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="editPvp" name="editPvp" placeholder="PVP">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editIva" class="col-sm-3 control-label" style="text-align: left;">IVA<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select name="editIva" id="editIva" class="form-control" required></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editunidad" class="col-sm-3 control-label" style="text-align:left;">Unidad<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select name="editunidad" id="editunidad" class="form-control" required>
                                    <option value="UND" selected>Unidad</option>
                                    <option value="CAJA">Caja</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group" id="edit_und_caja">
                            <label for="editUnidad_caja" class="col-sm-3 control-label" style="text-align:left;">Unidad x caja<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="editUnidad_caja" name="editUnidad_caja" min="1" step="1" placeholder="Unidad x Caja" required>
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



