using Entidades;
using INV_MVC.Helpers;
using INV_MVC.Models;
using INV_MVC.Models.CuentaViewModel;
using INV_MVC.Models.Seguridad;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Negocio;
using Newtonsoft.Json;
using reCAPTCHA.MVC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace INV_MVC.Controllers
{
    [Authorize]
    public class CuentaController : baseController
    {
        private UsuariosLogic userlogic = new UsuariosLogic();
        private PerfilSeguridadLogic perfilseg = new PerfilSeguridadLogic();
        private Utilidades util = new Utilidades();
        private RolesLogic RolesLogic = new RolesLogic();
        private RolesAccionesLogic rolesAccionesLogic = new RolesAccionesLogic();
        private AccionesLogic accionesLogic = new AccionesLogic();
        // GET: Cuenta
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public ActionResult Login(LoginViewModel model)
        {
            if (!ModelState.IsValid)
                return View(model);
            var responloging = userlogic.LogIng(model.Email, model.Password, util.GetKey, util.GetIV);
            if (responloging.response)
            {
                var Usuario = userlogic.GetUsuariosPorUserName(model.Email);
                UsuarioViewModel user = new UsuarioViewModel
                {
                    UserName = Usuario.UserName,
                    Email = Usuario.Email,
                    UserId = Usuario.Id
                };
                SignIn(user);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("", responloging.mensaje);
            }
            return View(model);
        }

        [AllowAnonymous]
        public ActionResult Registrarse()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        [CaptchaValidator]
        public ActionResult Registrarse(RegistroUsuarioViewModel model, bool captchaValid)
        {
            if (!ModelState.IsValid)
            {
                if (!captchaValid)
                    ModelState.AddModelError("", "Favor validar que no eres un robot.");
                return View(model);
            }
                
            try
            {
                var perfil = perfilseg.GetPerfilbyId(1);

                var ValidPassword = CheckPassword(model.Password, perfil.LenMinPass, perfil.CantLetrasMin, perfil.CantLetrasMayMin, perfil.CantNumeroMin, perfil.CantCharEspecialMin);

                if (!ValidPassword.IsValid) {
                    foreach (var item in ValidPassword.Mensajes)
                    {
                        ModelState.AddModelError("", item);
                    }
                    return View(model);
                }

                var respuesta = userlogic.RegistrarUsuario(new Entidades.Usuarios { Email = model.Email, Password = util.encriptar(model.Password) });
                if (respuesta.response)
                    return RedirectToAction("Login");
                ModelState.AddModelError("", respuesta.mensaje);
            }
            catch (Exception ex)
            {

                ModelState.AddModelError("", ex.Message);
            }
            return View(model);
        }
        public ActionResult UserState() {
            var model = Usuario;
            return PartialView("_UserState", model);
        }

        [HttpPost]
        [Authorize]
        public ActionResult Logoff()
        {
            Signout();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult RolesListar() {
            ViewBag.breadcrumb = "Cuenta/Seguridad";
            ViewBag.pageheader = "Seguridad";
            ViewBag.Heading = "Roles y permisos";

            var model = RolesLogic.GetAll();
            return PartialView("_RolesListar",model);

        }
        public ActionResult RolesAdd()
        {
            ViewBag.ModalHeading = "Agregar Rol";
            Roles model = new Roles();
            return PartialView("_RolesAddUpd", model);
        }

        public ActionResult RolesEdit(int id)
        {
            ViewBag.ModalHeading = "Editar Rol";
            Roles model = RolesLogic.GetRolesPorId(id);
            return PartialView("_RolesAddUpd", model);
        }
        public ActionResult RolPermisos(int id) {
            var rol = RolesLogic.GetRolesPorId(id);
            var acciones = accionesLogic.GetAll();
            RolAddPermisoViewModel model = new RolAddPermisoViewModel();
            model.Id = rol.Id;
            model.Nombre = rol.Nombre;

            foreach (var item in acciones)
            {
                var exist = rolesAccionesLogic.GetRolesAccionesExist(model.Id, item.Id);
                model.Acciones.Add(new SelectedRolesAccionesEditorViewModel { Accion = item.Accion, Controlador = item.Controlador, IdAccion = item.Id, Selected= exist });
            }

            return PartialView("_RolPermisos", model);
            

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult RolPermisos(RolAddPermisoViewModel model)
        {
            foreach (var item in model.Acciones)
            {

                if (item.Selected) {
                    rolesAccionesLogic.Guardar(new RolesAcciones { IdRol = model.Id, IdAcciones = item.IdAccion });
                }
                else {
                    rolesAccionesLogic.Eliminar(model.Id, item.IdAccion);
                }
                
            }

            return PartialView("_RolPermisos", model);


        }

        public ActionResult GuardarRol(Roles model)
        {
            ViewBag.ModalHeading = model.Id == 0 ? "Agregar Rol" : "Editar Rol";

            if (!ModelState.IsValid)
                return PartialView("_RolesAddUpd", model);
            var respuesta = RolesLogic.Guardar(model);
            if (!respuesta.response)
            {
                ModelState.AddModelError("", respuesta.mensaje);
                return PartialView("_RolesAddUpd", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("RolesListar");
            return Json(respuesta);
        }


        #region Autenticacion
        public void SignIn(UsuarioViewModel User, string providerKey = null, bool isPersistent = false)
        {
            var claims = new List<Claim>();

            // create required claims
            claims.Add(new Claim(ClaimTypes.NameIdentifier, User.UserId.ToString()));
            claims.Add(new Claim(ClaimTypes.Name, User.UserName));

            var jsonUserMonitoreo = JsonConvert.SerializeObject(User);

            // custom – my serialized AppUserState object
            claims.Add(new Claim("UsuarioApp", jsonUserMonitoreo));

            var identity = new ClaimsIdentity(claims, DefaultAuthenticationTypes.ApplicationCookie);

            AuthenticationManager.SignIn(new AuthenticationProperties()
            {
                AllowRefresh = true,
                IsPersistent = isPersistent,
                ExpiresUtc = DateTime.UtcNow.AddDays(7)
            }, identity);
        }


        public void Signout()
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie,
                                            DefaultAuthenticationTypes.ExternalCookie);
        }

        private IAuthenticationManager AuthenticationManager
        {
            //return HttpContext.Current.GetOwinContext().Authentication;
            get { return HttpContext.GetOwinContext().Authentication; }
        }
        #endregion
        #region MetodosApoyo
        public ValidationClass CheckPassword(string pass, int LenMinPass, int CantLetrasMin, int CantLetrasMayMin, int CantNumeroMin, int CantCharEspecialMin)
        {
            ValidationClass validaciones = new ValidationClass();
            bool respond = true;
            //respondModel.SetResponse(true, "Contraseña OK.");
            int contCantLetrasMin = 0;
            int contCantLetrasMayMin = 0;
            int contCantNumeroMin = 0;
            int contCantCharEspecialMin = 0;
            if (pass.Length < LenMinPass)
            {
                validaciones.Mensajes.Add(string.Format("La contraseña debe tener un minimo de {0} caracteres", LenMinPass));
                respond = false;
            }
            /*Validación cantidad de letras*/
            foreach (char c in pass)
            {
                if (char.IsLetter(c))
                    contCantLetrasMin++;

            }
            if (contCantLetrasMin < CantLetrasMin)
            {

                validaciones.Mensajes.Add(string.Format("La contraseña debe tener un minimo de {0} letras", CantLetrasMin));
                respond = false;
            }
            /*Validación cantidad de letras*/

            /*Validación cantidad de letras Mayusculas*/
            foreach (char c in pass)
            {
                if (char.IsUpper(c))
                    contCantLetrasMayMin++;

            }
            if (contCantLetrasMayMin < CantLetrasMayMin)
            {

                validaciones.Mensajes.Add(string.Format("La contraseña debe tener un minimo de {0} mayusculas", CantLetrasMayMin));
                respond = false;
            }
            /*Validación cantidad de letras Mayusculas*/

            /*Validación cantidad de numeros*/
            foreach (char c in pass)
            {
                if (char.IsNumber(c))
                    contCantNumeroMin++;

            }

            if (contCantNumeroMin < CantNumeroMin)
            {

                validaciones.Mensajes.Add(string.Format("La contraseña debe tener un minimo de {0} digitos", CantNumeroMin));
                respond = false;
            }
            /*Validación cantidad de numeros*/

            /*Validación cantidad de Caracteres especiales*/

            foreach (char c in pass)
            {
                if (!char.IsLetterOrDigit(c))
                    contCantCharEspecialMin++;

            }
            if (contCantCharEspecialMin < CantCharEspecialMin)
            {

                validaciones.Mensajes.Add(string.Format("La contraseña debe tener un minimo de {0} caracteres especiales", CantCharEspecialMin));
                respond = false;
            }
            /*Validación cantidad de Caracteres especiales*/

            validaciones.IsValid = respond;

            return validaciones;
        }

        #endregion
    }
}