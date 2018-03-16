using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INV_MVC.Models.CuentaViewModel
{
    public class UsuarioViewModel
    {
        public int UserId { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }

        //public bool UsuarioFromJson(string Json) {
        //    try
        //    {
        //        this. = JsonConvert.DeserializeObject<UsuarioViewModel>(Json);
        //    }
        //    catch (Exception)
        //    {

        //        return false;
        //    }
        //}
    }
}