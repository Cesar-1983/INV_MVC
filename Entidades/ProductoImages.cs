using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace Entidades
{
    public class ProductoImages
    {
        [Key]
        public int Id { get; set; }
        public int IdProducto { get; set; }
        public byte[] Image { get; set; }
        public int UsuarioCrea { get; set; }

        [ForeignKey("IdProducto")]
        public virtual Producto Producto { get; set; }
    }
}
