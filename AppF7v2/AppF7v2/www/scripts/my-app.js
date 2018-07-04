
const SessionUsuario="UserToken";
const UrlAPI = "http://localhost:18918/api/"
const TitleMessage = "Directorio Médico"
// Dom7
var $$ = Dom7;

var app = new Framework7({
    // App root element
    root: '#app',
    // App Name
    name: 'My App',
    // App id
    id: 'com.myapp.test',
    // Enable swipe panel
    panel: {
        swipe: 'left',
    },
    // Add default routes
    routes: routes,

    
    // ... other parameters
});

var mainView = app.views.create('.view-main', { url: '/' });

$$(document).on('deviceready', function () {
    console.log("Device is ready!");

    ////checkConnection();

    ////localStorage.setItem('sessionUser', 'cesar');
    //var sessionId = localStorage.getItem('sessionUser');

    //if (sessionId === null || sessionId === undefined) {
    //    myApp.loginScreen();
    //}
    ////console.log("Pass Here!");

    //document.addEventListener("backbutton", onBackKeyDown, false);
    //document.addEventListener("offline", onOffline, false);
    //document.addEventListener("online", onOnline, false);

});


$$(document).on('page:init', function (e) {
    var Sesion = localStorage.getItem(SessionUsuario);

    var page = e.detail;
    console.log(e.name);
    console.log(page.name);
    if (Sesion === null && page.name !== 'registro')
        app.loginScreen.open('#my-login-screen', true);
    else
        app.loginScreen.close('#my-login-screen', true);
    /*Registro App*/
    if (page.name === 'registro') {
        
        $$('.convert-form-to-data').on('click', function () {
            //var a = $$('#frmRegistro').validate();
            var Url = UrlAPI + 'Cuenta/RegistrarUsuario'
            var formData = app.form.convertToData('#frmRegistro');

            app.preloader.show();
            /*alert(JSON.stringify(formData));*/
            var datajson = JSON.stringify(formData);


            var settings = {
                url: Url,
                method: 'post',
                data: datajson,
                dataType: 'json',
                contentType:'application/json',
                success: success,
                error: error
            };

            //app.request.post(Url,data, success, error,'json');
            app.request(settings);
        });

    }
    /*Registro App*/
    function success(data, status, xhr) {
        app.preloader.hide();
        app.dialog.alert(data.responseText, TitleMessage);
        console.log(data + xhr + status);
    }
    function error(xhr, status) {
        console.log(xhr + status)
        app.preloader.hide();
        var reponseerror = JSON.parse(xhr.responseText);
        app.dialog.alert(reponseerror.mensaje, TitleMessage);
    }
})


