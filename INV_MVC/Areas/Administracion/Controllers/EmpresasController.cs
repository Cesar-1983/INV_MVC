using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Entidades;
using Negocio;

namespace INV_MVC.Areas.Administracion.Controllers
{
    public class EmpresasController : Controller
    {
        private EmpresasLogic _bll_emp = new EmpresasLogic();
        private SectoresLogic _bll_sectores = new SectoresLogic();
        private PaisesLogic _bll_paises = new PaisesLogic();

        // GET: Administracion/Empresas
        public ActionResult Index() {
            return View();
        }
        public ActionResult EmpresasListar()
        {
            ViewBag.breadcrumb = "Empresas/Lista de Empresas";
            ViewBag.pageheader = "Empresas";
            ViewBag.Heading = "Lista de Empresas";
            var lista = _bll_emp.GetAllEmpresas();
            return PartialView("_EmpresasListar", lista);
        }

        public ActionResult EmpresasAdd()
        {
            ViewBag.ModalHeading = "Agregar Estado Usuario";
            ViewBag.Paises = new SelectList(_bll_paises.GetAllPaises(), "Id", "Nombre");
            ViewBag.Sectores = new SelectList(_bll_sectores.GetAllSectores() , "Id", "Nombre");
            Empresas model = new Empresas();
            return PartialView("_EmpresasAddUpd", model);
        }

        public ActionResult EmpresasEdit(int id)
        {
            ViewBag.ModalHeading = "Editar Estado Usuario";
            ViewBag.Paises = new SelectList(_bll_paises.GetAllPaises(), "Id", "Nombre");
            ViewBag.Sectores = new SelectList(_bll_sectores.GetAllSectores(), "Id", "Nombre");

            Empresas model = _bll_emp.GetEmpresaById(id);
            return PartialView("_EmpresasAddUpd", model);
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult GuardarEmpresas([Bind(Exclude = "EmpresaLogo")] Empresas model)
        {
            Empresas emp = new Empresas
            {
                Id = model.Id, PaisId=model.PaisId,SectorId=model.SectorId,Nombre=model.Nombre,NombreCorto=model.NombreCorto,
                Direccion = model.Direccion,Fax=model.Fax
            };
            if (!ModelState.IsValid)
            {
                ViewBag.Paises = new SelectList(_bll_paises.GetAllPaises(), "Id", "Nombre");
                ViewBag.Sectores = new SelectList(_bll_sectores.GetAllSectores(), "Id", "Nombre");
                return PartialView("_EmpresasAddUpd", model);
            }
            

            byte[] imageData = null;
            if (Request.Files.Count > 0)
            {
                HttpPostedFileBase Imagen = Request.Files["EmpresaLogo"];
                if (Imagen.ContentLength > 1048576) {
                    ViewBag.Paises = new SelectList(_bll_paises.GetAllPaises(), "Id", "Nombre");
                    ViewBag.Sectores = new SelectList(_bll_sectores.GetAllSectores(), "Id", "Nombre");

                    ModelState.AddModelError("", "El tamañao de la imagen excede lo permitido (1MB).");
                    return PartialView("_EmpresasAddUpd", model);

                }
                else
                {
                    using (var binary = new BinaryReader(Imagen.InputStream))
                    {
                        imageData = binary.ReadBytes(Imagen.ContentLength);
                    }
                }
                
                
                if (model.Id > 0)
                {
                    emp = _bll_emp.GetEmpresaById(model.Id);
                    
                }
                model.Logo = imageData.Length == 0 ? emp.Logo : imageData;
            }

            
            
            var respuesta = _bll_emp.Guardar(model);
            if (!respuesta.response)
            {
                ModelState.AddModelError("", respuesta.mensaje);
                ViewBag.Paises = new SelectList(_bll_paises.GetAllPaises(), "Id", "Nombre");
                ViewBag.Sectores = new SelectList(_bll_sectores.GetAllSectores(), "Id", "Nombre");

                return PartialView("_EmpresasAddUpd", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("EmpresasListar");
            return Json(respuesta);

        }
        public ActionResult EmpresasEliminar(int id)
        {
            ViewBag.ModalHeading = "Eliminar Estado Usuario";
            Empresas model = _bll_emp.GetEmpresaById(id);
            return PartialView("_EmpresasEliminar", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmpresasEliminarById(int id)
        {
            ViewBag.ModalHeading = "Eliminar Estado Usuario";
            if (!ModelState.IsValid)
            {
                Empresas model = _bll_emp.GetEmpresaById(id);
                return PartialView("_EmpresasEliminar", model);

            }
            var respuesta = _bll_emp.Eliminar(id);
            if (!respuesta.response)
            {
                Empresas model = _bll_emp.GetEmpresaById(id);
                return PartialView("_EmpresasEliminar", model);
            }
            respuesta.IsPartial = true;
            respuesta.ContainerRenderPartial = "renderpartial";
            respuesta.href = Url.Action("EmpresasListar");
            return Json(respuesta);
        }
        public ActionResult ReturJson(int id)
        {
            var respuesta = new RespondModel();
            respuesta.href = Url.Action("EmpresasListar");
            return Json(respuesta, JsonRequestBehavior.AllowGet);
        }
    }
}