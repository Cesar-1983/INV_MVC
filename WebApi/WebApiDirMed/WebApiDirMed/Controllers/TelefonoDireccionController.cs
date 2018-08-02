using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Entidades;
using Negocio;
using WebApiDirMed.Models;
using WebApiDirMed.Models.TelefonoDireccion;

namespace WebApiDirMed.Controllers
{
    [RoutePrefix("api/TelefonoDireccion")]
    [Authorize]
    public class TelefonoDireccionController : baseController
    {
        #region Negocio
        private Telefonos_DireccionLogic _telefonoDireccionLogic = new Telefonos_DireccionLogic();

        #endregion


        [HttpPost]
        [Route("GetAllTelefonosByDireccionId")]
        public HttpResponseMessage GetAllTelefonosByDireccionId(int DireccionId)
        {
            ResponseMsj responseMsj = new ResponseMsj();
            List<Telefonos_Direccion> lista = new List<Telefonos_Direccion>();
            try
            {
                lista = _telefonoDireccionLogic.GetAllTelefonosByDireccionId(DireccionId);
                return responseMsj.CreateJsonResponse(lista, HttpStatusCode.OK);
            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
        }

        [HttpPost]
        [Route("Eliminar")]
        public HttpResponseMessage Eliminar(TelefonoDireccionRequest request)
        {
            ResponseMsj responseMsj = new ResponseMsj();
            try
            {
                var response = _telefonoDireccionLogic.Eliminar(new Telefonos_Direccion { Id=request.Id,DireccionId=request.DireccionId });

                if (!response.response)
                    return responseMsj.CreateJsonResponse(response, HttpStatusCode.OK);
                else
                    return responseMsj.CreateJsonResponse(response, HttpStatusCode.BadRequest);

            }
            catch (Exception ex)
            {

                return responseMsj.CreateJsonResponse(ex.Message, HttpStatusCode.BadRequest);
            }
        }

        [HttpPost]
        [Route("Guardar")]
        public HttpResponseMessage Guardar(TelefonoDireccionRequest request)
        {
            ResponseMsj responseMsj = new ResponseMsj();
            try
            {
                var response = _telefonoDireccionLogic.Eliminar(new Telefonos_Direccion { Id = request.Id, DireccionId = request.DireccionId,Telefono=request.Telefono,DescTelefono=request.DescTelefono });

                if (!response.response)
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
