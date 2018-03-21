using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Negocio;
using Entidades;
using System.IO;

namespace INV_MVC.Controllers
{
    public class CatalogosController : baseController
    {
        private EstadoUsuariosLogic EstadoUsuariosLogic = new EstadoUsuariosLogic();
        private CategoriaLogic categoriaLogic = new CategoriaLogic();
        private UnidadesLogic unidadesLogic = new UnidadesLogic();
        private MonedasLogic monedasLogic = new MonedasLogic();
        private ProductoLogic productoLogic = new ProductoLogic();
        private ProductoImagesLogic productoImagesLogic = new ProductoImagesLogic();

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
        public ActionResult EstadosUsuariosAdd()
        {
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
        public ActionResult GuardarEstadosUsuarios(EstadoUsuarios model)
        {
            if (!ModelState.IsValid)
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
        public ActionResult EstadosUsuariosEliminar(int id)
        {
            ViewBag.ModalHeading = "Eliminar Estado Usuario";
            EstadoUsuarios model = EstadoUsuariosLogic.GetEstadosUsuariosById(id);
            return PartialView("_EstadosUsuariosEliminar", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EstadosUsuariosEliminarById(int id)
        {
            ViewBag.ModalHeading = "Eliminar Estado Usuario";
            if (!ModelState.IsValid)
            {
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
        public ActionResult ReturJson(int id)
        {
            var respuesta = new RespondModel();
            respuesta.href = Url.Action("EstadosUsuariosListar");
            return Json(respuesta, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region MetodosCategoría

        public ActionResult CategoriasListar()
        {
            ViewBag.Heading = "Lista de Categorías";
            var lista = categoriaLogic.GetAll();
            return PartialView("_CategoriasListar", lista);
        }

        public ActionResult CategoriaAdd()
        {
            ViewBag.ModalHeading = "Agregar Categoría de Productos";
            ViewBag.Categorias = new SelectList(categoriaLogic.GetAll(), "Id", "Nombre");
            Categoria model = new Categoria();
            return PartialView("_CategoriasAddUpd", model);
        }

        public ActionResult CategoriaEdit(int id)
        {
            ViewBag.ModalHeading = "Editar Categoría de Productos";
            ViewBag.Categorias = new SelectList(categoriaLogic.GetAll(), "Id", "Nombre");
            Categoria model = categoriaLogic.GetCategoríaPorId(id);
            return PartialView("_CategoriasAddUpd", model);
        }

        public ActionResult CategoriaEliminar(int id)
        {
            ViewBag.ModalHeading = "Eliminar Categoría";
            Categoria model = categoriaLogic.GetCategoríaPorId(id);
            return PartialView("_CategoriaEliminar", model);
        }


        [ValidateAntiForgeryToken]
        [HttpPost]

        public ActionResult GuardarCategoria(Categoria model)
        {
            ViewBag.ModalHeading = model.Id == 0 ? "Agregar Categoría de Producto" : "Editar Categoría de Productos";
            ViewBag.Categorias = new SelectList(categoriaLogic.GetAll(), "Id", "Nombre");
            model.UsuarioCrea = Usuario.UserId;
            model.FechaCreacion = DateTime.Now;
            //model.CategoriaParentId = model.CategoriaParentId ?? 0;
            if (!ModelState.IsValid)
                return PartialView("_CategoriasAddUpd", model);
            var respuesta = categoriaLogic.Guardar(model);
            if (!respuesta.response)
            {
                ModelState.AddModelError("", respuesta.mensaje);
                return PartialView("_CategoriasAddUpd", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("CategoriasListar");
            return Json(respuesta);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CategoriaEliminarById(int id)
        {
            ViewBag.ModalHeading = "Eliminar Categoría de Productos";
            if (!ModelState.IsValid)
            {
                Categoria model = categoriaLogic.GetCategoríaPorId(id);
                return PartialView("_CategoriaEliminar", model);

            }
            var respuesta = categoriaLogic.Eliminar(id);
            if (!respuesta.response)
            {
                Categoria model = categoriaLogic.GetCategoríaPorId(id);
                return PartialView("_CategoriaEliminar", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("CategoriasListar");
            return Json(respuesta);
        }

        #endregion

        #region MetodosUnidades

        public ActionResult UnidadesListar()
        {
            ViewBag.Heading = "Lista de Unidades de Productos";
            var lista = unidadesLogic.GetAll();
            return PartialView("_UnidadesListar", lista);
        }

        public ActionResult UnidadAdd()
        {
            ViewBag.ModalHeading = "Agregar Unidades de Productos";
            //ViewBag.Unidades = new SelectList(unidadesLogic.GetAll(), "Id", "Nombre");
            Unidades model = new Unidades();
            return PartialView("_UnidadesAddUpd", model);
        }

        public ActionResult UnidadEdit(int id)
        {
            ViewBag.ModalHeading = "Editar Unidades de Productos";

            Unidades model = unidadesLogic.GetUnidadesPorId(id);
            return PartialView("_UnidadesAddUpd", model);
        }

        public ActionResult UnidadEliminar(int id)
        {
            ViewBag.ModalHeading = "Eliminar Unidad";
            Unidades model = unidadesLogic.GetUnidadesPorId(id);
            return PartialView("_UnidadEliminar", model);
        }


        [ValidateAntiForgeryToken]
        [HttpPost]

        public ActionResult GuardarUnidad(Unidades model)
        {
            ViewBag.ModalHeading = model.Id == 0 ? "Agregar Unidades de Producto" : "Editar Unidades de Productos";

            model.UsuarioCrea = Usuario.UserId;
            model.FechaCreacion = DateTime.Now;

            if (!ModelState.IsValid)
                return PartialView("_UnidadesAddUpd", model);
            var respuesta = unidadesLogic.Guardar(model);
            if (!respuesta.response)
            {
                ModelState.AddModelError("", respuesta.mensaje);
                return PartialView("_UnidadesAddUpd", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("UnidadesListar");
            return Json(respuesta);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UnidadEliminarById(int id)
        {
            ViewBag.ModalHeading = "Eliminar Unidades de Productos";
            if (!ModelState.IsValid)
            {
                Unidades model = unidadesLogic.GetUnidadesPorId(id);
                return PartialView("_UnidadEliminar", model);

            }
            var respuesta = unidadesLogic.Eliminar(id);
            if (!respuesta.response)
            {
                Unidades model = unidadesLogic.GetUnidadesPorId(id);
                return PartialView("_UnidadEliminar", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("UnidadesListar");
            return Json(respuesta);
        }
        #endregion
        #region MetodosMonedas
        public ActionResult MonedasListar()
        {
            ViewBag.Heading = "Lista de Estados Usuarios";
            var lista = monedasLogic.GetAllMonedas();
            return PartialView("_MonedasListar", lista);
        }
        public ActionResult MonedaAdd()
        {
            ViewBag.ModalHeading = "Agregar Moneda";
            Monedas model = new Monedas();
            return PartialView("_MonedaAddUpd", model);
        }


        public ActionResult MonedaEdit(int id)
        {
            ViewBag.ModalHeading = "Editar Moneda";
            Monedas model = monedasLogic.GetMonedasPorId(id);
            return PartialView("_MonedaAddUpd", model);
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult GuardarMoneda(Monedas model)
        {
            if (!ModelState.IsValid)
                return PartialView("_MonedaAddUpd", model);
            var respuesta = monedasLogic.Guardar(model);
            if (!respuesta.response)
            {
                ModelState.AddModelError("", respuesta.mensaje);
                return PartialView("_MonedaAddUpd", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("MonedasListar");
            return Json(respuesta);

        }
        public ActionResult MonedaEliminar(int id)
        {
            ViewBag.ModalHeading = "Eliminar Estado Usuario";
            Monedas model = monedasLogic.GetMonedasPorId(id);
            return PartialView("_MonedaEliminar", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult MonedaEliminarById(int id)
        {
            ViewBag.ModalHeading = "Eliminar Estado Usuario";
            if (!ModelState.IsValid)
            {
                Monedas model = monedasLogic.GetMonedasPorId(id);
                return PartialView("_MonedaEliminar", model);

            }
            var respuesta = monedasLogic.Eliminar(id);
            if (!respuesta.response)
            {
                Monedas model = monedasLogic.GetMonedasPorId(id);
                return PartialView("_MonedaEliminar", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("MonedasListar");
            return Json(respuesta);
        }
        #endregion

        #region MetodosProducto
        public ActionResult ProductosListar()
        {
            ViewBag.Heading = "Lista de Productos";
            ViewBag.Categorias = new SelectList(categoriaLogic.GetAll(), "Id", "Nombre");
            ViewBag.Unidades = new SelectList(unidadesLogic.GetAll(), "Id", "Codigo");
            ViewBag.Monedas = new SelectList(monedasLogic.GetAllMonedas(), "Id", "Nombre");

            var lista = productoLogic.GetAll();
            return PartialView("_ProductosListar", lista);
        }

        public ActionResult ProductoAdd() {
            ViewBag.Heading = "Agregar Producto";
            ViewBag.Categorias = new SelectList(categoriaLogic.GetAll(), "Id", "Nombre");
            ViewBag.Unidades = new SelectList(unidadesLogic.GetAll(), "Id", "Codigo");
            ViewBag.Monedas = new SelectList(monedasLogic.GetAllMonedas(), "Id", "Nombre");
            Producto model = new Producto();
            return PartialView("_ProductoAddUpd", model);
        }

        public ActionResult ProductoEdit(int id)
        {
            ViewBag.Heading = "Agregar Producto";
            ViewBag.Categorias = new SelectList(categoriaLogic.GetAll(), "Id", "Nombre");
            ViewBag.Unidades = new SelectList(unidadesLogic.GetAll(), "Id", "Codigo");
            ViewBag.Monedas = new SelectList(monedasLogic.GetAllMonedas(), "Id", "Nombre");
            Producto model = productoLogic.GetProductoPorId(id) ;
            return PartialView("_ProductoAddUpd", model);
        }

        public ActionResult GuardarProducto(Producto model)
        {
            ViewBag.ModalHeading = model.Id == 0 ? "Agregar Producto" : "Editar Producto";
            ViewBag.Categorias = new SelectList(categoriaLogic.GetAll(), "Id", "Nombre");
            ViewBag.Unidades = new SelectList(unidadesLogic.GetAll(), "Id", "Codigo");
            ViewBag.Monedas = new SelectList(monedasLogic.GetAllMonedas(), "Id", "Nombre");
            model.UsuarioCrea = Usuario.UserId;

            if (!ModelState.IsValid)
                return PartialView("_ProductoAddUpd", model);
            var respuesta = productoLogic.Guardar(model);
            if (!respuesta.response)
            {
                ModelState.AddModelError("", respuesta.mensaje);
                return PartialView("_ProductoAddUpd", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("ProductosListar");
            return Json(respuesta);
        }

        public ActionResult ProductImageAdd(int IdProducto) {
            ViewBag.ModalHeading = "Agregar Imagen del Producto";
            ProductoImages model = new ProductoImages();
            model.IdProducto = IdProducto;
            return PartialView("_ProductoImageAddUpd", model);
        }
        public ActionResult ProductImageEdit(int id)
        {
            ViewBag.ModalHeading = "Agregar Imagen del Producto";
            ProductoImages model = productoImagesLogic.GetProductoPorId(id);
            return PartialView("_ProductoImageAddUpd", model);
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult GuardarProductoImages([Bind(Exclude = "productoimage")] ProductoImages model) {
            ViewBag.ModalHeading = model.Id == 0 ? "Agregar Imagen de Producto" : "Editar Imagen de Productos";
            byte[] imageData = null;
            if (!ModelState.IsValid)
                return PartialView("_ProductoImageAddUpd", model);

            if (Request.Files.Count > 0)
            {
                HttpPostedFileBase Imagen = Request.Files["productoimage"];
                using (var binary = new BinaryReader(Imagen.InputStream))
                {
                    imageData = binary.ReadBytes(Imagen.ContentLength);
                }
            }
            else
            {
                string fileName = HttpContext.Server.MapPath(@"~/images/no-image.png");
                FileInfo fileInfo = new FileInfo(fileName);
                long imageFileLength = fileInfo.Length;
                FileStream fs = new FileStream(fileName, FileMode.Open, FileAccess.Read);
                BinaryReader br = new BinaryReader(fs);
                imageData = br.ReadBytes((int)imageFileLength);
            }
            model.Image = imageData;
            model.UsuarioCrea = Usuario.UserId;
            var respuesta = productoImagesLogic.Guardar(model);
            if (!respuesta.response)
            {
                ModelState.AddModelError("", respuesta.mensaje);
                return PartialView("_ProductoImageAddUpd", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("ProductosListar");
            return Json(respuesta);
        }
        #endregion

    }
}