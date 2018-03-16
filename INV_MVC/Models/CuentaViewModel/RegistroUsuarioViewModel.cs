using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace INV_MVC.Models.CuentaViewModel
{
    public class RegistroUsuarioViewModel
    {
        [Required]
        [StringLength(256)]
        public string Email { get; set; }

        [Required]

        public string Password { get; set; }

        [Compare("Password", ErrorMessage = "Contraseña no coinceden.")]
        public string CofirmPassword { get; set; }
    }
}