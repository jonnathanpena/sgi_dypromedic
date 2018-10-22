var personalEditar;
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
    var personal = JSON.parse(localStorage.getItem('dypromedic_personal_editar'));
    personalEditar = personal;
    console.log('personal ', personal);
    if (personal.df_cargo_per == 'Instrumentista' || personal.df_cargo_per == 'Doctor') {
        $('#form_modificar_personal').hide('slow');
        $('#form_modificar_externo').show('slow');
        $('#profesion').val(personal.df_cargo_per);
        $('#nombre-profesion').val(personal.df_nombre_per);
        $('#apellido-profesion').val(personal.df_apellido_per);
        $('#id').val(personal.df_id_personal);
    } else {
        $('#form_modificar_personal').show('slow');
        $('#form_modificar_externo').hide('slow');
        $('#tipo_documento').val(personal.df_tipo_documento_per);
        $('#id_per').val(personal.df_id_personal);
        $('#documento').val(personal.df_documento_per);
        $('#nombre').val(personal.df_nombre_per);
        $('#apellido').val(personal.df_apellido_per);
        $('#email').val(personal.df_correo_per);
        $('#fecha_nac').val(personal.df_fecha_nac_per);
        $('#direccion').val(personal.df_direccion_per);
        $('#fecha_ingreso').val(personal.df_fecha_ingreso);
        $('#contrato').val(personal.df_contrato_per);
        $('#cargo').val(personal.df_cargo_per);
        $('#sueldo').val(personal.df_sueldo_detper);
        $('#codigo').val(personal.df_codigo_personal);
        $('#usuario_id').val(personal.df_usuario_detper);
        $('#tlf').val(personal.df_telefono_per);
        $('#celular').val(personal.df_celular_per);
        $('#nombre_contacto').val(personal.df_nombre_contacto);
        $('#tlf-contacto').val(personal.df_telefono_contacto);
    }
    if (personal.df_usuario_detper != null) {
        $('#usuario').val(personal.df_usuario_usuario);
        $('#clave').val(personal.df_clave_usuario);
        $('#perfil').val(personal.df_tipo_usuario);
    } else {
        $('#usuario').hide();
        $('#label_usuario').hide();
        $('#clave').hide();
        $('#label_perfil').hide();
        $('#perfil').hide();
    }
}

$('#form_modificar_personal').submit(function(event) {
    on();
    event.preventDefault();
    var currentdate = new Date();
    var datetime = currentdate.getFullYear() + "-" +
        (currentdate.getMonth() + 1) + "-" +
        currentdate.getDate() + " " +
        currentdate.getHours() + ":" +
        currentdate.getMinutes() + ":" +
        currentdate.getSeconds();
    var personal = {
        df_tipo_documento_per: $('#tipo_documento').val(),
        df_documento_per: $('#documento').val(),
        df_nombre_per: $('#nombre').val(),
        df_apellido_per: $('#apellido').val(),
        df_cargo_per: $('#cargo').val(),
        df_fecha_ingreso: $('#fecha_ingreso').val(),
        df_correo_per: $('#email').val(),
        df_codigo_personal: $('#codigo').val(),
        df_telefono_per: $('#tlf').val(),
        df_celular_per: $('#celular').val(),
        df_fecha_nac_per: $('#fecha_nac').val(),
        df_direccion_per: $('#direccion').val(),
        df_contrato_per: $('#contrato').val(),
        df_nombre_contacto: $('#nombre_contacto').val(),
        df_telefono_contacto: $('#tlf-contacto').val(),
        df_activo_per: personalEditar.df_activo,
        df_id_personal: personalEditar.df_id_personal
    };
    var detalle = {
        df_sueldo_detper: $('#sueldo').val(),
        df_bono_detper: 0,
        df_anticipo_detper: 0,
        df_descuento_detper: 0,
        df_decimos_detper: 0,
        df_vacaciones_detper: 0,
        df_tabala_comision_detper: 1,
        df_comisiones_detper: 0,
        df_personal_cod_detper: personal.df_id_personal,
        df_usuario_detper: $('#usuario_id').val(),
        df_fecha_proceso: datetime
    };
    if (personal.df_tipo_documento_per == 'null' || personal.df_contrato_per == 'null' || personal.df_cargo_per == 'null') {
        off();
        alertar('warning', '¡Alerta!', 'Los campos obligatorios no pueden estár vacíos');
    } else {
        updatePersonal(personal, detalle);
    }
});

