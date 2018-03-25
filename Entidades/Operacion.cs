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

        [Display(Name ="Tipo de Operacion")]
        [ForeignKey("TipoOperacion")]
        public int IdTipoOperacion { get; set; }
        public decimal Total { get; set; }
        public int CantProductos { get; set; }
        public string Estado { get; set; }
        public DateTime? FechaCreacion { get; set; }

        [ForeignKey("Usuarios")]
        public int UsuarioCrea { get; set; }

        public TipoOperacion TipoOperacion { get; set; }
        public Cliente Cliente { get; set; }
        public Usuarios Usuarios { get; set; }
        public ICollection<DetalleOperacion> DetalleOperacion { get; set; }

        public Operacion() {
            this.DetalleOperacion = new HashSet<DetalleOperacion>();
        }

    }
}
