var idleTime = 0;
$(document).ready(function() { //Increment the idle time counter every minute.
    setInterval(timerIncrement, 60000); // 1 minute
    //Zero the idle timer on mouse movement.
    $(this).mousemove(function(e) {
        idleTime = 0;
    });
    $(this).keypress(function(e) {
        idleTime = 0;
    });
});

function timerIncrement() {
    idleTime = idleTime + 1;
    if (idleTime > 9) { // 20 minutes
        usuario = JSON.parse(localStorage.getItem('distrifarma_test_user'));
        usuario.ingreso = false;
        localStorage.setItem('distrifarma_test_user', JSON.stringify(usuario));
        window.location.href = 'login.php';
    }
}
var url = 'api/'; //'http://www.proconty.com/API/distrifar/'; 
var usuario = "";

function alertar(tipo, titulo, mensaje) {
    // $.toaster({ priority: tipo, title: titulo, message: mensaje, timeout: 7000, autohide: false });
    var opciones = {
        'bgColor': '#5cb85c',
        'ftColor': 'white',
        'vPosition': 'top',
        'hPosition': 'right',
        'fadeIn': 400,
        'fadeOut': 400,
        'clickable': true,
        'autohide': false,
        'duration': 4000
    };
    if (tipo == 'warning') {
        opciones.bgColor = '#f0ad4e';
    } else if (tipo == 'danger') {
        opciones.bgColor = '#d9534f';
    }
    flash(titulo + ' - ' + mensaje, opciones);
}

$('#logout').click(function() {
    usuario = JSON.parse(localStorage.getItem('distrifarma_test_user'));
    usuario.ingreso = false;
    console.log(usuario);
    localStorage.setItem('distrifarma_test_user', JSON.stringify(usuario));
    window.location.href = "login.php";
});

var personal = {};

history.pushState(null, null, location.href);
window.onpopstate = function() {
    history.go(1);
};

var $dialog = $(
    '<div class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top:15%; overflow-y:visible;">' +
    '<div class="modal-dialog modal-m">' +
    '<div class="modal-content">' +
    '<div class="modal-header"><h3 style="margin:0;"></h3></div>' +
    '<div class="modal-body">' +
    '<div class="progress progress-striped active" style="margin-bottom:0;"><div class="progress-bar" style="width: 100%"></div></div>' +
    '</div>' +
    '</div></div></div>');

function on() {
    var settings = $.extend({
        dialogSize: 'm',
        progressType: '',
        onHide: null // This callback runs after the dialog was hidden
    }, { onHide: function() { /*alert('Callback!');*/ } });
    // Configuring dialog
    $dialog.find('.modal-dialog').attr('class', 'modal-dialog').addClass('modal-' + settings.dialogSize);
    $dialog.find('.progress-bar').attr('class', 'progress-bar');
    if (settings.progressType) {
        $dialog.find('.progress-bar').addClass('progress-bar-' + settings.progressType);
    }
    $dialog.find('h3').text('Procesando');
    // Adding callbacks
    if (typeof settings.onHide === 'function') {
        $dialog.off('hidden.bs.modal').on('hidden.bs.modal', function(e) {
            settings.onHide.call($dialog);
        });
    }
    // Opening dialog
    $dialog.modal();
}

function off() {
    $dialog.modal('hide');
}