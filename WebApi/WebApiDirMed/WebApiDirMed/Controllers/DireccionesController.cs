using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiDirMed.Models;
using WebApiDirMed.Models.DireccionesModel;
using WebApiDirMed.Models.PerfilesModel;

namespace WebApiDirMed.Controllers
{
    [RoutePrefix("api/Direcciones")]
    [Authorize]
    public class DireccionesController : baseController
    {
        private DireccionesLogic direccionesLogic = new DireccionesLogic();
        private PerfilesLogic perfilesLogic = new PerfilesLogic();

        [HttpPost]
        [Route("GetAllDirecciones")]
        public HttpResponseMessage GetAllDirecciones()
        {
            ResponseMsj responseMsj = new ResponseMsj();
            List<Direcciones> lista = new List<Direcciones>();
            try
            {
                lista = direccionesLogic.GetAllDirecciones();
                return responseMsj.CreateJsonResponse(lista, HttpStatusCode.OK);
            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
        }

        [HttpPost]
        [Route("GetDireccionesByPerfil")]
        public HttpResponseMessage GetDireccionesByPerfil(GetPerfilUsuarioByTipoPerfil request)
        {
            ResponseMsj responseMsj = new ResponseMsj();
            RespondModel respondModel = new RespondModel();

            List<GetDireccionesByPerfil> lista = new List<GetDireccionesByPerfil>();
            try
            {
                var perfil = perfilesLogic.GetPerfilByUsuarioTipoPerfil(request.TipoPerfilId, UsuarioWebApi.UserId);


                if (perfil == null)
                {
                    respondModel.SetResponse(false, "No existe ningun perfil de este tipo para el usuario indicado");
                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.NotFound);
                }
                lista = direccionesLogic.GetDireccionesByPerfil(perfil.Id).Select(x=>  new GetDireccionesByPerfil { Id=x.Id,PerfilId = x.PerfilId,Direccion=x.Direccion,latitud=x.latitud,longitud=x.longitud }).ToList() ;
                return responseMsj.CreateJsonResponse(new GetDireccionesByPerfilRespond { Direcciones = lista ,PerfilId=perfil.Id}, HttpStatusCode.OK);
            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
        }

        [HttpPost]
        [Route("GetDireccionBy_Id_PerfilId")]
        public HttpResponseMessage GetDireccionBy_Id_PerfilId(GetDireccionBy_Id_PerfilId_Request request)
        {
            ResponseMsj responseMsj = new ResponseMsj();
            RespondModel respondModel = new RespondModel();

            GetDireccionesByPerfil direccion = new GetDireccionesByPerfil();
            try
            {

                var direcciones = direccionesLogic.GetDireccionBy_Id_PerfilId(request.Id, request.PerfilId);
                direccion.Id = direcciones.Id;
                direccion.PerfilId = direcciones.PerfilId==0?request.PerfilId: direcciones.PerfilId;
                direccion.Direccion = direcciones.Direccion;
                direccion.latitud = direcciones.latitud;
                direccion.longitud = direcciones.longitud;

                return responseMsj.CreateJsonResponse( direccion, HttpStatusCode.OK);
            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
        }


        [HttpPost]
        [Route("GuardarDireccion")]
        public HttpResponseMessage GuardarDireccion(GetDireccionesByPerfil model)
        {
            ResponseMsj responseMsj = new ResponseMsj();
            try
            {
                var response = direccionesLogic.Guardar(new Direcciones { Id = model.Id, PerfilId = model.PerfilId, Direccion = model.Direccion, latitud = model.latitud, longitud = model.longitud });

                if(!response.response)
                    return responseMsj.CreateJsonResponse(response, HttpStatusCode.OK);
                else
                    return responseMsj.CreateJsonResponse(response, HttpStatusCode.BadRequest);
                
            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
        }

    }
}
