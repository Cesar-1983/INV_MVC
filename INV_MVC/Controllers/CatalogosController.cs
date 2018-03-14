using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Negocio;
using Entidades;
namespace INV_MVC.Controllers
{
    public class CatalogosController : Controller
    {
        private EstadoUsuariosLogic EstadoUsuariosLogic = new EstadoUsuariosLogic();
        // GET: Catalogos
        public ActionResult Index()
        {
            return View();
        }
        #region Metodos EstadoUsuarios
        public ActionResult EstadosUsuariosListar()
        {
            ViewBag.Heading = "Lista de Estados Usuarios";
            var lista = EstadoUsuariosLogic.GetAllEstadosUsuarios();
            return PartialView("_EstadosUsuariosListar", lista);
        }
        public ActionResult EstadosUsuariosAdd() {
            ViewBag.ModalHeading = "Agregar Estado Usuario";
            EstadoUsuarios model = new EstadoUsuarios();
            return PartialView("_EstadosUsuariosAddUpd", model);
        }

        public ActionResult EstadosUsuariosEdit(int id)
        {
            ViewBag.ModalHeading = "Editar Estado Usuario";
            EstadoUsuarios model = EstadoUsuariosLogic.GetEstadosUsuariosById(id);
            return PartialView("_EstadosUsuariosAddUpd", model);
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult GuardarEstadosUsuarios(EstadoUsuarios model) {
            if(!ModelState.IsValid)
                return PartialView("_EstadosUsuariosAddUpd", model);
            var respuesta = EstadoUsuariosLogic.Guardar(model);
            if (!respuesta.response)
            {
                ModelState.AddModelError("", respuesta.mensaje);
                return PartialView("_EstadosUsuariosAddUpd", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("EstadosUsuariosListar");
            return Json(respuesta);

        }
        public ActionResult EstadosUsuariosEliminar(int id) {
            ViewBag.ModalHeading = "Eliminar Estado Usuario";
            EstadoUsuarios model = EstadoUsuariosLogic.GetEstadosUsuariosById(id);
            return PartialView("_EstadosUsuariosEliminar", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EstadosUsuariosEliminarById(int id)
        {
            ViewBag.ModalHeading = "Eliminar Estado Usuario";
            if (!ModelState.IsValid) {
                EstadoUsuarios model = EstadoUsuariosLogic.GetEstadosUsuariosById(id);
                return PartialView("_EstadosUsuariosEliminar", model);
                
            }
            var respuesta = EstadoUsuariosLogic.Eliminar(id);
            if (!respuesta.response)
            {
                EstadoUsuarios model = EstadoUsuariosLogic.GetEstadosUsuariosById(id);
                return PartialView("_EstadosUsuariosEliminar", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("EstadosUsuariosListar");
            return Json(respuesta);
        }
        public ActionResult ReturJson(int id) {
            var respuesta = new RespondModel();
            respuesta.href = Url.Action("EstadosUsuariosListar");
            return Json(respuesta,JsonRequestBehavior.AllowGet);
        }
        #endregion


    }
}