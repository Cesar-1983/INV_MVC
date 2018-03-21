using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Producto
    {
        [Key]
        public int Id { get; set; }
        public int IdCategoria { get; set; }
        public int IdUnidad { get; set; }
        public int IdMoneda { get; set; }
        public string barcode { get; set; }

        [Required]
        [StringLength(100)]
        [Display(Name ="Producto")]
        public string Nombre { get; set; }
        [Required]
        [StringLength(250)]
        [Display(Name = "Descripción")]
        public string DesProducto { get; set; }
        [Display(Name = "Inventario Minimo")]
        public int Inventario_Min { get; set; }

        [Display(Name = "Precio Entrada")]
        public decimal precio_in { get; set; }

        [Display(Name = "Precio Salida")]
        public decimal precio_out { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int UsuarioCrea { get; set; }

        public ICollection<ProductoImages> ProductoImages { get; set; }

        [ForeignKey("IdCategoria")]
        public virtual Categoria Categoria { get; set; }
        [ForeignKey("IdUnidad")]
        public virtual Unidades Unidades { get; set; }
        [ForeignKey("IdMoneda")]
        public virtual Monedas Monedas { get; set; }

    }
}
