using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Unidades
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Descripción")]
        [StringLength(200)]

        public string DesUnidades { get; set; }

        [Display(Name = "Código")]
        [StringLength(10)]
        public string Codigo { get; set; }
        public int UsuarioCrea { get; set; }
        public DateTime? FechaCreacion { get; set; }
    }
}
