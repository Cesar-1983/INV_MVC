using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Cliente
    {
        [Key]
        [Display(Name = "Codigo")]
        public int IdCliente { get; set; }
        [Required(ErrorMessage = "Nombre del Cliente Requerido")]
        public string Nombre { get; set; }
        [Required(ErrorMessage = "Apellido del Cliente Requerido")]
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        [DataType(DataType.PhoneNumber)]
        //[RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Formato invalido.")]
        public string Telefono { get; set; }
        [Display(Name = "Correo")]
        [DataType(DataType.EmailAddress)]
        public string email { get; set; }
        [Required(ErrorMessage = "Numero de Identificacion Requerido")]
        public string Identificaion { get; set; }
    }
}
