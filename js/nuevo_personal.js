var tipo_personal = '';

$(document).ready(function() {
    usuario = JSON.parse(localStorage.getItem('distrifarma_test_user'));
    $('.usuario').hide('slow');
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
    $('#span_documento').hide('slow');
    $('#form_nuevo_personal').show('slow');
    $('#form_nuevo_externo').hide('slow');
    $('#tituloE').hide('slow');
    $('#tituloP').show('slow');
    tipo_personal = 'P';
}

$('#toggle-usuario').change(function() {
    var valor = $(this).prop('checked');
    var cargo = $('#cargo').val();
    if (valor == true) {
        $('.usuario').show('slow');
        $('#es_usuario').val('1');
    } else {
        $('.usuario').hide('slow');
        $('#es_usuario').val('0');
    }
});

function nuevo_externo() {
    $('#tituloE').show('slow');
    $('#tituloP').hide('slow');
    $('#form_nuevo_personal').hide('slow');
    $('#form_nuevo_externo').show('slow');
    tipo_personal = 'E';
}

function nuevo_personal() {
    tipo_personal = 'P';
    $('#tituloE').hide('slow');
    $('#tituloP').show('slow');
    $('#form_nuevo_externo').hide('slow');
    $('#form_nuevo_personal').show('slow');
    $('#titulo').val('Nuevo Personal');
}

$('#form_nuevo_externo').submit(function(event) {
    on();
    event.preventDefault();
    var profesion = $('#profesion').val();
    if (profesion != 'null') {
        selectMaxID({
            df_tipo_documento_per: null,
            df_nombre_per: $('#nombre-profesion').val(),
            df_apellido_per: $('#apellido-profesion').val(),
            df_cargo_per: $('#profesion').val(),
            df_fecha_ingreso: '',
            df_documento_per: null,
            df_correo_per: null,
            df_codigo_personal: null,
            df_telefono_per: null,
            df_celular_per: null,
            df_fecha_nac_per: null,
            df_direccion_per: null,
            df_contrato_per: 'Externo',
            df_nombre_contacto: null,
            df_telefono_contacto: null
        });
    } else {
        off();
        alertar('warning', '¡Alerta!', 'Todos los campos son obligatorios');
    }
});

function sleccionaCargo() {
    if ($('#cargo').val() == 'Administrador') {
        $('#perfil').val('Administrador');
    } else if ($('#cargo').val() == 'Asistente') {
        $('#perfil').val('Supervisor');
    } else if ($('#cargo').val() == 'Contador') {
        $('#perfil').val('Supervisor');
    } else if ($('#cargo').val() == 'Vendedor') {
        $('#perfil').val('Vendedor');
    }
}


$('#form_nuevo_personal').submit(function(event) {
    //on();
    event.preventDefault();
    var tipo_documento = $('#tipo_documento').val();
    var cargo = $('#cargo').val();
    var contrato = $('#contrato').val();
    if (cargo != 'null' && contrato != 'null') {
        if (tipo_documento != 'null') {
            var es_usuario = $('#toggle-usuario').prop('checked');
            if (es_usuario == true) {
                var user = $('#usuario').val();
                var clave = $('#clave').val();
                var confirme = $('#confirme').val();
                var perfil;
                if (user != '') {
                    if (clave.length > 0) {
                        if (confirme.length > 0) {
                            if (confirme == clave) {
                                if (cargo == 'Administrador' || cargo == 'Contador') {
                                    $('#perfil').val('Administrador');
                                    perfil = $('#perfil').val();
                                    console.log('Cargo', $('#cargo').val());
                                    console.log('Perfil', $('#perfil').val());
                                } else if (cargo == 'Secretaria' || cargo == 'Supervisor') {
                                    $('#perfil').val('Supervisor');
                                    perfil = $('#perfil').val();
                                    console.log('Cargo', $('#cargo').val());
                                    console.log('Perfil', $('#perfil').val());
                                } else if (cargo == 'Vendedor') {
                                    $('#perfil').val('Ventas');
                                    perfil = $('#perfil').val();
                                    console.log('Cargo', $('#cargo').val());
                                    console.log('Perfil', $('#perfil').val());
                                }
                                if (perfil != 'null') {
                                    selectMaxID({
                                        df_tipo_documento_per: $('#tipo_documento').val(),
                                        df_nombre_per: $('#nombre').val(),
                                        df_apellido_per: $('#apellido').val(),
                                        df_cargo_per: $('#cargo').val(),
                                        df_fecha_ingreso: $('#fecha_ingreso').val(),
                                        df_documento_per: $('#documento').val(),
                                        df_correo_per: $('#email').val(),
                                        df_codigo_personal: '',
                                        df_telefono_per: $('#tlf').val(),
                                        df_celular_per: $('#celular').val(),
                                        df_fecha_nac_per: $('#fecha_nac').val(),
                                        df_direccion_per: $('#direccion').val(),
                                        df_contrato_per: $('#contrato').val(),
                                        df_nombre_contacto: $('#nombre_contacto').val(),
                                        df_telefono_contacto: $('#tlf-contacto').val()
                                    });
                                } else {
                                    off();
                                    alertar('warning', '¡Alerta!', 'Todos los campos son obligatorios');
                                }
                            } else {
                                off();
                                alertar('warning', '¡Alerta!', 'Las claves no coinciden');
                            }
                        } else {
                            off();
                            alertar('warning', '¡Alerta!', 'Todos los campos son obligatorios');
                        }
                    } else {
                        off();
                        alertar('warning', '¡Alerta!', 'Todos los campos son obligatorios');
                    }
                } else {
                    off();
                    alertar('warning', '¡Alerta!', 'Todos los campos son obligatorios');
                }
            } else {
                selectMaxID({
                    df_tipo_documento_per: $('#tipo_documento').val(),
                    df_nombre_per: $('#nombre').val(),
                    df_apellido_per: $('#apellido').val(),
                    df_cargo_per: $('#cargo').val(),
                    df_fecha_ingreso: $('#fecha_ingreso').val(),
                    df_documento_per: $('#documento').val(),
                    df_correo_per: $('#email').val(),
                    df_codigo_personal: '',
                    df_telefono_per: $('#tlf').val(),
                    df_celular_per: $('#celular').val(),
                    df_fecha_nac_per: $('#fecha_nac').val(),
                    df_direccion_per: $('#direccion').val(),
                    df_contrato_per: $('#contrato').val(),
                    df_nombre_contacto: $('#nombre_contacto').val(),
                    df_telefono_contacto: $('#tlf-contacto').val()
                });
            }
        } else {
            off();
            alertar('warning', '¡Alerta!', 'Debe indicar el tipo de documento');
        }
    } else {
        off();
        alertar('warning', '¡Alerta!', 'Todos los campos son obligatorios');
    }
});


function selectMaxID(personal) {
    console.log('insert personal ', personal);
    var urlCompleta = url + 'personal/getIdMax.php';
    $.get(urlCompleta, function(data) {
        if (data.data[0].df_id_personal == null) {
            personal.df_codigo_personal = 'PER-001';
            insert(personal);
        } else {
            if (data.data[0].df_id_personal > 0 && data.data[0].df_id_personal < 10) {
                personal.df_codigo_personal = 'PER-00' + ((data.data[0].df_id_personal * 1) + 1);
                insert(personal);
            } else if (data.data[0].df_id_personal > 9 && data.data[0].df_id_personal < 100) {
                personal.df_codigo_personal = 'PER-0' + ((data.data[0].df_id_personal * 1) + 1);
                insert(personal);
            } else if (data.data[0].df_id_personal > 99) {
                personal.df_codigo_personal = 'PER-' + ((data.data[0].df_id_personal * 1) + 1);
                insert(personal);
            }
        }
    })
}

function insert(personal) {
    var urlCompleta = url + 'personal/insertPersonal.php';
    console.log('insertar personal', personal);
    console.log('tipo personal', tipo_personal);
    $.post(urlCompleta, JSON.stringify(personal), function(data, status, hrx) {
        console.log(data);
        if (data == false) {
            off();
            alertar('danger', '¡Error!', 'Algo ocurrió mal, verifique la información, y por favor, vuelva a intentar');
        } else {
            console.log('Guardado personal ', data);
            var es_usuario = $('#toggle-usuario').prop('checked');
            if (es_usuario == true) {
                crearUsuario(data);
            } else {
                crearObjetoDetalle(data, 0);
            }
        }
    });
}

function crearObjetoDetalle(id, id_usuario) {
    var currentdate = new Date();
    var datetime = currentdate.getFullYear() + "-" +
        (currentdate.getMonth() + 1) + "-" +
        currentdate.getDate() + " " +
        currentdate.getHours() + ":" +
        currentdate.getMinutes() + ":" +
        currentdate.getSeconds();
    var sueldo = 0;
    if (tipo_personal == 'P') {
        sueldo = $('#sueldo').val();
        if (sueldo == '') {
            sueldo = 0;
        }
    } else {
        sueldo = 0;
    }
    var detalle = {
        df_sueldo_detper: sueldo,
        df_bono_detper: 0,
        df_anticipo_detper: 0,
        df_descuento_detper: 0,
        df_decimos_detper: 0,
        df_vacaciones_detper: 0,
        df_comisiones_detper: 0,
        df_personal_cod_detper: id,
        df_usuario_detper: id_usuario,
        df_fecha_proceso: datetime
    };
    if (detalle.df_anticipo_detper == '') {
        detalle.df_anticipo_detper = 0;
    }
    if (detalle.df_bono_detper == '') {
        detalle.df_bono_detper = 0;
    }
    if (detalle.df_comisiones_detper == '') {
        detalle.df_comisiones_detper = 0;
    }
    if (detalle.df_decimos_detper == '') {
        detalle.df_decimos_detper = 0;
    }
    if (detalle.df_descuento_detper == '') {
        detalle.df_descuento_detper = 0;
    }
    if (detalle.df_tabala_comision_detper == '') {
        detalle.df_tabala_comision_detper = 0;
    }
    if (detalle.df_vacaciones_detper == '') {
        detalle.df_vacaciones_detper = 0;
    }
    insertDetalle(detalle);
}

function insertDetalle(detalle) {
    var urlCompleta = url + 'personal/insertDetPersonal.php';
    console.log('insert detalle', detalle);
    $.post(urlCompleta, JSON.stringify(detalle), function(data, status, hrx) {
        if (data == false) {
            off();
            alertar('danger', '¡Error!', 'Algo ocurrió mal, verifique la información e intente de nuevo');
        } else {
            off();
            alertar('success', '¡Éxito!', 'Personal agregado exitosamente');
            cancelar();
        }
    });
}

function crearUsuario(id) {
    var usuario = {
        df_usuario_usuario: $('#usuario').val(),
        df_personal_cod: id,
        df_clave_usuario: $('#clave').val(),
        df_correo: $('#email').val(),
        df_tipo_usuario: $('#perfil').val(),
        df_nombre_usuario: '',
        df_tipo_documento_usuario: '',
        df_documento_usuario: '',
        df_apellido_usuario: ''

    };
    insertUsuario(usuario);
}

function insertUsuario(usuario) {
    var urlCompleta = url + 'usuario/insertUsuario.php';
    $.post(urlCompleta, JSON.stringify(usuario), function(data, status, xhr) {
        if (data == false) {
            off();
            alertar('error', '¡Error!', 'Por favor intente de nuevo, si persiste, contacte al administrador del sistema');
        } else {
            crearObjetoDetalle(usuario.df_personal_cod, data);
        }
    });
}

function cancelar() {
    $('#tipo_documento').val('null');
    $('#documento').val('');
    $('#nombre').val('');
    $('#apellido').val('');
    $('#email').val('');
    $('#fecha_ingreso').val('');
    $('#sueldo').val('');
    $('#usuario').val('');
    $('#clave').val('');
    $('#confirme').val('');
    $('#perfil').val('null');
    $('#tlf').val('');
    $('#celular').val('');
    $('#fecha_nac').val('');
    $('#direccion').val('');
    $('#contrato').val('');
    $('#nombre_contacto').val('');
    $('#tlf-contacto').val('');
    $('#cargo').val('null');
    $('#nombre-profesion').val('');
    $('#apellido-profesion').val('');
    $('#profesion').val('');
}

function getDocumento() {
    var urlCompleta = url + 'personal/getByDocumento.php';
    $.post(urlCompleta, JSON.stringify({ df_documento_per: $('#documento').val() }), function(response) {
        console.log('Respuesta getdocumento ', response);
        if (response.data.length > 0) {
            $('#span_documento').show('slow');
            $('#btn-guardar').prop('disabled', true);
        } else {
            $('#span_documento').hide('slow');
            $('#btn-guardar').prop('disabled', false);
        }
    });
}