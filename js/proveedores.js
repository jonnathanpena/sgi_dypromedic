var $pagination = $('#pagination'),
    totalRecords = 0,
    records = [],
    displayRecords = [],
    recPerPage = 10,
    page = 1,
    totalPages = 0;
var timer;
var items = [];
var usuario = '';
var timer;

$(document).ready(function() {
    usuario = JSON.parse(localStorage.getItem('distrifarma_test_user'));
    if (usuario.ingreso == true) {
        $('#pasaporte').hide();
        if (usuario.df_tipo_usuario == 'Administrador') {
            $('#Administrador').show('');
            $('#Supervisor').hide('');
            $('#Ventas').hide('');
        } else if (usuario.df_tipo_usuario == 'Supervisor') {
            $('#Administrador').hide('');
            $('#Supervisor').show('');
            $('#Ventas').hide('');
        } else if (usuario.df_tipo_usuario == 'Ventas') {
            $('#Administrador').hide('');
            $('#Supervisor').hide('');
            $('#Ventas').show('');
        }
    } else {
        window.location.href = "login.php";
    }
    load();
});

function load() {
    $('#guardar_proveedor').attr('disabled', false);
    $('#modificar_proveedor').attr('disabled', false);
    clearTimeout(timer);
    timer = setTimeout(function() {
        cargar();
    }, 1000);
}

function apply_pagination() {
    displayRecordsIndex = Math.max(page - 1, 0) * recPerPage;
    endRec = (displayRecordsIndex) + recPerPage;
    displayRecords = records.slice(displayRecordsIndex, endRec);
    generate_table();
    $pagination.twbsPagination({
        totalPages: totalPages,
        visiblePages: 6,
        onPageClick: function(event, page) {
            displayRecordsIndex = Math.max(page - 1, 0) * recPerPage;
            endRec = (displayRecordsIndex) + recPerPage;
            displayRecords = records.slice(displayRecordsIndex, endRec);
            generate_table();
        }
    });
}

function generate_table() {
    $('#resultados .table-responsive table tbody').empty();
    $.each(displayRecords, function(index, row) {
        $('#resultados .table-responsive table tbody').append('<tr> <td>' + row.df_codigo_proveedor + '</td> <td>' + row.df_documento_prov + '</td> <td>' + row.df_nombre_empresa + '</td> <td>' + row.df_tlf_empresa + '</td> <td>' + row.df_nombre_contacto + '</td> <td>' + row.df_tlf_contacto + '</td> <td><span class="pull-right"><a href="#" class="btn btn-default" title="Detallar" onclick="detallar(`' + row.df_codigo_proveedor + '`, `' + row.df_documento_prov + '` )"><i class="glyphicon glyphicon-edit"></i></a></span></td> </tr>');
    });       
}

function cargar() {
    var q = $('#q').val();
    $('#resultados .table-responsive table tbody').html('Cargando...');
    $.post(url + 'proveedor/getAll.php', JSON.stringify({ df_nombre_empresa: q }), function(data, status, hrx) {
        if (data.data.length > 0) {
            /* data.data.sort(function (a, b){
                return (b.df_id_proveedor - a.df_id_proveedor)
              }); */
            records = data.data; 
            totalRecords = records.length;
            totalPages = Math.ceil(totalRecords / recPerPage);
            apply_pagination();
        } else {
            $('#resultados .table-responsive table tbody').html('No se encontró ningún resultado');
        }
    });
}

$('#guardar_proveedor').submit(function(event) {
    $('#guardar_proveedor').attr('disabled', true);
    event.preventDefault();
    on();
    var data = {
        df_codigo_proveedor: "",
        df_nombre_empresa: $('#nombre').val(),
        df_tlf_empresa: $('#telefono').val(),
        df_direccion_empresa: $('#direccion').val(),
        df_correo_prov: $('#Correo').val(),
        df_pag_web: $('#Pagweb').val(),
        df_nombre_contacto: $('#nombre_contacto').val(),
        df_tlf_contacto: $('#telefono_contacto').val(),
        df_documento_prov: $('#ruc').val()
    };
    insertar(data);
});

