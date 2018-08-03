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
    public class CuentaController : baseController
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
                //var ErrorList = ModelState.Keys
                //.SelectMany(key => ModelState[key].Errors.Select(x => new { Error = key + " " + x.ErrorMessage })
                //.ToList());

                var ErrorList = ModelState.Keys
                .SelectMany(key => ModelState[key].Errors.Select(x => new { Error = x.ErrorMessage })
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

                //string MessageBody = System.IO.File.ReadAllText(System.Web.HttpContext.Current.Request.MapPath("~\\Content\\index.htm")) ;
                string MessageBody = System.IO.File.ReadAllText(System.Web.HttpContext.Current.Request.MapPath("~\\Content\\email.html"));
                MessageBody = MessageBody.Replace("**To**",Usuario.Email);
                MessageBody = MessageBody.Replace("**Codigo**", codigoValidacion);
                MessageBody = MessageBody.Replace("**Anio**", DateTime.Now.Year.ToString());

                //mailer.SendMail(Usuario.Email, "Confirmaci&#243;n de usuario", MessageBody);
                //mailer.SendMail(Usuario.Email, "Confirmaci&oacute;n de usuario", MessageBody);
                mailer.SendMail(Usuario.Email, "Confirmación de usuario", MessageBody);
                //mailer.EnviarCorreoGmailAccesTokenAsync("cesariverarivas@gmail.com", "NJIFYUjss1OwfQNFXvWSWr6l", Usuario.Email,"Codigo de Activación de Cuenta", codigoValidacion);

                return responseMsj.CreateJsonResponse(respondModel,HttpStatusCode.OK);
            }
        }


        [HttpPost]
        [AllowAnonymous]
        [Route("EmailConfirmacion")]
        public HttpResponseMessage EmailConfirmacion(EmailConfirmacionRequest request) {
            RespondModel respondModel = new RespondModel();
            ResponseMsj responseMsj = new ResponseMsj();
            try
            {
                if (!ModelState.IsValid)
                {
                    var ErrorList = ModelState.Keys
                    .SelectMany(key => ModelState[key].Errors.Select(x => new { Error = key + " " + x.ErrorMessage })
                    .ToList());

                    respondModel.SetResponse(false, string.Join("\n", ErrorList.Select(x => x.Error).ToList()));

                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);

                }
                var responloging = userlogic.ValidatePasswordUser(request.Email, request.Password, util.GetKey, util.GetIV);

                if (!responloging.response)
                {
                    return responseMsj.CreateJsonResponse(responloging, HttpStatusCode.BadRequest);
                }

                /*Se  obtiene el usuario*/
                var Usuario = userlogic.GetUsuariosPorUserName(request.Email);
                /*Se  obtiene el usuario*/

                /*Se  obtiene el codigo de validación del usuario*/
                var CodigoVal = codigoValidacionUsuarioLogic.GetCodigoValidacionEmailByUsuario(Usuario.Id);
                /*Se  obtiene el codigo de validación del usuario*/

                if (CodigoVal.Codigo != request.Codigo)
                {
                    respondModel.SetResponse(false, "El codigo de validación no coincide");
                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);
                }

                if (CodigoVal.FechaExpiracion < DateTime.Now)
                {
                    respondModel.SetResponse(false, "El codigo de validación no coincide");
                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);
                }



                var EmailConfirmed = userlogic.EmailConfirmacion(Usuario.Id);

                return responseMsj.CreateJsonResponse(EmailConfirmed, EmailConfirmed.response ? HttpStatusCode.OK : HttpStatusCode.BadRequest);
            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
            

        }

        [HttpPost]
        [Route("GetAllUsuarios")]
        public HttpResponseMessage GetAllUser() {
            ResponseMsj responseMsj = new ResponseMsj();
            var usuarios = userlogic.GetAllUsuarios();
            return responseMsj.CreateJsonResponse(usuarios, HttpStatusCode.OK);
        }

        [HttpPost]
        [Route("ChangePassworduser")]
        public HttpResponseMessage ChangePassworduser(ChangeUserPasswordRequest request) {
            RespondModel respondModel = new RespondModel();
            ResponseMsj responseMsj = new ResponseMsj();
            try
            {
                if (!ModelState.IsValid)
                {
                    var ErrorList = ModelState.Keys
                    .SelectMany(key => ModelState[key].Errors.Select(x => new { Error = key + " " + x.ErrorMessage })
                    .ToList());

                    respondModel.SetResponse(false, string.Join("\n", ErrorList.Select(x => x.Error).ToList()));

                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);

                }
                else
                {
                    /*Se  valida la contraseña actual*/

                    var responloging = userlogic.ValidatePasswordUser(request.Email, request.OldPassword, util.GetKey, util.GetIV);
                    /*Se  valida la contraseña actual*/

                    if (!responloging.response)
                    {
                        return responseMsj.CreateJsonResponse(responloging, HttpStatusCode.BadRequest);
                    }
                    /*Se  obtiene el usuario*/

                    var Usuario = userlogic.GetUsuariosPorUserName(request.Email);
                    /*Se  obtiene el usuario*/

                    /*Se  obtiene el perfil del usuario*/

                    var perfil = perfilseg.GetPerfilbyId(Usuario.IdPerfilSeguridad);
                    /*Se  obtiene el perfil del usuario*/

                    /*Se valida que la nueva contraseña cumpla con los requsitos del perfil*/
                    var ValidPassword = CheckPassword(request.NewPassword, perfil.LenMinPass, perfil.CantLetrasMin, perfil.CantLetrasMayMin, perfil.CantNumeroMin, perfil.CantCharEspecialMin);
                    if (!ValidPassword.IsValid)
                    {
                        respondModel.SetResponse(false, string.Join("\n", ValidPassword.Mensajes));

                        return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);
                    }
                    /*Se valida que la nueva contraseña cumpla con los requsitos del perfil*/

                    /*Se actualiza la nueva contraseña*/
                    Usuario.Password = util.encriptar(request.NewPassword);

                    /*Se guardan los cambios*/
                    respondModel = userlogic.Guardar(Usuario);
                    /*Se guardan los cambios*/


                    if (!respondModel.response)
                        return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);

                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.OK);
                }
            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
        }

        [HttpPost]
        [Route("ResendCodigoValidacionEmailUsuario")]
        public HttpResponseMessage ResendCodigoValidacionEmailUsuario() {
            RespondModel respondModel = new RespondModel();

            ResponseMsj responseMsj = new ResponseMsj();

            try
            {

                var Usuario = userlogic.GetUsuariosPorUserName(UsuarioWebApi.Email);

                var codigoValidacion = codigoValidacionUsuarioLogic.GenerarCodigoValidacionEmailUsuario(Usuario.Id, util.GetKey, util.GetIV);

                if (codigoValidacion == string.Empty)
                {
                    respondModel.SetResponse(false, "Error al generar Pin de Validación");
                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);
                }
                string MessageBody = System.IO.File.ReadAllText(System.Web.HttpContext.Current.Request.MapPath("~\\Content\\email.html"));
                MessageBody = MessageBody.Replace("**To**", Usuario.Email);
                MessageBody = MessageBody.Replace("**Codigo**", codigoValidacion);
                MessageBody = MessageBody.Replace("**Anio**", DateTime.Now.Year.ToString());

                mailer.SendMail(Usuario.Email, "Confirmación de usuario", MessageBody);

                return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.OK);
            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
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
