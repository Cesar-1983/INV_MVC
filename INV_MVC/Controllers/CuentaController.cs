using Entidades;
using INV_MVC.Helpers;
using INV_MVC.Models;
using INV_MVC.Models.CuentaViewModel;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Negocio;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace INV_MVC.Controllers
{
    public class CuentaController : baseController
    {
        private UsuariosLogic userlogic = new UsuariosLogic();
        private PerfilSeguridadLogic perfilseg = new PerfilSeguridadLogic();
        private Utilidades util = new Utilidades();
        // GET: Cuenta
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
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

        public ActionResult Registrarse()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Registrarse(RegistroUsuarioViewModel model)
        {
            if (!ModelState.IsValid)
                return View(model);
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