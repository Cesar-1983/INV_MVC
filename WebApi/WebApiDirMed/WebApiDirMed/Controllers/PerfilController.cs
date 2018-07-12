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
using WebApiDirMed.Models.PerfilesModel;

namespace WebApiDirMed.Controllers
{
    [RoutePrefix("api/Perfil")]
    [Authorize]
    public class PerfilController : baseController
    {
        private PerfilesLogic perfilesLogic = new PerfilesLogic();
        //private UsuariosLogic userlogic = new UsuariosLogic();
        //private PerfilSeguridadLogic perfilseg = new PerfilSeguridadLogic();
        //private Utilidades util = new Utilidades();
        //private CodigoValidacionUsuarioLogic codigoValidacionUsuarioLogic = new CodigoValidacionUsuarioLogic();
        //private Mailer mailer = new Mailer();

        [HttpPost]
        [Route("RegistrarPerfil")]
        public HttpResponseMessage RegistrarPerfil(PerfilesViewModelRequest request) {

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
                Perfiles perfil = new Perfiles { Id=request.Id, Nombre=request.Nombre,Apellido=request.Apellido,DescPerfil=request.DescPerfil,
                    TipoPerfilId =request.TipoPerfilId,UsuariosId=UsuarioWebApi.UserId };
                

                respondModel = perfilesLogic.Guardar(perfil);

                
                if(!respondModel.response)
                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);

                /*Creando codigo de validacion*/

                

                return responseMsj.CreateJsonResponse(respondModel,HttpStatusCode.OK);
            }
        }


        [HttpPost]

        [Route("GetPerfilUsuarioByTipoPerfil")]

        public HttpResponseMessage GetPerfilUsuarioByTipoPerfil(GetPerfilUsuarioByTipoPerfil request) {
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

                respondModel.SetResponse(false, string.Join("\n", ErrorList.Select(x => x.Error).ToList()));

                return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);

            }
            else
            {
                


                var perfil = perfilesLogic.GetPerfilByUsuarioTipoPerfil(request.TipoPerfilId, UsuarioWebApi.UserId);


                if (perfil== null)
                {
                    respondModel.SetResponse(false, "No existe ningun perfil de este tipo para el usuario indicado");
                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.NotFound);
                }
                    

                /*Creando codigo de validacion*/



                return responseMsj.CreateJsonResponse(perfil, HttpStatusCode.OK);
            }
        }

        [HttpPost]

        [Route("GetPerfilesByUsuario")]

        public HttpResponseMessage GetPerfilesByUsuario()
        {
            RespondModel respondModel = new RespondModel();
            ResponseMsj responseMsj = new ResponseMsj();

            var perfiles = perfilesLogic.GetPerfilesByUsuario(UsuarioWebApi.UserId);

            var perfilresponse = perfiles.Select(x => new GetPerfilesByUsuarioRespond
            {
                Id = x.Id,
                UsuariosId=x.UsuariosId,
                Nombre = x.Nombre,
                Apellido = x.Apellido,
                DescPerfil = x.DescPerfil,
                DescTipoPerfil = x.TipoPerfil.DescTipoPerfil,
                TipoPerfilId = x.TipoPerfilId
            });

            if (perfiles.Count > 0)
            {
                return responseMsj.CreateJsonResponse(perfilresponse, HttpStatusCode.OK);
            }
            else {
                respondModel.SetResponse(false, "Sin Perfiles definidos");
                return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.NotFound);
            }
            
        }
        //public HttpResponseMessage EmailConfirmacion(EmailConfirmacionRequest request) {
        //    RespondModel respondModel = new RespondModel();
        //    ResponseMsj responseMsj = new ResponseMsj();
        //    if (!ModelState.IsValid)
        //    {
        //        var ErrorList = ModelState.Keys
        //        .SelectMany(key => ModelState[key].Errors.Select(x => new { Error = key + " " + x.ErrorMessage })
        //        .ToList());

        //        respondModel.SetResponse(false, string.Join("\n", ErrorList.Select(x => x.Error).ToList()));

        //        return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);

        //    }
        //    var responloging = userlogic.ValidatePasswordUser(request.Email, request.Password, util.GetKey, util.GetIV);

        //    if (!responloging.response)
        //    {
        //        return responseMsj.CreateJsonResponse(responloging, HttpStatusCode.BadRequest);
        //    }

        //    /*Se  obtiene el usuario*/
        //    var Usuario = userlogic.GetUsuariosPorUserName(request.Email);
        //    /*Se  obtiene el usuario*/

        //    /*Se  obtiene el codigo de validación del usuario*/
        //    var CodigoVal = codigoValidacionUsuarioLogic.GetCodigoValidacionEmailByUsuario(Usuario.Id);
        //    /*Se  obtiene el codigo de validación del usuario*/

        //    if (CodigoVal.Codigo != request.Codigo)
        //    {
        //        respondModel.SetResponse(false, "El codigo de validación no coincide");
        //        return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);
        //    }

        //    var EmailConfirmed = userlogic.EmailConfirmacion(Usuario.Id);

        //    return responseMsj.CreateJsonResponse(EmailConfirmed, EmailConfirmed.response?HttpStatusCode.OK: HttpStatusCode.BadRequest);


        //}

        //[HttpPost]
        //[Route("GetAllUsuarios")]
        //public HttpResponseMessage GetAllUser() {
        //    ResponseMsj responseMsj = new ResponseMsj();
        //    var usuarios = userlogic.GetAllUsuarios();
        //    return responseMsj.CreateJsonResponse(usuarios, HttpStatusCode.OK);
        //}

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