function insertar(proveedor) {
    var codigo = "";
    $.get(url + 'proveedor/getIdMax.php', function(data) {
        if (data.data[0].df_id_proveedor == null) {
            codigo = 'PROV-' + '001';
        } else if (data.data[0].df_id_proveedor > 0 && data.data[0].df_id_proveedor < 10) {
            codigo = 'PROV-' + '00' + ((data.data[0].df_id_proveedor * 1) + 1);
        } else if (data.data[0].df_id_proveedor > 9 && data.data[0].df_id_proveedor < 100) {
            codigo = 'PROV-' + '0' + ((data.data[0].df_id_proveedor * 1) + 1);
        } else if (data.data[0].df_id_proveedor > 99 && data.data[0].df_id_proveedor < 1000) {
            codigo = 'PROV-' + ((data.data[0].df_id_proveedor * 1) + 1);
        }
        proveedor.df_codigo_proveedor = codigo;                
        var urlCompleta = url + 'proveedor/insert.php';
        console.log('proveedor', proveedor);
        $.post(urlCompleta, JSON.stringify(proveedor), function(datos, status, xhr) {
            if (datos == false) {
                off();
                alertar('danger', '¡Error!', 'Por favor intente de nuevo, si persiste, contacte al administrador del sistema');
                $('#guardar_proveedor').attr('disabled', false);
            } else {
                off();
                alertar('success', '¡Éxito!', '¡Proveedor insertado exitosamente!');
            }
            $('#nombre').val("");
            $('#telefono').val("");
            $('#direccion').val('');
            $('#nombre_contacto').val('');
            $('#telefono_contacto').val('');
            $('#ruc').val('');
            $('#nuevoProveedor').modal('hide');
            $('#Correo').val('');
            $('#Pagweb').val('');
            load();
        });
    });
}

function detallar(codigo, documento) {
    var urlCompleta = url + 'proveedor/getById.php';
    $.post(urlCompleta, JSON.stringify({
        df_codigo_proveedor: codigo,
        df_documento_prov: documento
    }), function(data, status, xhr) {
        var web = '';
        var webBD = data.data[0].df_pag_web;
        if (webBD != '' || webBD != null || webBD != 'null') {
            web = webBD;
        } else {
            web = 'http://';
        }
        $('#editarProveedor').modal('show');
        $('#editNombre').val(data.data[0].df_nombre_empresa);
        $('#editTelefono').val(data.data[0].df_tlf_empresa);
        $('#editDireccion').val(data.data[0].df_direccion_empresa);
        $('#editNombre_contacto').val(data.data[0].df_nombre_contacto);
        $('#editTelefono_contacto').val(data.data[0].df_tlf_contacto);
        $('#editRuc').val(data.data[0].df_documento_prov);
        $('#codigo').val(data.data[0].df_codigo_proveedor);
        $('#editCorreo').val(data.data[0].df_correo_prov);
        $('#editPagweb').val(web);
        $('#id').val(data.data[0].df_id_proveedor);
    });
}

$('#modificar_proveedor').submit(function(event) {
    $('#modificar_proveedor').attr('disabled', true);
    event.preventDefault();
    on();
    var data = {
        df_codigo_proveedor: $('#codigo').val(),
        df_nombre_empresa: $('#editNombre').val(),
        df_tlf_empresa: $('#editTelefono').val(),
        df_direccion_empresa: $('#editDireccion').val(),
        df_correo_prov: $('#editCorreo').val(),
        df_pag_web: $('#editPagweb').val(),
        df_nombre_contacto: $('#editNombre_contacto').val(),
        df_tlf_contacto: $('#editTelefono_contacto').val(),
        df_documento_prov: $('#editRuc').val(),
        df_id_proveedor: $('#id').val()
    };
    modificar(data);
});

