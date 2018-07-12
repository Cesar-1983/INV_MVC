using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;
using System.Web.Http.Controllers;
using WebApiDirMed.Models.CuentaModels;
namespace WebApiDirMed.Controllers
{
    public class baseController : ApiController
    {
        protected UsuarioViewModel UsuarioWebApi = new UsuarioViewModel();

        protected override void Initialize(HttpControllerContext controllerContext)
        {
            base.Initialize(controllerContext);
            if (User is ClaimsPrincipal) {
                var user = User as ClaimsPrincipal;
                var claims = user.Claims.ToList();
                var userString = GetClaims(claims, "Usuario");
                if (!string.IsNullOrEmpty(userString))
                    UsuarioWebApi = JsonConvert.DeserializeObject<UsuarioViewModel>(userString);
            }
        }

        public static string GetClaims(List<Claim> claims, string key)
        {
            var claim = claims.FirstOrDefault(c => c.Type == key);
            if (claim == null)
                return null;

            return claim.Value;
        }
    }
}
