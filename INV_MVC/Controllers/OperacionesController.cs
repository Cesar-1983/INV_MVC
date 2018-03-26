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
    public class OperacionesController : baseController
    {
        ProductoLogic productoLogic = new ProductoLogic();
        ClienteLogic clienteLogic = new ClienteLogic();
        OperacionLogic operacionLogic = new OperacionLogic();

        public ActionResult OperacionesListar() {
            ViewBag.breadcrumb = "Operaciones/Lista de Operaciones";
            ViewBag.pageheader = "Lista de Operaciones";

            ViewBag.Heading = "Lista de Operaciones";
           var model = operacionLogic.GetAll();
            return PartialView("_OperacionesListar",model);
        }
        // GET: Operaciones
        public ActionResult Entrada(int operacion)
        {
            ViewBag.breadcrumb = "Catalogos/"+ (operacion == 1 ? "Entrada de Inventario" : "Salida de inventario");
            ViewBag.pageheader = "Estado de Usuarios";
            ViewBag.Heading = operacion == 1 ? "Entrada de Inventario" : "Salida de inventario";
            var model = new Operacion { IdTipoOperacion = operacion, Total = 0, CantProductos = 0 ,UsuarioCrea=Usuario.UserId,Estado="ACT"};
            
            ViewBag.Clientes = new SelectList(clienteLogic.GetAll(), "IdCliente", "Nombre");
            return PartialView(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Entrada(Operacion model,string operacion )
        {
            ViewBag.breadcrumb = "Catalogos/" + (model.IdTipoOperacion == 1 ? "Entrada de Inventario" : "Salida de inventario");
            ViewBag.pageheader = "Estado de Usuarios";

            ViewBag.Heading = model.IdTipoOperacion == 1 ? "Entrada de Inventario" : "Salida de inventario";
            if (model == null)
            {
                model = new Operacion();
            }
            if (operacion == null)
            {
                if (CrearOperacion(model))
                {
                    ViewBag.Heading = "Lista de Operaciones";
                    var listaoperaciones = operacionLogic.GetAll();

                    return PartialView("_OperacionesListar", listaoperaciones);
                }
                
            }
            else if (operacion == "agregar-detalle")
            {
                model.DetalleOperacion.Add(new DetalleOperacion());
            }
            else if (operacion.StartsWith("eliminar-detalle-")) {
                EliminarDetalleOperacionPorIndice(model, operacion);
            }
            var ListadoProductos = productoLogic.GetAll();
            if (model.IdTipoOperacion != 1)
                ListadoProductos = ListadoProductos.Where(x => x.Stock > 0).ToList();
            ViewBag.Productos = ListadoProductos;
            ViewBag.Clientes = new SelectList(clienteLogic.GetAll(), "IdCliente", "Nombre");
            return PartialView(model);
        }

        private bool CrearOperacion(Operacion model) {
            if (ModelState.IsValid) {
                if (model.DetalleOperacion != null && model.DetalleOperacion.Count > 0)
                {
                    var respuesta = operacionLogic.Guardar(model);
                    if(respuesta.NoError==0)
                        return true;
                    else
                        ModelState.AddModelError("", respuesta.Mensaje);
                }
                else {
                    ModelState.AddModelError("", "No se puede guardar factura sin detalle");
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

        public decimal GetPrecioProducto(int producto, string tipo) {
            
            if (tipo == "in")
            {
                return productoLogic.GetPrecioInPorProducto(producto);
            }
            else {
                return productoLogic.GetPrecioOutPorProducto(producto);
            }
        }
    }
}