

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
    $$("")
    var page = e.detail;
    console.log(e.name);
    console.log(page.name);
    if (Sesion === null && !(page.name === 'registro' || page.name === 'confirmacion'))
        app.loginScreen.open('#my-login-screen', true);
    else
        app.loginScreen.close('#my-login-screen', true);
    Sesion = JSON.parse(Sesion);
    /*Registro App*/
    if (page.name === 'home') {

        //$$('.convert-form-to-data').on('click', function () {
        //    //var a = $$('#frmRegistro').validate();
        //    var Url = UrlAPI + 'Cuenta/RegistrarUsuario'
        //    var formData = app.form.convertToData('#frmRegistro');

        //    app.preloader.show();
        //    /*alert(JSON.stringify(formData));*/
        //    var datajson = JSON.stringify(formData);


        //    var settings = {
        //        url: Url,
        //        method: 'post',
        //        data: datajson,
        //        dataType: 'json',
        //        contentType: 'application/json',
        //        success: success,
        //        error: error
        //    };

        //    //app.request.post(Url,data, success, error,'json');
        //    app.request(settings);
        //});

    }
    /*Registro App*/
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
                success: function(data, status, xhr) {
                    app.preloader.hide();
                    app.dialog.alert("Usuario registrado exitosamente, Gracias!!!\n\nSe ha enviado un correo para confirmarción.", TitleMessage, function () { app.router.navigate('/') });


                },
                error: function (xhr, status) {
                    app.preloader.hide();
                    
                    if (status === 400) {
                        var reponseerror = JSON.parse(xhr.responseText);
                        app.dialog.alert(reponseerror.mensaje, TitleMessage);
                    }
                }
            };

            //app.request.post(Url,data, success, error,'json');
            app.request(settings);
        });

    }
    /*Registro App*/
    /*Confirmacion*/
    if (page.name === 'confirmacion')
    {
        $$('#btnconfirmacion').on('click', function () {
            var Url = UrlAPI + 'Cuenta/EmailConfirmacion'
            var formData = app.form.convertToData('#frmConfirmacion');
            var datajson = JSON.stringify(formData);
            var settings = {
                url: Url,
                method: 'post',
                data: datajson,
                dataType: 'json',
                contentType: 'application/json',
                success: function (data, status, xhr) {
                    app.preloader.hide();
                    app.dialog.alert("Usuario confirmado, Gracias!!!.", TitleMessage, function () { app.router.navigate('/') });
                    
                    
                },
                error: function (xhr, status) {
                    app.preloader.hide();
                    var reponseerror = JSON.parse(xhr.responseText);
                    if (status === 400) {
                        var reponseerror = JSON.parse(xhr.responseText);
                        app.dialog.alert(reponseerror.mensaje, TitleMessage);
                    }
                }
            };
            app.preloader.show();
            app.request(settings);
        });
    }
    /*Confirmacion*/
    /*Inicio Eventos EditarPerfil*/
    if (page.name === 'editarperfil')
    {
        $$("#Id").hide();
        $$("#TipoPerfilId").hide();
        $$("#UsuariosId").hide();
        $$('#btnGuardar').on('click', function () {
            var Url = UrlAPI + 'Perfil/RegistrarPerfil'
            var formData = app.form.convertToData('#frmEditarPerfil');
            var datajson = JSON.stringify(formData);
            var settings = {
                url: Url,
                method: 'post',
                headers: {
                    'Authorization': Sesion.token_type + ' ' + Sesion.access_token
                },
                data: datajson,
                dataType: 'json',
                contentType: 'application/json',
                success: function (data, status, xhr) {
                    app.preloader.hide();
                    app.dialog.alert(data.mensaje, TitleMessage, function () { app.router.navigate('/') });


                },
                error: function (xhr, status) {
                    app.preloader.hide();
                    //var reponseerror = JSON.parse(xhr.responseText);
                    if (status === 400) {
                        var reponseerror = JSON.parse(xhr.responseText);
                        app.dialog.alert(reponseerror.mensaje, TitleMessage);
                    }
                    else if (status === 401) {
                        var reponseerror = JSON.parse(xhr.responseText);
                        app.dialog.alert(reponseerror.Message, TitleMessage);
                    }
                }
            };
            app.preloader.show();
            app.request(settings);
        });
    };
    /*Fin Eventos EditarPerfil*/
    /*Inicio Eventos Especialidades*/
    if (page.name === 'especialidades')
    {
        $$('#btnGuardar').on('click', function () {
            var Url = UrlAPI + 'CategoriaTipoPerfil/SaveCategoríaByPerfilIdSelected'

            var formData = app.form.convertToData('#frmEspecialidades');
            var array = new Array(); 
            
            for (var propt in formData) {
                if (formData[propt][0] !== undefined) {
                    array.push({ "CategoriaTipoPerfilId": Number(formData[propt][0]) });
                }
                console.log(propt + ': ' + formData[propt]);
            }
            var datajson = {
                TipoPerfilId:TipoPerfilId,
                SaveCategoríaByPerfilIdSelected: array
            };

            var settings = {
                url: Url,
                method: 'post',
                headers: {
                    'Authorization': Sesion.token_type + ' ' + Sesion.access_token
                },
                data: JSON.stringify(datajson),
                dataType: 'json',
                contentType: 'application/json',
                success: function (data, status, xhr) {
                    app.preloader.hide();
                    app.dialog.alert(data.mensaje, TitleMessage, function () { app.router.navigate('/') });


                },
                error: function (xhr, status) {
                    app.preloader.hide();
                    //var reponseerror = JSON.parse(xhr.responseText);
                    if (status === 400) {
                        var reponseerror = JSON.parse(xhr.responseText);
                        app.dialog.alert(reponseerror.mensaje, TitleMessage);
                    }

                    else if (status === 401) {
                        var reponseerror = JSON.parse(xhr.responseText);
                        app.dialog.alert(reponseerror.Message, TitleMessage);
                    }
                    else if (status === 502) {
                        app.dialog.alert("Lo sentimos el servicio no esta disponible.", TitleMessage);
                    }

                }
            };
            app.preloader.show();
            app.request(settings);
            

            //console.log(JSON.stringify(datajson));

        });
    };
    /*Fin Eventos Especialidades*/
    $$('#my-login-screen .login-button').on('click', function () {
        var Url = UrlAPI + 'token'
        var username = $$('#my-login-screen [name="username"]').val();
        var password = $$('#my-login-screen [name="password"]').val();

        var datajson = { 'grant_type': "password", 'username': username, 'password': password }

        var settings = {
            url: Url,
            method: 'post',
            data: datajson,
            dataType: 'json',
            contentType: 'application/json',
            success: function (data, status, xhr) {
                localStorage.setItem(SessionUsuario, JSON.stringify(data));
                app.preloader.hide();
                app.loginScreen.close('#my-login-screen', true);
            },
            error: function (xhr, status) {
                app.preloader.hide();
                
                if (status === 400) {
                    var reponseerror = JSON.parse(xhr.responseText);
                    if (reponseerror.error_description === "Usuario no confirmado.") {
                        app.dialog.alert("Usuario no confirmado, favor ingrese el numero enviado a su correo.", TitleMessage, function () { app.router.navigate('/confirmacion/') });
                    }
                    else {
                        app.dialog.alert(reponseerror.error_description, TitleMessage);
                    }

                }
                else if (status === 502) {
                    app.dialog.alert("Lo sentimos el servicio no esta disponible.", TitleMessage);
                }
                else {
                    app.dialog.alert("Ha ocurrido un error inesperado, favor intentar mas tarde.", TitleMessage);
                }
                
                //app.dialog.alert(reponseerror.error_description, TitleMessage);
            }
        };
        app.preloader.show();
        app.request(settings);
    });

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
    function navigateToIndex() {
        router.navigate('/');
    }


})

