using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Telefonos_Direccion
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey("Direcciones")]
        public int DireccionId { get; set; }

        [StringLength(30)]
        public string Telefono { get; set; }

        public virtual Direcciones Direcciones { get; set; }
    }
}
