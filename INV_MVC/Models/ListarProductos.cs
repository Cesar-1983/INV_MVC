using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using INV_MVC.WsConsulta;
using System.Web.Services;
using System.ServiceModel;
using System.Data.Entity;
using System.Xml.Linq;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades
{
    public class ListarProductos
    {
        [Display(Name = "Producto")]
        public string Nombre { get; set; }
        [Display(Name = "Descripcion")]
        public string DesProducto { get; set; }
        public string Categoria { get; set; }
        [Display(Name = "Unidad")]
        public string DesUnidades { get; set; }
        [Display(Name = "Inventario Minimo")]
        public int Inventario_Min { get; set; }
        [Display(Name = "Moneda")]
        public string Moneda { get; set; }
        [Display(Name = "Precio Entrada")]
        public decimal precio_in { get; set; }
        [Display(Name = "Precio Salida")]
        public decimal precio_out { get; set; }

        public static IEnumerable<Entidades.ListarProductos> ObtenerProductos()
        {
            using (INV_MVC.WsConsulta.wsSoapClient Productos = new INV_MVC.WsConsulta.wsSoapClient())
            {
                var root = Productos.GetProductos().ToList();

                var result = root.ToList().Select(x => new Entidades.ListarProductos
                {
                    Nombre = (x.Nombre),
                    DesProducto = (x.DesProducto),
                    Categoria = (x.Categoria),
                    DesUnidades = (x.DesUnidades),
                    Inventario_Min = (x.Inventario_Min),
                    Moneda = (x.Moneda),
                    precio_in = (x.precio_in),
                    precio_out = (x.precio_out)
                }).ToArray();

                return result;

            }
        }
    }
}
