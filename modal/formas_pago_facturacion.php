<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="formasPagoFacturacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body">
                <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                    <label class="col-md-2 control-label">Forma de Pago</label>
                    <div class="col-md-4">
                        <select class='form-control input-sm' id="formas_pago" name="formas_pago">
                            <option value="3" selected>Efectivo</option>
                            <option value="1">Cheque</option>
                            <option value="2">Transferencia bancaria</option>                            
                            <option value="4">Crédito</option>
                        </select>                         
                    </div>
                    <div class="col-md-1">
                        <button type="button" id="nuevo_pago" class="btn btn-success">
                            <i class="fa fa-plus"></i> Agregar
                        </button>
                    </div>
                </div>
                <div id="pago_efectivo" class="producto">
                    <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                        <label for="valor-efectivo" class="col-md-1 control-label">Monto:<span class="obligatorio">* </span></label>
                        <div class="col-md-3">
                            <input type="number" min="0.01" step="0.01" class="form-control input-sm" name="monto_efectivo" id="monto_efectivo" 
                                placeholder="Monto">
                        </div>                        
                    </div>
                </div>

                <div id="pago_transferencia" class="producto">
                    <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                        <label for="banco_emisor" class="col-md-1 control-label">Del<span class="obligatorio">*</span></label>
                        <div class="col-md-3">
                            <select class='form-control input-sm' id="banco_emisor" name="banco_emisor">
                            </select>
                        </div>
                        <label for="banco_receptor" class="col-md-1 control-label">Al<span class="obligatorio">*</span></label>
                        <div class="col-md-3">
                            <select id="banco_receptor" class='form-control input-sm' name="banco_receptor">
                            </select>
                        </div>
                        <label for="monto" class="col-md-1 control-label">Monto<span class="obligatorio">*</span></label>
                        <div class="col-md-3">
                            <input type="number" min="0.01" step="0.01" class="form-control input-sm" name="monto" id="monto_transferencia" 
                                placeholder="Monto abonado">
                        </div>                        
                    </div>  
                    <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                        <label for="codigo_transferencia" class="col-md-2 control-label">Código Transferencia<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" name="codigo_transferencia" id="codigo_transferencia" 
                                placeholder="Código de transferencia">
                        </div>
                        <label for="fecha_transferencia" class="col-md-2 control-label">Fecha<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="date" class="form-control input-sm" name="fecha" id="fecha_transferencia" placeholder="Fecha transferencia" >
                        </div>
                        <label for="observacion" class="col-md-2 control-label">Observación</label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" name="observacion" id="observacion" placeholder="Observación">
                        </div>
                    </div>  
                </div>

                <div id="pago_tarjeta" class="producto">
                    <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                        <label for="banco_tarjeta" class="col-md-1 control-label">Banco<span class="obligatorio">*</span></label>
                        <div class="col-md-3">
                            <select class='form-control input-sm' id="banco_tarjeta" name="banco_tarjeta" >
                            </select>
                        </div>
                        <label for="tipo_tarjeta" class="col-md-1 control-label">Tipo<span class="obligatorio">*</span></label>
                        <div class="col-md-3">
                            <select id="tipo_tarjeta" class='form-control input-sm' name="tipo_tarjeta" >
                                <option>Seleccione tipo de tarjeta...</option>
                                <option value="1">Débito</option>
                                <option value="2">Crédito</option>
                            </select>
                        </div>
                        <label for="marca_tarjeta" class="col-md-2 control-label">Franquicia<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <select id="marca_tarjeta" class='form-control input-sm' name="marca_tarjeta" >
                            </select>
                        </div>                       
                    </div> 

                    <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                        <label for="numero_recibo" class="col-md-2 control-label"># Recibo<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="number" min="0" step="1" class="form-control input-sm" name="numero_recibo" id="numero_recibo" 
                                placeholder="Número del Recibo" >
                        </div>
                        <label for="fecha_tarjeta" class="col-md-2 control-label">Fecha<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="date" class="form-control input-sm" name="fecha" id="fecha" placeholder="Fecha pago" >
                            <input type="hidden" name="fecha_tarjeta" id="fecha_tarjeta">
                        </div>
                        <label for="monto" class="col-md-2 control-label">Monto<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="number" min="0.01" step="0.01" class="form-control input-sm" name="monto" id="monto_tarjeta" 
                                placeholder="Monto abonado" onkeyup='calcularRestante()' >
                        </div>
                    </div>     

                    <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                        <label for="titular_tarjeta" class="col-md-1 control-label">Titular<span class="obligatorio">*</span></label>
                        <div class="col-md-3">
                            <input type="text" class="form-control input-sm" name="titular_tarjeta" id="titular_tarjeta" 
                                placeholder="Titular de la Tarjeta" >
                        </div>
                        <label for="observacion" class="col-md-2 control-label">Observación<span class="obligatorio">*</span></label>
                        <div class="col-md-6">
                            <input type="text" class="form-control input-sm" name="observacion" id="observacion" placeholder="Observación">
                        </div>
                    </div>                       
                </div>

                <div id="pago_cheque" class="producto">
                    <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                        <label for="banco_cheque" class="col-md-1 control-label">Banco<span class="obligatorio">*</span></label>
                        <div class="col-md-3">
                            <select class='form-control input-sm' id="banco_cheque" name="banco_cheque">
                            </select>
                        </div> 
                        <label for="numero_cheque" class="col-md-2 control-label"># Cheque<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="number" min="0" step="1" class="form-control input-sm" name="numero_cheque" id="numero_cheque" 
                                placeholder="Número del cheque">
                        </div> 
                        <label for="monto" class="col-md-2 control-label">Monto<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="number" min="0.01" step="0.01" class="form-control input-sm" name="monto" id="monto_cheque" 
                                placeholder="Monto">
                        </div>                     
                    </div> 

                    <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                        <label for="titular_cheque" class="col-md-2 control-label">Titular<span class="obligatorio">*</span></label>
                        <div class="col-md-4">
                            <input type="text" class="form-control input-sm" name="titular_cheque" id="titular_cheque" 
                                placeholder="Títular del cheque">
                        </div>
                        <label for="observacion" class="col-md-2 control-label">Observación</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control input-sm" name="observacion_cheque" id="observacion_cheque" placeholder="Observación">
                        </div>
                    </div>                    
                </div>

                <div id="pago_electronico" class="producto">
                    <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                        <label for="empresa" class="col-md-1 control-label">Empresa<span class="obligatorio">*</span></label>
                        <div class="col-md-3">
                            <input type="text" class="form-control input-sm" name="empresa" id="empresa" placeholder="Empresa">
                        </div> 
                        <label for="codigo" class="col-md-2 control-label">Código<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" name="codigo" id="codigo" placeholder="Código">
                        </div> 
                        <label for="monto_electronico" class="col-md-2 control-label">Monto<span class="obligatorio">*</span></label>
                        <div class="col-md-2">
                            <input type="text" class="form-control input-sm" name="monto_electronico" id="monto_electronico" placeholder="Monto">
                        </div>                     
                    </div>
                    <div class="form-group row" style="margin-left: 0; margin-right: 0;">
                        <label for="observacion_electronico" class="col-md-2 control-label">Observación<span class="obligatorio">*</span></label>
                        <div class="col-md-10">
                            <input type="text" class="form-control input-sm" name="observacion_electronico" id="observacion_electronico" placeholder="Observación">
                        </div>                   
                    </div>
                </div> 
                <div class="table-wrapper">
                    <table id="pagos" class="table table-bordered" width="100%">
                        <thead>
                            <tr>
                                <th>Método</th>
                                <th>Valor</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>
                        <tbody> </tbody>
                    </table>
                </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal" id="cancelarCuotas">Cancelar</button>
				<button type="button" class="btn btn-success" id="guardarFacuturacion" data-dismiss="modal">Guardar</button>
			</div>
		</div>
	</div>
</div>