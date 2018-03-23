using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Entidades;
using Negocio;
namespace INV_MVC.Controllers
{
    public class OperacionesController : Controller
    {
        ProductoLogic productoLogic = new ProductoLogic();
        ClienteLogic clienteLogic = new ClienteLogic();
        // GET: Operaciones
        public ActionResult Entrada()
        {
            ViewBag.Clientes = new SelectList(clienteLogic.GetAll(), "Id", "Nombre");
            return PartialView();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Entrada(Operacion model,string operacion )
        {
            if (model == null)
            {
                model = new Operacion();
            }
            if (operacion == null)
            {
                if (CrearOperacion(model))
                {
                    return RedirectToAction("Entrada");
                }
            }
            else if (operacion == "agregar-detalle")
            {
                model.DetalleOperacion.Add(new DetalleOperacion());
            }
            else if (operacion.StartsWith("eliminar-detalle-")) {
                EliminarDetalleOperacionPorIndice(model, operacion);
            }
            ViewBag.Productos = productoLogic.GetAll();
            ViewBag.Clientes = new SelectList(clienteLogic.GetAll(), "Id", "Nombre");
            return PartialView(model);
        }

        private bool CrearOperacion(Operacion model) {
            if (ModelState.IsValid) {
                if (model.DetalleOperacion != null && model.DetalleOperacion.Count > 0)
                {
                    /*Asigno el Id de la Operacion*/
                    model.Id = 1;
                    return true;
                }
                else {
                    ModelState.AddModelError("", "No se puede guardar factura sin detalla");
                }

            }
            return false;
        }
        private static void EliminarDetalleOperacionPorIndice(Operacion model, string Operacion) {
            string indexStr = Operacion.Replace("eliminar-detalle-", "");
            int index = 0;
            if(int.TryParse(indexStr, out index) && index > 0 && index < model.DetalleOperacion.Count)
            {
                var item = model.DetalleOperacion.ToArray()[index];
                model.DetalleOperacion.Remove(item);
            }
        }
    }
}