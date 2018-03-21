using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Monedas
    {
        [Key]

        public int Id { get; set; }
        [StringLength(50)]

        public string Nombre { get; set; }
        [StringLength(10)]

        public string Simbolo { get; set; }
        [StringLength(10)]

        public string Codigo { get; set; }
        public int Numero { get; set; }
        public bool IsLocal { get; set; }
    }
}
