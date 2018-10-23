var $pagination = $('#pagination'),
    totalRecords = 0,
    records = [],
    displayRecords = [],
    recPerPage = 10,
    page = 1,
    totalPages = 0;
var timer;
var items = [];
var bancos = [];
var detalles = [];

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
        window.location.href = 'login.php';
    }
    load();
});

function load() {
    $('#guardar_banco').attr('disabled', false);
    bancos = [];
    records = [];
    var q = $('#q').val();
    $('#resultados .table-responsive table tbody').html('Cargando...');
    var urlCompleta = url + 'perfil_banco/getAll.php';
    $.post(urlCompleta, JSON.stringify({ dp_descripcion_per_ban: q, dp_banco_per_ban: q }), function(response) {
        if (response.data.length > 0) {
            bancos = response.data;
            clearTimeout(timer);
            timer = setTimeout(function() {
                /* bancos.sort(function(a, b) {
                    return (b.df_id_banco - a.df_id_banco)
                }); */
                records = bancos;
                totalRecords = records.length;
                totalPages = Math.ceil(totalRecords / recPerPage);
                apply_pagination();
            }, 0);
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
    $.each(displayRecords, function(index, row) {
        var tr;
        tr = $('<tr/>');
        tr.append("<td class='text-left'>" + row.dp_descripcion_per_ban + "</td>");
        tr.append("<td class='text-left'>" + row.dp_banco_per_ban + "</td>");
        tr.append("<td class='text-left'>" + row.dp_cuenta_per_ban + "</td>");
        tr.append("<td class='text-left'>" + row.dp_tipo_cuenta_per_ban + "</td>");
        tr.append("<td class='text-left'>" + row.dp_tipo_per_ban + "</td>");
        tr.append("<td><button class='btn btn-default pull-right' title='Modificar' onclick='detallar(" + row.dp_id_perfil_ban + ")'><i class='glyphicon glyphicon-edit'></i></button></td>");
        $('#resultados .table-responsive table tbody').append(tr);
    })
}

function getUsuario(row) {
    var urlCompleta = url + 'usuario/getById.php';
    $.post(urlCompleta, JSON.stringify({ df_id_usuario: row.df_usuario_id_banco }), function(response) {
        row.df_usuario_usuario = response.data[0].df_usuario_usuario;
        bancos.push(row);
    });
}

function nuevoBanco() {
    $('#nuevoBanco').modal('show');
    $('#usuario').html('');
    $('#usuario').append('<option value="' + usuario.df_id_usuario + '">' + usuario.df_usuario_usuario + '</option>');
    $('#banco').val('');
    $('#descripcion').val('');
    $('#cuenta').val('');
    $('#tipo-cuenta').val('null');
    $('#tipo').val('null');
}

$('#guardar_banco').submit(function(event) {
    on();
    event.preventDefault();
    if ($('#tipo-cuenta').val() == 'null' || $('#tipo').val() == 'null') {
        off();
        alertar('warning', '¡Advertencia!', 'Todos los campos son obligtorios');
    } else {
        currentdate = new Date();
        var datetime = currentdate.getFullYear() + "-" +
            (currentdate.getMonth() + 1) + "-" +
            currentdate.getDate() + " " +
            currentdate.getHours() + ":" +
            currentdate.getMinutes() + ":" +
            currentdate.getSeconds();
        var banco = {
            dp_descripcion_per_ban: $('#descripcion').val(),
            dp_banco_per_ban: $('#banco').val(),
            dp_cuenta_per_ban: $('#cuenta').val(),
            dp_tipo_cuenta_per_ban: $('#tipo-cuenta').val(),
            dp_tipo_per_ban: $('#tipo').val(),
            dp_fecha_creacion_per_ban: datetime,
            dp_creadoby_per_ban: $('#usuario').val()
        };
        insert(banco);
    }
});

function insert(banco) {
    var urlCompleta = url + 'perfil_banco/insert.php';
    $.post(urlCompleta, JSON.stringify(banco), function(response) {
        if (response != false) {
            alertar('success', '¡Éxito!', 'Perfil de Banco registrado exitosamente');
        } else {
            alertar('danger', '¡Error!', 'Error al insertar, verifique que todo está bien e intente de nuevo');
        }
        off();
        $('#nuevoBanco').modal('hide');
        load();
    });
}

function detallar(id) {
    var urlCompleta = url + 'perfil_banco/getById.php';
    $.post(urlCompleta, JSON.stringify({ dp_id_perfil_ban: id }), function(data, status, hrx) {
        console.log(data);
        $('#editUsuario').html('');
        $('#editUsuario').append('<option value="' + usuario.df_id_usuario + '">' + usuario.df_usuario_usuario + '</option>');
        $('#editBanco').val(data.data[0].dp_banco_per_ban);
        $('#editDescripcion').val(data.data[0].dp_descripcion_per_ban);
        $('#editCuenta').val(data.data[0].dp_cuenta_per_ban);
        $('#editTipo-cuenta').val(data.data[0].dp_tipo_cuenta_per_ban);
        $('#editTipo').val(data.data[0].dp_tipo_per_ban);
        $('#id').val(data.data[0].dp_id_perfil_ban);
        $('#editaBanco').modal('show');
    });
}

$('#editar_banco').submit(function(event) {
    on();
    $('#editar_banco').attr('disabled', true);
    event.preventDefault();
    if ($('#editTipo-cuenta').val() == 'null' || $('#editTipo').val() == 'null') {
        off();
        alertar('warning', '¡Advertencia!', 'Todos los campos son obligtorios');
    } else {
        currentdate = new Date();
        var datetime = currentdate.getFullYear() + "-" +
            (currentdate.getMonth() + 1) + "-" +
            currentdate.getDate() + " " +
            currentdate.getHours() + ":" +
            currentdate.getMinutes() + ":" +
            currentdate.getSeconds();
        var edita_banco = {
            dp_descripcion_per_ban: $('#editDescripcion').val(),
            dp_banco_per_ban: $('#editBanco').val(),
            dp_cuenta_per_ban: $('#editCuenta').val(),
            dp_tipo_cuenta_per_ban: $('#editTipo-cuenta').val(),
            dp_tipo_per_ban: $('#editTipo').val(),
            dp_fecha_modifica_per_ban: datetime,
            dp_modificadoby_per_ban: $('#editUsuario').val(),
            dp_id_perfil_ban: $('#id').val()
        }
        editar(edita_banco);
    }
});

function editar(banco) {
    var urlCompleta = url + 'perfil_banco/update.php';
    $.post(urlCompleta, JSON.stringify(banco), function(response) {
        if (response != false) {
            alertar('success', '¡Éxito!', 'Perfil de Banco modificado exitosamente');
        } else {
            alertar('danger', '¡Error!', 'Error al modificar, verifique que todo está bien e intente de nuevo');
        }
        off();
        $('#editaBanco').modal('hide');
        load();
    });
}

function exportar() {
    on();
    var q = $('#q').val();
    var urlCompleta = url + 'perfil_banco/getAll.php';
    $.post(urlCompleta, JSON.stringify({ dp_descripcion_per_ban: q, dp_banco_per_ban: q }), function(response) {
        console.log('banco', response.data);
        var exportar = [{
            dp_descripcion_per_ban: "Alias",
            dp_banco_per_ban: "Banco",
            dp_cuenta_per_ban: "#Cuenta",
            dp_tipo_cuenta_per_ban: "Tipo Cuenta",
            dp_tipo_per_ban: "Tipo"
        }];
        if (response.data.length > 0) {
            $.each(response.data, function(index, row) {
                exportar.push({
                    dp_descripcion_per_ban: row.dp_descripcion_per_ban,
                    dp_banco_per_ban: row.dp_banco_per_ban,
                    dp_cuenta_per_ban: row.dp_cuenta_per_ban,
                    dp_tipo_cuenta_per_ban: row.dp_tipo_cuenta_per_ban,
                    dp_tipo_per_ban: row.dp_tipo_per_ban
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
                .val('bancos');
            $(form).append($(input));
            form.appendTo(document.body);
            $(form).submit();
        } else {
            alertar('warning', '¡Alerta!', 'No existe información para exportar');
        }
        off();
    });
}