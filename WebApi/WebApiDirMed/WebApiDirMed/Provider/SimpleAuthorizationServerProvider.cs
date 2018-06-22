using Microsoft.Owin.Security.OAuth;
using System.Security.Claims;
using System.Threading.Tasks;
using Entidades;
using Negocio;
using WebApiDirMed.Helpers;
using System.Collections.Generic;
using WebApiDirMed.Models.CuentaModels;
using Newtonsoft.Json;

namespace WebApiDirMed.Provider
{
    public class SimpleAuthorizationServerProvider: OAuthAuthorizationServerProvider
    {
        private UsuariosLogic usuariosLogic = new UsuariosLogic();
        private Utilidades util = new Utilidades();
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            var claims = new List<Claim>();
            context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { "*" });
            var identity = new ClaimsIdentity(context.Options.AuthenticationType);

            if (context.UserName == null && context.Password == null)
            {
                context.SetError("invalid_grant", "Usuario y contraseña son requeridos.");
                return;
            }
            var responloging = usuariosLogic.LogIng(context.UserName, context.Password, util.GetKey, util.GetIV);

            if (responloging.response) {
                var Usuario = usuariosLogic.GetUsuariosPorUserName(context.UserName);
                Usuario.IntentosFallidos = 0;
                var responseUpdateIntentosFallidos = usuariosLogic.Guardar(Usuario);
                if (!responseUpdateIntentosFallidos.response)
                {
                    context.SetError("invalid_grant", responseUpdateIntentosFallidos.mensaje);
                    return;
                }
                UsuarioViewModel user = new UsuarioViewModel
                {
                    UserName = Usuario.UserName,
                    Email = Usuario.Email,
                    UserId = Usuario.Id
                };

                var jsonUserMonitoreo = JsonConvert.SerializeObject(user);

                
                ////claims.Add(new Claim("Usuario", jsonUserMonitoreo));

                identity.AddClaim(new Claim("Usuario", jsonUserMonitoreo));
                ////context.Validated(new ClaimsIdentity(context.Options.AuthenticationType));
                ////context.Validated(claims);
                //context.Validated(identity);

                identity.AddClaim(new Claim("sub", context.UserName));
                identity.AddClaim(new Claim("role", "user"));

                context.Validated(identity);
            }
            else {
                context.SetError("invalid_grant", responloging.mensaje);
                return;
            }

            
        }
    }
}