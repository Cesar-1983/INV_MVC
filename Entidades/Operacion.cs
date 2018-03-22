using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Operacion
    {
        [Key]

        public int Id { get; set; }

        [ForeignKey("Cliente")]
        public int? IdCliente { get; set; }

        [ForeignKey("TipoOperacion")]
        public int IdTipoOperacion { get; set; }
        public decimal Total { get; set; }
        public int CantProductos { get; set; }
        public string Estado { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int UsuarioCrea { get; set; }

        public TipoOperacion TipoOperacion { get; set; }
        public Cliente Cliente { get; set; }

    }
}
