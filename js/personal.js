var timer;
var $pagination = $('#pagination'),
    totalRecords = 0,
    records = [],
    displayRecords = [],
    recPerPage = 10,
    page = 1,
    totalPages = 0;

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
    clearTimeout(timer);
    timer = setTimeout(function() {
        cargar();
    }, 0);
}

function cargar() {
    $('#resultados .table-responsive table tbody').html('Cargando...');
    var urlCompleta = url + 'personal/getAll.php';
    var q = $('#q').val();
    $.post(urlCompleta, JSON.stringify({ df_nombre_per: q }), function(data, status, hrx) {
        console.log('personal', data);
        if (data.data.length > 0) {
            $('#resultados .table-responsive table tbody').html('');
            records = data.data;
            totalRecords = records.length;
            totalPages = Math.ceil(totalRecords / recPerPage);
            apply_pagination();
        } else {
            $('#resultados .table-responsive table tbody').html('No se encontró ningún resultado');
        }
    });
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
    console.log('display records', displayRecords);
    var tr;
    $.each(displayRecords, function(index, row) {
        var tr = $('<tr/>');
        tr.append('<td>' + row.df_documento_per + '</td><td>' + row.df_nombre_per + ' ' + row.df_apellido_per + '</td>');
        tr.append('<td>' + row.df_cargo_per + '</td>');
        tr.append('<td>' + row.df_fecha_ingreso + '</td>');
        tr.append('<td>' + row.df_contrato_per + '</td>');
        if (row.df_activo_per == 1) {
            tr.append('<td><div class="input_wrapper"><input type="checkbox" class="switch_4" checked onclick="cambiarEsttus(`' + row.df_id_personal + '`, 0)"><svg class="is_checked" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 426.67 426.67"><path d="M153.504 366.84c-8.657 0-17.323-3.303-23.927-9.912L9.914 237.265c-13.218-13.218-13.218-34.645 0-47.863 13.218-13.218 34.645-13.218 47.863 0l95.727 95.727 215.39-215.387c13.218-13.214 34.65-13.218 47.86 0 13.22 13.218 13.22 34.65 0 47.863L177.435 356.928c-6.61 6.605-15.27 9.91-23.932 9.91z"/></svg><svg class="is_unchecked" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 212.982 212.982"><path d="M131.804 106.49l75.936-75.935c6.99-6.99 6.99-18.323 0-25.312-6.99-6.99-18.322-6.99-25.312 0L106.49 81.18 30.555 5.242c-6.99-6.99-18.322-6.99-25.312 0-6.99 6.99-6.99 18.323 0 25.312L81.18 106.49 5.24 182.427c-6.99 6.99-6.99 18.323 0 25.312 6.99 6.99 18.322 6.99 25.312 0L106.49 131.8l75.938 75.937c6.99 6.99 18.322 6.99 25.312 0 6.99-6.99 6.99-18.323 0-25.313l-75.936-75.936z" fill-rule="evenodd" clip-rule="evenodd"/></svg></div></td>');
        } else if (row.df_activo_per == 0) {
            tr.append('<td><div class="input_wrapper"><input type="checkbox" class="switch_4" onclick="cambiarEsttus(`' + row.df_id_personal + '`, 1)"><svg class="is_checked" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 426.67 426.67"><path d="M153.504 366.84c-8.657 0-17.323-3.303-23.927-9.912L9.914 237.265c-13.218-13.218-13.218-34.645 0-47.863 13.218-13.218 34.645-13.218 47.863 0l95.727 95.727 215.39-215.387c13.218-13.214 34.65-13.218 47.86 0 13.22 13.218 13.22 34.65 0 47.863L177.435 356.928c-6.61 6.605-15.27 9.91-23.932 9.91z"/></svg><svg class="is_unchecked" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 212.982 212.982"><path d="M131.804 106.49l75.936-75.935c6.99-6.99 6.99-18.323 0-25.312-6.99-6.99-18.322-6.99-25.312 0L106.49 81.18 30.555 5.242c-6.99-6.99-18.322-6.99-25.312 0-6.99 6.99-6.99 18.323 0 25.312L81.18 106.49 5.24 182.427c-6.99 6.99-6.99 18.323 0 25.312 6.99 6.99 18.322 6.99 25.312 0L106.49 131.8l75.938 75.937c6.99 6.99 18.322 6.99 25.312 0 6.99-6.99 6.99-18.323 0-25.313l-75.936-75.936z" fill-rule="evenodd" clip-rule="evenodd"/></svg></div></td>');
        }
        tr.append('<td><span class="pull-right"><a href="#" class="btn btn-default" title="Detallar" onclick="detallar(`' + row.df_id_personal + '`)"><i class="glyphicon glyphicon-edit"></i> </a></span></td>');
        $('#resultados .table-responsive table tbody').append(tr);
    });
}

