<!-- Modal -->
<div class="modal fade" id="nuevoProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Nuevo producto</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="guardar_producto" name="guardar_producto">
                    <div id="resultados_ajax"></div>
                    <div class="form-group producto">
                        <div class="form-group">
                            <label for="tipo" class="col-sm-3 control-label" style="text-align:left; margin-left:15px;">Tipo<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select style="width: 95%; margin-left: -8px;" name="tipo" id="tipo" class="form-control" required>
                                    <option value="Producto" selected>Producto</option>
                                    <option value="Servicio">Servicio</option>
                                </select>
                            </div>
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="categoria" class="col-sm-3 control-label" style="text-align: left;">Categoría<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="categoria" name="categoria" placeholder="Categoría" autofocus required> 
                            </div>
                        </div>
                        <div class="form-group" style="display: none;">
                            <label for="codigop" class="col-sm-3 control-label" style="text-align: left;">Código<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="codigop" value="PRO-" name="codigop" placeholder="Código" autofocus disabled> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="codigopro" class="col-sm-3 control-label" style="text-align: left;">Código<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="codigopro" name="codigopro" placeholder="Código Producto" autofocus required> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="codigoiess" class="col-sm-3 control-label" style="text-align: left;">Código IESS</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="codigoiess" name="codigoiess" placeholder="Código IESS" autofocus> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nombre" class="col-sm-3 control-label" style="text-align: left;">Nombre<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <textarea class="form-control" id="nombre" name="nombre" placeholder="Nombre" autofocus required></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pvt1" class="col-sm-3 control-label" style="text-align: left;">Precio 1<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="pvt1" name="pvt1" min="0.01" step="0.01" placeholder="Precio Normal x Caja" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pvt2" class="col-sm-3 control-label" style="text-align: left;">Precio 2</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="pvt2" name="pvt2" min="0.01" step="0.01" placeholder="Precio Descuento x Caja">
                            </div>
                        </div>
                        <div class="form-group" style="display: none;">
                            <label for="pvp" class="col-sm-3 control-label" style="text-align:left;">PVP<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="pvp" name="pvp" min="0.01" step="0.01" placeholder="PVP">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="iva" class="col-sm-3 control-label" style="text-align:left;">IVA<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select name="iva" id="iva" class="form-control"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="unidad" class="col-sm-3 control-label" style="text-align:left;">Unidad<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <select name="unidad" id="unidad" class="form-control" required>
                                    <option value="UND" selected>Unidad</option>
                                    <option value="CAJA">Caja</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group" id="und_caja">
                            <label for="unidad_caja" class="col-sm-3 control-label" style="text-align:left;">Unidad x caja<span class="obligatorio">*</span></label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="unidad_caja" name="unidad_caja" min="1" step="1" placeholder="Unidades x caja">
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