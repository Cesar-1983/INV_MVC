using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.CuentaModels
{
    public class EmailConfirmacionRequest
    {
        [Required]
        [StringLength(256)]

        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Codigo")]
        public string Codigo { get; set; }
    }
}