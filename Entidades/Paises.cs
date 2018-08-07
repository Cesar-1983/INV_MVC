using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Paises
    {
        [Key]
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string SimboloPais { get; set; }
        public string Estado { get; set; }

        [ForeignKey("Monedas")]
        public int MonedaId { get; set; }

        
        public virtual Monedas Monedas { get; set; }
    }
}