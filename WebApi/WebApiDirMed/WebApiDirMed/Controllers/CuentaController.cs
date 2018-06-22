using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Entidades;
using Negocio;
using WebApiDirMed.Helpers;
using WebApiDirMed.Models;
using WebApiDirMed.Models.CuentaModels;
namespace WebApiDirMed.Controllers
{
    [RoutePrefix("api/Cuenta")]
    [Authorize]
    public class CuentaController : ApiController
    {
        private UsuariosLogic userlogic = new UsuariosLogic();
        private PerfilSeguridadLogic perfilseg = new PerfilSeguridadLogic();
        private Utilidades util = new Utilidades();
        private CodigoValidacionUsuarioLogic codigoValidacionUsuarioLogic = new CodigoValidacionUsuarioLogic();
        private Mailer mailer = new Mailer();

        [HttpPost]
        [AllowAnonymous]
        [Route("RegistrarUsuario")]
        public HttpResponseMessage RegistrarUsuario(RegistroUsuarioModelRequest request) {

            RespondModel respondModel = new RespondModel();

            ResponseMsj responseMsj = new ResponseMsj();
            if (!ModelState.IsValid)
            {
                var ErrorList = ModelState.Keys
                .SelectMany(key => ModelState[key].Errors.Select(x => new { Error = key + " " + x.ErrorMessage })
                .ToList());

                respondModel.SetResponse(false, string.Join("\n", ErrorList.Select(x=> x.Error).ToList()));

                return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);

            }
            else {
                var perfil = perfilseg.GetPerfilbyId(1);

                var ValidPassword = CheckPassword(request.Password, perfil.LenMinPass, perfil.CantLetrasMin, perfil.CantLetrasMayMin, perfil.CantNumeroMin, perfil.CantCharEspecialMin);

                

                if (!ValidPassword.IsValid)
                {
                    respondModel.SetResponse(false, string.Join("\n", ValidPassword.Mensajes));
                    
                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);
                }

                respondModel = userlogic.RegistrarUsuario(new Entidades.Usuarios { Email = request.Email, Password = util.encriptar(request.Password) });

                if(!respondModel.response)
                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);

                /*Creando codigo de validacion*/

                var Usuario = userlogic.GetUsuariosPorUserName(request.Email);

                var codigoValidacion = codigoValidacionUsuarioLogic.GenerarCodigoValidacionEmailUsuario(Usuario.Id, util.GetKey, util.GetIV);

                if (codigoValidacion == string.Empty)
                {
                    respondModel.SetResponse(false, "Error al generar Pin de Validación");
                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);
                }

                mailer.EnviarCorreoGmailAccesTokenAsync("cesariverarivas@gmail.com", "NJIFYUjss1OwfQNFXvWSWr6l", Usuario.Email,"Codigo de Activación de Cuenta", codigoValidacion);

                return responseMsj.CreateJsonResponse(respondModel,HttpStatusCode.OK);
            }
        }

        [HttpPost]
        [Route("GetAllUsuarios")]
        public HttpResponseMessage GetAllUser() {
            ResponseMsj responseMsj = new ResponseMsj();
            var usuarios = userlogic.GetAllUsuarios();
            return responseMsj.CreateJsonResponse(usuarios, HttpStatusCode.OK);
        }

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
