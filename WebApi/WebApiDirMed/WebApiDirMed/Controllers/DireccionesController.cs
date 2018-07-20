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
namespace WebApiDirMed.Controllers
{
    [RoutePrefix("api/Direcciones")]
    [Authorize]
    public class DireccionesController : baseController
    {
        private DireccionesLogic direccionesLogic = new DireccionesLogic();

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
        public HttpResponseMessage GetDireccionesByPerfil(int PerfilId)
        {
            ResponseMsj responseMsj = new ResponseMsj();
            List<GetDireccionesByPerfilRespond> lista = new List<GetDireccionesByPerfilRespond>();
            try
            {
                lista = direccionesLogic.GetDireccionesByPerfil(PerfilId).Select(x=>  new GetDireccionesByPerfilRespond { Id=x.Id,PefilId = x.PefilId,Direccion=x.Direccion,latitud=x.latitud,longitud=x.longitud }).ToList() ;
                return responseMsj.CreateJsonResponse(lista, HttpStatusCode.OK);
            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
        }

        [HttpPost]
        [Route("GuardarDireccion")]
        public HttpResponseMessage GuardarDireccion(GetDireccionesByPerfilRespond model)
        {
            ResponseMsj responseMsj = new ResponseMsj();
            try
            {
                var response = direccionesLogic.Guardar(new Direcciones { Id = model.Id, PefilId = model.PefilId, Direccion = model.Direccion, latitud = model.latitud, longitud = model.longitud });

                if(response.response)
                    return responseMsj.CreateJsonResponse(response, HttpStatusCode.OK);
                else
                    return responseMsj.CreateJsonResponse(response, HttpStatusCode.OK);
                
            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
        }

    }
}
