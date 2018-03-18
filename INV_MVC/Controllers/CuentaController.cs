using INV_MVC.Helpers;
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
        private Utilidades util = new Utilidades();
        // GET: Cuenta
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login() {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel model) {
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
            else {
                ModelState.AddModelError("", responloging.mensaje);
            }
            return View(model);
        }

        public ActionResult Registrarse() {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Registrarse(RegistroUsuarioViewModel model) {
            if (!ModelState.IsValid)
                return View(model);
            try
            {
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

    }
}