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
    getAllBancos();    
    $('#resultados .table-responsive table tbody').html('Cargando...');
    var urlCompleta = url + 'banco/getAll.php';
    $.get(urlCompleta, function(response) {
        if (response.data.length > 0) {
            $('#saldo_banco').val('$' + (response.data[0].df_saldo_banco * 1).toFixed(2));
            saldo = response.data[0].df_saldo_banco * 1;
            libro = ($('#valor_libro').val() * 1) + saldo;
            $('#valor_libro').val(libro);
            console.log('valor inicial', libro);
            $.each(response.data, function(index, row) {
                getUsuario(row);
            })
            clearTimeout(timer);
            timer = setTimeout(function() {
                bancos.sort(function(a, b) {
                    return (b.df_id_banco - a.df_id_banco)
                });
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
        var f = row.df_fecha_banco.split(' ')[0];
        var time = row.df_fecha_banco.split(' ')[1];
        var dia = f.split('-')[2];
        var mes = f.split('-')[1];
        var ano = f.split('-')[0];
        var fecha = dia + '/' + mes + '/' + ano;
        tr = $('<tr/>');
        tr.append("<td>" + row.df_id_banco + "</td>");
        tr.append("<td>" + fecha + "</td>");
        tr.append("<td>" + row.df_usuario_usuario + "</td>");
        tr.append("<td>" + row.df_tipo_movimiento + "</td>");
        tr.append("<td>" + row.df_detalle_mov_banco + "</td>");
        tr.append("<td>" + row.df_num_documento_banco + "</td>");
        tr.append("<td class='text-center'> $ " + Number(row.df_monto_banco).toFixed(2) + "</td>");
        tr.append("<td class='text-center'> $ " + Number(row.df_saldo_banco).toFixed(2) + "</td>");
        //tr.append("<td><button class='btn btn-default pull-right' title='Detallar' onclick='detallar(" + row.df_id_gasto + ",`" + row.tipo + "`, `"+ row.df_movimiento +"`)'><i class='glyphicon glyphicon-edit'></i></button></td>");
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

function getAllBancos() {
    $('#banco').empty();
    $('#banco').append('<option value="null">Seleccione banco...</option>');;
    var urlCompleta = url + 'bancos/getAll.php';
    $.get(urlCompleta, function(response) {
        $.each(response.data, function(index, row) {
            $('#banco').append('<option value="' + row.id_bancos + '">' + row.nombre_bancos + '</option>');
        });
    });
}

function nuevoBanco() {
    $('#nuevoBanco').modal('show');
    $('#usuario').html('');
    $('#usuario').append('<option value="' + usuario.df_id_usuario + '">' + usuario.df_usuario_usuario + '</option>');
    $('#banco').val('null');
    $('#descripcion').val('');
    $('#cuenta').val('');
}

$('#guardar_banco').submit(function(event) {
    $('#guardar_banco').attr('disabled', true);
    event.preventDefault();
    if ($('#banco').val() == 'null') {
        alertar('warning', '¡Advertencia!', 'Todos los campos son obligtorios');
    } else {
        var f = $('#fecha_egreso').val();
        var datetime = f + ' 00:00:00';
        currentdate = new Date();
        var datelibro = currentdate.getFullYear() + "-" +
            (currentdate.getMonth() + 1) + "-" +
            currentdate.getDate() + " " +
            currentdate.getHours() + ":" +
            currentdate.getMinutes() + ":" +
            currentdate.getSeconds();

        var egreso = {
            df_fecha_banco: datetime,
            df_usuario_id_banco: $('#usuario_egreso').val(),
            df_tipo_movimiento: "Egreso",
            df_monto_banco: $('#valor_egreso').val(),
            df_saldo_banco: $('#saldo').val(),
            df_num_documento_banco: $('#documento_egreso').val(),
            df_detalle_mov_banco: $('#movimiento').val()
        };
        
        insertEgreso(egreso);
    }
});

function insertEgreso(egreso) {
    /* var urlCompleta = url + 'banco/insert.php';
    $.post(urlCompleta, JSON.stringify(egreso), function(response) {
        if (response != false) {
            alertar('success', '¡Éxito!', 'Egreso registrado exitosamente');
        } else {
            alertar('danger', '¡Error!', 'Error al insertar, verifique que todo está bien e intente de nuevo');
        } */
        $('#nuevoBanco').modal('hide');
        load();
    //});
}
