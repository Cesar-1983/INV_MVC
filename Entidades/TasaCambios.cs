using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;

namespace Entidades
{
    public class TasaCambios
    {
        [Key]
        public int IdTasaCambio { get; set; }
        [Display(Name = "Moneda Local")]
        public int IdMonedaLocal { get; set; }
        [Display(Name = "Moneda Extranjeta")]
        public int IdMonedaExtranjera { get; set; }

        //[DisplayFormat(DataFormatString = "{{0:dd MMM yyyy}}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime Fecha { get; set; }

        [Display(Name = "Tasa Oficial")]
        public decimal TCoficial { get; set; }
        [Display(Name = "Tasa Venta")]
        public decimal TCventa { get; set; }
        [Display(Name = "Tasa Compra")]
        public decimal TCcompra { get; set; }

        public int IdUsuarioReg { get; set; }

        public DateTime FechaReg { get; set; }

        public int IdUsuarioUpd { get; set; }

        public DateTime FechaUpd { get; set; }

        //[ForeignKey("IdMonedaLocal")]
        [ForeignKey(nameof(IdMonedaLocal))]
        public virtual Monedas Monedas { get; set; }
        //[ForeignKey("IdMonedaExtranjera")]
        [ForeignKey(nameof(IdMonedaExtranjera))]
        public virtual Monedas Monedas1 { get; set; }
    }
}
