using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class ListarProductos
    {
        public string Nombre { get; set; }
        public string DesProducto { get; set; }
        public string Categoria { get; set; }
        public string DesUnidades { get; set; }
        public int Inventario_Min { get; set; }
        public string Moneda { get; set; }
        public decimal precio_in { get; set; }
        public decimal precio_out { get; set; }
    }
}
