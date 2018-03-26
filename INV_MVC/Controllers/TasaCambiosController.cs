using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Entidades;
using Negocio;

namespace INV_MVC.Controllers
{
    [Authorize]
    public class TasaCambiosController : baseController
    {
        private TasaCambiosLogic TasaLogic = new TasaCambiosLogic();
        private MonedasLogic monedas = new MonedasLogic();
        private Monedas moneda = new Monedas();
        // GET: TasaCambios
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TasaCambiosListar()
        {
            ViewBag.Heading = "Tasa de Cambios";
            var lista = TasaLogic.GetAll();
            return PartialView("_TasaCambiosListar", lista);
        }

        public ActionResult TasaCambiosAdd()
        {
            ViewBag.ModalHeading = "Agregar Tasa de Cambio";
            ViewBag.TasaCambios = new SelectList(monedas.GetAllMonedas(), "Id", "Nombre");
            TasaCambios model = new TasaCambios();
            return PartialView("_TasaCambiosAddUpd", model);
        }

        public ActionResult TasaCambiosEdit(int id)
        {
            ViewBag.ModalHeading = "Editar Tasa de Cambio";
            ViewBag.TasaCambios = new SelectList(monedas.GetAllMonedas(), "Id", "Nombre");
            TasaCambios model = TasaLogic.GetTasaCambiosPorId(id);
            return PartialView("_TasaCambiosAddUpd", model);
        }

        public ActionResult TasaCambiosEliminar(int id)
        {
            ViewBag.ModalHeading = "Eliminar Tasa de Cambio";
            TasaCambios model = TasaLogic.GetTasaCambiosPorId(id);
            return PartialView("_TasaCambiosEliminar", model);
        }


        [ValidateAntiForgeryToken]
        [HttpPost]

        public ActionResult GuardarTasaCambios(TasaCambios model)
        {
            ViewBag.ModalHeading = model.IdTasaCambio == 0 ? "Agregar Tasa de Cambio" : "Editar Tasa de Cambio";
            ViewBag.TasaCambios = new SelectList(monedas.GetAllMonedas(), "Id", "Nombre");
            model.IdUsuarioReg = Usuario.UserId;
            model.FechaReg = DateTime.Now;
            model.IdUsuarioUpd = Usuario.UserId;
            model.FechaUpd = DateTime.Now;

            if (!ModelState.IsValid)
                return PartialView("_TasaCambiosAddUpd", model);
            var respuesta = TasaLogic.Guardar(model);
            if (!respuesta.response)
            {
                ModelState.AddModelError("", respuesta.mensaje);
                return PartialView("_TasaCambiosAddUpd", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("TasaCambiosListar");
            return Json(respuesta);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TasaCambiosEliminarById(int id)
        {
            ViewBag.ModalHeading = "Eliminar Categoría de Productos";
            if (!ModelState.IsValid)
            {
                TasaCambios model = TasaLogic.GetTasaCambiosPorId(id);
                return PartialView("_TasaCambiosEliminar", model);

            }
            var respuesta = TasaLogic.Eliminar(id);
            if (!respuesta.response)
            {
                TasaCambios model = TasaLogic.GetTasaCambiosPorId(id);
                return PartialView("_TasaCambiosEliminar", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("TasaCambiosListar");
            return Json(respuesta);
        }
    }
}