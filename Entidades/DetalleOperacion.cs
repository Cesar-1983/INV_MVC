using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleOperacion
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("Operacion")]
        public int IdOperacion { get; set; }
        [ForeignKey("Producto")]
        public int IdProducto { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }

        public Operacion Operacion { get; set; }
        public Producto Producto { get; set; }
    }
}