function modificar(proveedor) {
    var urlCompleta = url + 'proveedor/update.php';
    $.post(urlCompleta, JSON.stringify(proveedor), function(data, status, xhr) {
        if (data == true) {
            off();
            alertar('success', '¡Éxito!', '¡Proveedor modificado exitosamente!');
        } else {
            off();
            alertar('danger', '¡Error!', 'Por favor intente de nuevo, si persiste, contacte al administrador del sistema');
            $('#modificar_proveedor').attr('disabled', false);
        }
        $('#editarProveedor').modal('hide');
        load();
    });
}

function consultarProveedor() {
    $('#resultados .table-responsive table tbody').html('');
    var urlCompleta = url + 'proveedor/getById.php';
    var q = $('#q').val();
    $.post(urlCompleta, JSON.stringify({
        df_codigo_proveedor: q,
        df_documento_prov: q
    }), function(data, status, xhr) {
        $.each(data.data, function(index, row) {
            $('#resultados .table-responsive table tbody').append('<tr> <td>' + row.df_codigo_proveedor + '</td> <td>' + row.df_documento_prov + '</td> <td>' + row.df_nombre_empresa + '</td> <td>' + row.df_tlf_empresa + '</td> <td>' + row.df_nombre_contacto + '</td> <td>' + row.df_tlf_contacto + '</td> <td><span class="pull-right"><a href="#" class="btn btn-default" title="Detallar" onclick="detallar(`' + row.df_codigo_proveedor + '`, `' + row.df_documento_prov + '` )"><i class="glyphicon glyphicon-edit"></i></a></span></td> </tr>');
        })
    });
}

function nuevoProveedor() {
    $('#span_ruc').hide();
}

function consultarRUC() {
    clearTimeout(timer);
    timer = setTimeout(function() {
        var urlCompleta = url + 'proveedor/getByRuc.php';
        $.post(urlCompleta, JSON.stringify({ df_documento_prov: $('#ruc').val() }), function(response) {
            if (response.data.length > 0) {
                $('#span_ruc').show('show');
                $('#guardar').prop('disabled', true);
            } else {
                $('#span_ruc').hide('slow');
                $('#guardar').prop('disabled', false);
            }
        });
    }, 1000);
}

function exportar() {
    on();
    var urlCompleta = url + 'proveedor/getAll.php';
    var q = $('#q').val();
    $.post(urlCompleta, JSON.stringify({ df_nombre_empresa: q }), function(response) {
        console.log('clientes', response.data);
        var exportar = [{
            df_codigo_proveedor: "Código", 
            df_documento_prov: "RUC",
            df_nombre_empresa: "Proveedor", 
            df_tlf_empresa: "Teléfono Empresa", 
            df_direccion_empresa: "Dirección", 
            df_correo_prov: "Email", 
            df_pag_web: "Pág Web",
            df_nombre_contacto: "Nombre Contacto", 
            df_tlf_contacto: "Teléfono Contacto"
        }];
        if (response.data.length > 0) {
            $.each(response.data, function(index, row) {
                exportar.push({
                    df_codigo_proveedor: row.df_codigo_proveedor,
                    df_documento_prov: row.df_documento_prov,
                    df_nombre_empresa: row.df_nombre_empresa,
                    df_tlf_empresa: row.df_tlf_empresa,
                    df_direccion_empresa: row.df_direccion_empresa,
                    df_correo_prov: row.df_correo_prov,
                    df_pag_web: row.df_pag_web,
                    df_nombre_contacto: row.df_nombre_contacto,
                    df_tlf_contacto: row.df_tlf_contacto,
                })
            });
            var form = $(document.createElement('form'));
            $(form).attr("action", "excel/exportar.php");
            $(form).attr("method", "POST");
            $(form).css("display", "none");
            $(form).attr("target", "_blank");
            var input = $("<input>")
                .attr("type", "text")
                .attr("name", "data")
                .val(JSON.stringify(exportar));
            $(form).append($(input));
            input = $("<input>")
                .attr("type", "text")
                .attr("name", "documento")
                .val('proveedores');
            $(form).append($(input));
            form.appendTo(document.body);
            $(form).submit();
        } else {
            alertar('warning', '¡Alerta!', 'No existe información para exportar');
        }
        off();
    });
}