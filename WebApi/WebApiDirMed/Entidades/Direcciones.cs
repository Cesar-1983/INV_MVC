using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Direcciones
    {
        public int Id { get; set; }

        [ForeignKey("Perfiles")]
        public int PerfilId { get; set; }
        public string Direccion { get; set; }
        public double? latitud { get; set; }
        public double? longitud { get; set; }

        public virtual Perfiles Perfiles { get; set; }

    }
}
