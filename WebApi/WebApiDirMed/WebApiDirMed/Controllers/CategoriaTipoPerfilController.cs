using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiDirMed.Models;
using WebApiDirMed.Models.CategoriaTipoPerfilModel;
using Negocio;
namespace WebApiDirMed.Controllers
{
    [Authorize]
    [RoutePrefix("api/CategoriaTipoPerfil")]
    public class CategoriaTipoPerfilController : baseController
    {

        private CategoriaTipoPerfilLogic CategoriaTipoPerfil = new CategoriaTipoPerfilLogic();

        [HttpPost]
        [Route("GetCategoríaPorTipoPerfilId")]
        public HttpResponseMessage RegistrarPerfil(GetCategoríaPorTipoPerfilIdRequest request)
        {

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

                var lista = CategoriaTipoPerfil.GetCategoríaPorTipoPerfilId(request.TipoPerfilId);
                List<GetCategoríaPorTipoPerfilIdRespond> listarespond = new List<GetCategoríaPorTipoPerfilIdRespond>();
                foreach (var item in lista.Where(x=> x.CategoriaParentId== null).ToList())
                {
                    GetCategoríaPorTipoPerfilIdRespond obj = new GetCategoríaPorTipoPerfilIdRespond{ Id=item.Id,Nombre=item.Nombre,DesCategoria=item.DesCategoria };
                    
                    if(item.HijosCategoria != null)
                    {
                        foreach (var item2 in item.HijosCategoria)
                        {
                            GetCategoríaPorTipoPerfilIdRespond objchild = new GetCategoríaPorTipoPerfilIdRespond { Id = item2.Id, Nombre = item2.Nombre, DesCategoria = item2.DesCategoria };
                            obj.CategoriaHijos.Add(objchild);
                        }
                    }
                    
                    listarespond.Add(obj);
                }
                GetCategoríaPorTipoPerfilIdRespond1 responese = new GetCategoríaPorTipoPerfilIdRespond1();
                responese.Categorias = listarespond;
                //if (!respondModel.response)
                //    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);

                /*Creando codigo de validacion*/



                return responseMsj.CreateJsonResponse(responese, HttpStatusCode.OK);
            }
        }

    }
}
