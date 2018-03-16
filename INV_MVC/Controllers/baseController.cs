using INV_MVC.Models.CuentaViewModel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace INV_MVC.Controllers
{
    public class baseController : Controller
    {
        protected UsuarioViewModel Usuario = new UsuarioViewModel();
        // GET: base
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
            if (User is ClaimsPrincipal)
            {
                var user = User as ClaimsPrincipal;
                var claims = user.Claims.ToList();
                var userString = GetClaims(claims, "UsuarioApp");
                if (!string.IsNullOrEmpty(userString))
                    Usuario = JsonConvert.DeserializeObject<UsuarioViewModel>(userString);
            }
        }
        public static string GetClaims(List<Claim> claims, string key)
        {
            var claim = claims.FirstOrDefault(c => c.Type == key);
            if (claim == null)
                return null;

            return claim.Value;
        }

        public string GetUserName()
        {
            return Usuario.UserName ?? "";
        }
        //public List<MenuRol> GetMenu()
        //{
        //    return usuarioapp.Menu;
        //}
        public bool IsLogin()
        {
            return string.IsNullOrEmpty(Usuario.UserName) ? false : true;
        }
    }
}