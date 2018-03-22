using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Negocio;
using Entidades;

namespace INV_MVC.Controllers
{
    public class ClienteController : baseController
    {
        private ClienteLogic clientelogic = new ClienteLogic();
        // GET: Cliente
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ClienteListar()
        {
            ViewBag.Heading = "Lista de Clientes";
            var Listado = clientelogic.GetAll();
            return PartialView("_ClienteListar", Listado);
        }

        public ActionResult ClienteAdd()
        {
            ViewBag.ModalHeading = "Agregar Cliente";
            Cliente model = new Cliente();
            return PartialView("_ClienteAddUpd", model);
        }

        public ActionResult ClienteEdit(int id)
        {
            ViewBag.ModalHeading = "Editar Cliente";
            Cliente model = clientelogic.GetClientePorId(id);
            return PartialView("_ClienteAddUpd", model);
        }

        [ValidateAntiForgeryToken]
        [HttpPost]

        public ActionResult GuardarCliente(Cliente model)
        {
            ViewBag.ModalHeading = model.IdCliente == 0 ? "Agregar Cliente" : "Editar Cliente";
            //model.UsuarioCrea = Usuario.UserId;
            //model.FechaCreacion = DateTime.Now;
            //model.CategoriaParentId = model.CategoriaParentId ?? 0;
            if (!ModelState.IsValid)
                return PartialView("_ClienteAddUpd", model);
            var respuesta = clientelogic.Guardar(model);
            if (!respuesta.response)
            {
                ModelState.AddModelError("", respuesta.mensaje);
                return PartialView("_ClienteAddUpd", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("ClienteListar");
            return Json(respuesta);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ClienteEliminarById(int id)
        {
            ViewBag.ModalHeading = "Eliminar Cliente";
            if (!ModelState.IsValid)
            {
                Cliente model = clientelogic.GetClientePorId(id);
                return PartialView("_ClienteEliminar", model);

            }
            var respuesta = clientelogic.Eliminar(id);
            if (!respuesta.response)
            {
                Cliente model = clientelogic.GetClientePorId(id);
                return PartialView("_ClienteEliminar", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("ClienteListar");
            return Json(respuesta);
        }

        public ActionResult ClienteEliminar(int id)
        {
            ViewBag.ModalHeading = "Eliminar Categoría";
            Cliente model = clientelogic.GetClientePorId(id);
            return PartialView("_ClienteEliminar", model);
        }
    }
}