function detallar(documento) {
    var urlCompleta = url + 'personal/getById.php';
    $.post(urlCompleta, JSON.stringify({ df_id_personal: documento }), function(data, status, hrx) {
        var detalle = data.data[0];
        if (detalle.df_usuario_detper == null) {
            localStorage.setItem('dypromedic_personal_editar', JSON.stringify(detalle));
            window.location.href = "editar_personal";
        } else {
            getUsuarioById(detalle);
        }
    });
}

function getUsuarioById(personal) {
    var urlCompleta = url + 'usuario/getById.php';
    $.post(urlCompleta, JSON.stringify({ df_id_usuario: personal.df_usuario_detper }), function(data, status, hrx) {
        console.log('usuario', data);
        var user = data.data[0];
        personal.df_id_usuario = user.df_id_usuario;
        personal.df_usuario_usuario = user.df_usuario_usuario;
        personal.df_personal_cod = user.df_personal_cod;
        personal.df_clave_usuario = user.df_clave_usuario;
        personal.df_activo = user.df_activo;
        personal.df_correo = user.df_correo;
        personal.df_tipo_usuario = user.df_tipo_usuario;
        localStorage.setItem('dypromedic_personal_editar', JSON.stringify(personal));
        window.location.href = "editar_personal";
    });
}

function cambiarEsttus(id, estatus) {
    on();
    var urlCompleta = url + 'personal/updateEdoPersonal.php';
    $.post(urlCompleta, JSON.stringify({ df_activo_per: estatus, df_id_personal: id }), function(response) {
        off();
        if (response == true) {
            alertar('success', '¡Éxito!', 'Estado personal modificado exitosamente');
        } else {
            alertar('danger', '¡Error!', 'Por favor, verifique su conexión a internet e intente nuevamente!');
        }
        cargar();
    });
}

function exportar() {
    on();
    var urlCompleta = url + 'personal/getAll.php';
    var q = $('#q').val();
    $.post(urlCompleta, JSON.stringify({ df_nombre_per: q }), function(response) {
        var exportar = [{
            codigo: "Código",
            tipoDocumento: "Tipo Documento",
            documento: "Documento",
            nombre: "Nombre",
            apellido: "Apellido",
            Cargo: "Cargo",
            fechaIngreso: "Fecha de Ingreso",
            fechaNaicmiento: "Fecha de Nacimiento",
            tipoContrato: "Tipo Contrato",
            estatus: "Estado",
            telefono: "Teléfono",
            celular: "Celular",
            correo: "Correo",
            direccion: "Dirección",
            nombreContacto: "Nombre Contacto",
            tlfContacto: "Teléfono Contacto"
        }];
        if (response.data.length > 0) {
            $.each(response.data, function(index, row) {
                var estado;
                if (row.df_activo_per == 1) {
                    estado = 'Activo';
                } else {
                    estado = 'Inactivo';
                }
                exportar.push({
                    codigo: row.df_codigo_personal,
                    tipoDocumento: row.df_tipo_documento_per,
                    documento: row.df_documento_per,
                    nombre: row.df_nombre_per,
                    apellido: row.df_apellido_per,
                    Cargo: row.df_cargo_per,
                    fechaIngreso: row.df_fecha_ingreso,
                    fechaNaicmiento: row.df_fecha_nac_per,
                    tipoContrato: row.df_contrato_per,
                    estatus: estado,
                    telefono: row.df_telefono_per,
                    celular: row.df_celular_per,
                    correo: row.df_correo_per,
                    direccion: row.df_direccion_per,
                    nombreContacto: row.df_nombre_contacto,
                    tlfContacto: row.df_telefono_contacto
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
                .val('personal');
            $(form).append($(input));
            form.appendTo(document.body);
            $(form).submit();
        } else {
            alertar('warning', '¡Alerta!', 'No existe información para exportar');
        }
        off();
    });
}