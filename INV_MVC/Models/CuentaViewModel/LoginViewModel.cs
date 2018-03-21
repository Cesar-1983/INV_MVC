using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace INV_MVC.Models.CuentaViewModel
{
    public class LoginViewModel
    {
        [Display(Name = "Email o Usuario")]
        public string Email { get; set; }

        [DataType(DataType.Password)]
        [Display(Name ="Password")]
        public string Password { get; set; }

    }
}