function updatePersonal(personal, detalle) {
    var urlCompleta = url + 'personal/updatePersonal.php';
    $.post(urlCompleta, JSON.stringify(personal), function(data, status, hrx) {
        if (data == true) {
            insertDetalle(detalle);
        } else {
            off();
            alertar('danger', '¡Error!', 'Algo malo ocurrió, verifique la información e intente nuevamente');
        }
    });
}

function insertDetalle(detalle) {
    var urlCompleta = url + 'personal/insertDetPersonal.php';
    $.post(urlCompleta, JSON.stringify(detalle), function(data, status, hrx) {
        if (data == false) {
            off();
            alertar('danger', '¡Error!', 'Algo malo ocurrió, verifique la información e intente nuevamente');
        } else {
            var per = JSON.parse(localStorage.getItem('dypromedic_personal_editar'));
            console.log('per ', per);
            if (per.df_usuario_detper != null) {
                crearUsuario();
                alertar('success', '¡Éxito!', 'Personal modificado exitosamente');
            } else {
                alertar('success', '¡Éxito!', 'Personal modificado exitosamente');
                off();
            }
        }
    });
}

function crearUsuario() {
    var perfil = '';
    if ($('#cargo').val() == 'Administrador' || $('#cargo').val() == 'Contador') {
        perfil = 'Administrador';
    } else if ($('#cargo').val() == 'Repartidor' || $('#cargo').val() == 'Vendedor') {
        perfil = 'Ventas';
    } else if ($('#cargo').val() == 'Secretaria' || $('#cargo').val() == 'Supervisor') {
        perfil = 'Supervisor';
    }
    var user = {
        df_usuario_usuario: $('#usuario').val(),
        df_tipo_usuario: perfil,
        df_id_usuario: personalEditar.df_id_usuario
    };
    updateUsuario(user);
}

function updateUsuario(user) {
    var urlCompleta = url + 'personal/updateUsuarioPersonal.php';
    $.post(urlCompleta, JSON.stringify(user), function(response) {
        if (response == true) {
            alertar('success', '¡Éxito!', 'Usuario modificado exitosamente');
        } else {
            alertar('danger', '¡Error!', 'Algo malo ocurrió, verifique la información e intente nuevamente');
        }
        off();
    })
}

$('#form_modificar_externo').submit(function(event) {
    on();
    event.preventDefault();
    if ($('#profesion').val() == 'null') {
        off();
        alertar('warning', '¡Alerta!', 'Profesion es requerida');
    } else {
        var personal = {
            df_tipo_documento_per: null,
            df_nombre_per: $('#nombre-profesion').val(),
            df_apellido_per: $('#apellido-profesion').val(),
            df_cargo_per: $('#profesion').val(),
            df_fecha_ingreso: personalEditar.df_fecha_ingreso,
            df_documento_per: null,
            df_correo_per: null,
            df_codigo_personal: personalEditar.df_codigo_personal,
            df_telefono_per: null,
            df_celular_per: null,
            df_fecha_nac_per: null,
            df_direccion_per: null,
            df_contrato_per: 'Externo',
            df_nombre_contacto: null,
            df_telefono_contacto: null,
            df_activo_per: personalEditar.df_activo_per,
            df_id_personal: personalEditar.df_id_personal
        };
        updatePersonalExterno(personal);
    }
});

function updatePersonalExterno(personal) {
    var urlCompleta = url + 'personal/updatePersonal.php';
    $.post(urlCompleta, JSON.stringify(personal), function(response) {
        off();
        if (response == true) {
            alertar('success', '¡Éxito!', 'Personal modificado exitosamente');
        } else {
            alertar('danger', '¡Error!', 'Algo ocurrió mal, verifique la información, y por favor, vuelva a intentar');
        }
    });
}