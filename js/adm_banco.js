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
    $('#resultados .table-responsive table tbody').html('Cargando...');
    var urlCompleta = url + 'perfil_banco/getAll.php';
    $.get(urlCompleta, function(response) {
        if (response.data.length > 0) {
            bancos = response.data;
            console.log('Perfiles de Bancos ', bancos);
            clearTimeout(timer);
            timer = setTimeout(function() {
                /* bancos.sort(function(a, b) {
                    return (b.df_id_banco - a.df_id_banco)
                }); */
                records = bancos;
                totalRecords = records.length;
                totalPages = Math.ceil(totalRecords / recPerPage);
                apply_pagination();
            }, 1000);
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
        tr.append("<td><button class='btn btn-default pull-right' title='Modificar' onclick='detallar(" + row.dp_id_perfil_ban +")'><i class='glyphicon glyphicon-edit'></i></button></td>");
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
    $('#guardar_banco').attr('disabled', true);
    event.preventDefault();
    if ($('#tipo-cuenta').val() == 'null' || $('#tipo').val() == 'null') {
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
        console.log('insert banco ', banco);
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
        $('#nuevoBanco').modal('hide');
        load();
    });
}

function detallar(id) {
    var urlCompleta = url + 'perfil_banco/getById.php';
    $.post(urlCompleta, JSON.stringify({ dp_id_perfil_ban: id }), function(data, status, hrx) {
        console.log(data);
        $('#editaBanco').modal('show');
        $('#usuario').html('');
        $('#usuario').append('<option value="' + usuario.df_id_usuario + '">' + usuario.df_usuario_usuario + '</option>');
        $('#banco').val();
        $('#descripcion').val('');
        $('#cuenta').val('');
        $('#tipo-cuenta').val('null');
        $('#tipo').val('null');
    });
}