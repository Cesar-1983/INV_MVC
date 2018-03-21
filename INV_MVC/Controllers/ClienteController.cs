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
    }
}