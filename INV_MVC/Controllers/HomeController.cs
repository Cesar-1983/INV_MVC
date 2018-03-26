using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace INV_MVC.Controllers
{
    [Authorize]
    public class HomeController : baseController
    {
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.breadcrumb = "Inicio";
            ViewBag.pageheader = "Inicio";
            return View();
        }
    }
}