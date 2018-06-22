using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.CuentaModels
{
    public class RegistroUsuarioModelRequest
    {
        [Required]
        [StringLength(256)]

        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirmar Contraseña")]

        [Compare("Password", ErrorMessage = "Contraseña no coinceden.")]
        public string CofirmPassword { get; set; }
    }
}