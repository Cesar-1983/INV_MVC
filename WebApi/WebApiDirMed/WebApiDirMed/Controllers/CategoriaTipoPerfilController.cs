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
        private PerfilesLogic perfilesLogic = new PerfilesLogic();
        private Perfiles_CategoriaTipoPerfilLogic perfiles_CategoriaTipoPerfilLogic = new Perfiles_CategoriaTipoPerfilLogic();

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
                /*Se obtiene todas las categorias disponibles*/
                var lista = CategoriaTipoPerfil.GetCategoríaPorTipoPerfilId(request.TipoPerfilId);
                /*Se obtiene todas las categorias disponibles*/

                /*Se obtiene el perfil*/
                var perfil = perfilesLogic.GetPerfilByUsuarioTipoPerfil(request.TipoPerfilId, UsuarioWebApi.UserId);
                /*Se obtiene el perfil*/

                /*Se obtiene las categorias seleccionadas del perfil del usuario*/
                var ListaCategoriaSelected = perfiles_CategoriaTipoPerfilLogic.GetPerfiles_CategoriaTipoPerfilByPerfilId(perfil.Id);
                /*Se obtiene las categorias seleccionadas del perfil del usuario*/

                List<GetCategoríaPorTipoPerfilIdRespond> listarespond = new List<GetCategoríaPorTipoPerfilIdRespond>();
                foreach (var item in lista.Where(x=> x.CategoriaParentId== null).ToList())
                {
                    GetCategoríaPorTipoPerfilIdRespond obj = new GetCategoríaPorTipoPerfilIdRespond{ Id=item.Id,Nombre=item.Nombre,DesCategoria=item.DesCategoria };
                    
                    if(item.HijosCategoria != null)
                    {
                        foreach (var item2 in item.HijosCategoria)
                        {
                            GetCategoríaPorTipoPerfilIdRespond objchild = new GetCategoríaPorTipoPerfilIdRespond { Id = item2.Id, Nombre = item2.Nombre, DesCategoria = item2.DesCategoria,Selected = ListaCategoriaSelected.Any(s=> s.CategoriaTipoPerfilId== item2.Id) };
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

        [HttpPost]
        [Route("GetAllCategoríaByPerfilIdSelected")]
        public HttpResponseMessage GetAllCategoríaByPerfilIdSelected(GetCategoríaPorTipoPerfilIdRequest request)
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
                /*Se obtiene todas las categorias disponibles*/
                var lista = CategoriaTipoPerfil.GetCategoríaPorTipoPerfilId(request.TipoPerfilId);
                /*Se obtiene todas las categorias disponibles*/

                /*Se obtiene el perfil*/
                var perfil = perfilesLogic.GetPerfilByUsuarioTipoPerfil(request.TipoPerfilId, UsuarioWebApi.UserId);
                /*Se obtiene el perfil*/

                /*Se obtiene las categorias seleccionadas del perfil del usuario*/
                var ListaCategoriaSelected = perfiles_CategoriaTipoPerfilLogic.GetPerfiles_CategoriaTipoPerfilByPerfilId(perfil.Id);
                /*Se obtiene las categorias seleccionadas del perfil del usuario*/

                List<GetCategoríaPorTipoPerfilIdRespond> listarespond = new List<GetCategoríaPorTipoPerfilIdRespond>();
                foreach (var item in lista.Where(x => x.CategoriaParentId == null).ToList())
                {
                    GetCategoríaPorTipoPerfilIdRespond obj = new GetCategoríaPorTipoPerfilIdRespond { Id = item.Id, Nombre = item.Nombre, DesCategoria = item.DesCategoria };

                    if (item.HijosCategoria != null)
                    {
                        foreach (var item2 in item.HijosCategoria)
                        {
                            GetCategoríaPorTipoPerfilIdRespond objchild = new GetCategoríaPorTipoPerfilIdRespond { Id = item2.Id, Nombre = item2.Nombre, DesCategoria = item2.DesCategoria, Selected = ListaCategoriaSelected.Any(s => s.CategoriaTipoPerfilId == item2.Id) };
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



        [HttpPost]
        [Route("SaveCategoríaByPerfilIdSelected")]
        public HttpResponseMessage SaveCategoríaByPerfilIdSelected(SaveCategoríaByPerfilIdSelectedrequest request) {
            RespondModel respondModel = new RespondModel();

            ResponseMsj responseMsj = new ResponseMsj();
            try
            {
                /*Se obtiene el perfil*/
                var perfil = perfilesLogic.GetPerfilByUsuarioTipoPerfil(request.TipoPerfilId, UsuarioWebApi.UserId);
                /*Se obtiene el perfil*/

                var listint = request.SaveCategoríaByPerfilIdSelected.Select(x => x.CategoriaTipoPerfilId).ToList();


                respondModel= perfiles_CategoriaTipoPerfilLogic.GuardarCategoriasMasivo(perfil.Id, listint);

                if(!respondModel.response)
                    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);

                return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.OK);

                ///*Se eliminan todos las categorias relacionadas*/
                //respondModel = perfiles_CategoriaTipoPerfilLogic.EliminarAllCategoriaPerfil(perfil.Id);
                //if (!respondModel.response)
                //{
                //    respondModel.SetResponse(false, respondModel.mensaje);
                //    return responseMsj.CreateJsonResponse(respondModel, HttpStatusCode.BadRequest);
                //}

                ///*Se eliminan todos las categorias relacionadas*/



                ///*Se asocian las categorias seleccionas*/
                //List<string> errores = new List<string>();
                //foreach (var item in request.SaveCategoríaByPerfilIdSelected)
                //{
                //    respondModel = perfiles_CategoriaTipoPerfilLogic.Guardar(new Perfiles_CategoriaTipoPerfil { PerfilesId = perfil.Id, CategoriaTipoPerfilId = item.CategoriaTipoPerfilId });
                //    if (!respondModel.response) {
                //        errores.Add(respondModel.mensaje);
                //    }
                //}
                ///*Se asocian las categorias seleccionas*/
                ///


                return responseMsj.CreateJsonResponse("OK", HttpStatusCode.OK);
            }
            catch (Exception)
            {

                
                return responseMsj.CreateJsonResponse("Error", HttpStatusCode.OK);
            }
        }

    }
}
