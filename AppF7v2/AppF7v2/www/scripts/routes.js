﻿routes = [
  {
    path: '/',
    url: './index.html',
  },
  {
    path: '/about/',
    url: './pages/about.html',
  },
  {
      path: '/registro/',
      url: './pages/registro.html',
  },
  {
      path: '/confirmacion/',
      url: './pages/confirmacion.html',
  },
  {
      path: '/perfil/',
      url: './pages/perfil.html',
  },
  {
      path: '/datosgenerales/',
      async: function (routeTo, routeFrom, resolve, reject) {
          console.log(routeTo);
          var Sesion = JSON.parse(localStorage.getItem(SessionUsuario));
          var Url = UrlAPI + 'Perfil/GetPerfilUsuarioByTipoPerfil';
          var datajson = JSON.stringify({ "TipoPerfilId": TipoPerfilId });
          app.preloader.show();
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

                  if (data.tipoPerfilId === 0) {
                      data.tipoPerfilId = TipoPerfilId;
                  }

                  resolve(
                      { componentUrl: './pages/editarperfil.html', },
                      {
                          context: {
                              perfil: data,
                          }
                      }

                  )


              },
              error: function (xhr, status) {
                  app.preloader.hide();

                  if (status === 400) {
                      var reponseerror = JSON.parse(xhr.responseText);
                      app.dialog.alert(reponseerror.mensaje, TitleMessage);
                  }
                  else if (status === 404) {
                      var data = {
                          "id": 0,
                          "tipoPerfilId": TipoPerfilId,
                          "usuariosId": 0,
                          "nombre": "",
                          "apellido": "",
                          "descPerfil": ""
                          
                      }
                      resolve(
                          { componentUrl: './pages/editarperfil.html', },
                          {
                              context: {
                                  perfil: data,
                              }
                          }

                      )
                  }
                  else if (status === 401) {
                      localStorage.removeItem(SessionUsuario);
                      app.dialog.alert("Token Invalido, favor iniciar sesión nuevamente.", TitleMessage, function () {
                          reject();
                          app.router.navigate('/')
                          app.loginScreen.open('#my-login-screen', true);
                      });
                  }
                  else {
                      app.dialog.alert('Ha ocurrido un error, favor intentar nuevamente');
                  }
                  
                  
              }
          };
          app.request(settings);
      }
  },
  {
      path: '/especialidades/',
      async: function (routeTo, routeFrom, resolve, reject) {
          console.log(routeTo);
          var Sesion = JSON.parse(localStorage.getItem(SessionUsuario));
          var Url = UrlAPI + 'CategoriaTipoPerfil/GetCategoríaPorTipoPerfilId';
          var datajson = JSON.stringify({ "TipoPerfilId": TipoPerfilId });
          app.preloader.show();
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

                  if (data.tipoPerfilId === 0) {
                      data.tipoPerfilId = TipoPerfilId;
                  }

                  resolve(
                      { componentUrl: './pages/especialidades.html', },
                      {
                          context: {
                              datos: data,
                          }
                      }

                  )


              },
              error: function (xhr, status) {
                  app.preloader.hide();

                  if (status === 400) {
                      var reponseerror = JSON.parse(xhr.responseText);
                      app.dialog.alert(reponseerror.mensaje, TitleMessage);
                  }

                  //else if (status === 404) {
                  //    var data = {
                  //        "id": 0,
                  //        "tipoPerfilId": TipoPerfilId,
                  //        "usuariosId": 0,
                  //        "nombre": "",
                  //        "apellido": "",
                  //        "descPerfil": ""

                  //    }
                  //    resolve(
                  //        { componentUrl: './pages/editarperfil.html', },
                  //        {
                  //            context: {
                  //                perfil: data,
                  //            }
                  //        }

                  //    )
                  //}
                  else if (status === 401) {
                      localStorage.removeItem(SessionUsuario);
                      app.dialog.alert("Token Invalido, favor iniciar sesión nuevamente.", TitleMessage, function () {
                          reject();
                          app.router.navigate('/')
                          app.loginScreen.open('#my-login-screen', true);
                      });
                  }
                  else if (status === 502) {
                      app.dialog.alert("Lo sentimos el servicio no esta disponible.", TitleMessage);
                  }
                  else {
                      app.dialog.alert('Ha ocurrido un error, favor intentar nuevamente');
                  }


              }
          };
          app.request(settings);
      }

      
  },
  {
      path: '/direcciones/',
      async: function (routeTo, routeFrom, resolve, reject) {
          console.log(routeTo);
          var Sesion = JSON.parse(localStorage.getItem(SessionUsuario));
          var Url = UrlAPI + 'Direcciones/GetDireccionesByPerfil';
          var datajson = JSON.stringify({ "TipoPerfilId": TipoPerfilId });
          app.preloader.show();
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

                  //if (data.tipoPerfilId === 0) {
                  //    data.tipoPerfilId = TipoPerfilId;
                  //}

                  resolve(
                      { componentUrl: './pages/direcciones.html', },
                      {
                          context: {
                              datos: data,
                          }
                      }

                  )


              },
              error: function (xhr, status) {
                  app.preloader.hide();

                  if (status === 400) {
                      var reponseerror = JSON.parse(xhr.responseText);
                      app.dialog.alert(reponseerror.mensaje, TitleMessage);
                  }

                  //else if (status === 404) {
                  //    var data = {
                  //        "id": 0,
                  //        "tipoPerfilId": TipoPerfilId,
                  //        "usuariosId": 0,
                  //        "nombre": "",
                  //        "apellido": "",
                  //        "descPerfil": ""

                  //    }
                  //    resolve(
                  //        { componentUrl: './pages/editarperfil.html', },
                  //        {
                  //            context: {
                  //                perfil: data,
                  //            }
                  //        }

                  //    )
                  //}
                  else if (status === 401) {
                      localStorage.removeItem(SessionUsuario);
                      app.dialog.alert("Token Invalido, favor iniciar sesión nuevamente.", TitleMessage, function () {
                          reject();
                          app.router.navigate('/')
                          app.loginScreen.open('#my-login-screen', true);
                      });
                  }
                  else if (status === 502) {
                      app.dialog.alert("Lo sentimos el servicio no esta disponible.", TitleMessage);
                  }
                  else {
                      app.dialog.alert('Ha ocurrido un error, favor intentar nuevamente');
                  }


              }
          };
          app.request(settings);
      }


  },
  {
      path: '/direcciones/:Id/:PerfilId/',
      async: function (routeTo, routeFrom, resolve, reject) {
          console.log(routeTo);
          var Sesion = JSON.parse(localStorage.getItem(SessionUsuario));
          var Url = UrlAPI + 'Direcciones/GetDireccionBy_Id_PerfilId';
          var datajson = JSON.stringify({ "Id": routeTo.params.Id, "PerfilId": routeTo.params.PerfilId });
          app.preloader.show();
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

                  //if (data.tipoPerfilId === 0) {
                  //    data.tipoPerfilId = TipoPerfilId;
                  //}

                  resolve(
                      { componentUrl: './pages/direccionesAdd.html', },
                      {
                          context: {
                              datos: data,
                          }
                      }

                  )


              },
              error: function (xhr, status) {
                  app.preloader.hide();

                  if (status === 400) {
                      var reponseerror = JSON.parse(xhr.responseText);
                      app.dialog.alert(reponseerror.mensaje, TitleMessage);
                  }

                  //else if (status === 404) {
                  //    var data = {
                  //        "id": 0,
                  //        "tipoPerfilId": TipoPerfilId,
                  //        "usuariosId": 0,
                  //        "nombre": "",
                  //        "apellido": "",
                  //        "descPerfil": ""

                  //    }
                  //    resolve(
                  //        { componentUrl: './pages/editarperfil.html', },
                  //        {
                  //            context: {
                  //                perfil: data,
                  //            }
                  //        }

                  //    )
                  //}
                  else if (status === 401) {
                      localStorage.removeItem(SessionUsuario);
                      app.dialog.alert("Token Invalido, favor iniciar sesión nuevamente.", TitleMessage, function () {
                          reject();
                          app.router.navigate('/')
                          app.loginScreen.open('#my-login-screen', true);
                      });
                  }
                  else if (status === 502) {
                      app.dialog.alert("Lo sentimos el servicio no esta disponible.", TitleMessage);
                  }
                  else {
                      app.dialog.alert('Ha ocurrido un error, favor intentar nuevamente');
                  }


              }
          };
          app.request(settings);
      }

  },
  {
    path: '/form/',
    url: './pages/form.html',
  },
  // Page Loaders & Router
  {
    path: '/page-loader-template7/:user/:userId/:posts/:postId/',
    templateUrl: './pages/page-loader-template7.html',
  },
  {
    path: '/page-loader-component/:user/:userId/:posts/:postId/',
    componentUrl: './pages/page-loader-component.html',
  },
  {
    path: '/request-and-load/user/:userId/',
    async: function (routeTo, routeFrom, resolve, reject) {
      // Router instance
      var router = this;

      // App instance
      var app = router.app;

      // Show Preloader
      app.preloader.show();

      // User ID from request
      var userId = routeTo.params.userId;

      // Simulate Ajax Request
      setTimeout(function () {
        // We got user data from request
        var user = {
          firstName: 'Vladimir',
          lastName: 'Kharlampidi',
          about: 'Hello, i am creator of Framework7! Hope you like it!',
          links: [
            {
              title: 'Framework7 Website',
              url: 'http://framework7.io',
            },
            {
              title: 'Framework7 Forum',
              url: 'http://forum.framework7.io',
            },
          ]
        };
        // Hide Preloader
        app.preloader.hide();

        // Resolve route to load page
        resolve(
          {
            componentUrl: './pages/request-and-load.html',
          },
          {
            context: {
              user: user,
            }
          }
        );
      }, 1000);
    },
  },
  // Default route (404 page). MUST BE THE LAST
  {
    path: '(.*)',
    url: './pages/404.html',
  },
];