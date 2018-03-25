using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.ServiceModel;
using System.Web.Services;
using System.Data.Entity;
using System.Xml;


namespace Data
{
    public class ListarProductosManager
    {
        //public static IEnumerable<Entidades.ListarProductos> ObtenerProductos()
        //{
        //    using (WConsulta.wsSoapClient Productos = new WConsulta.wsSoapClient())
        //    {
        //        var root = Productos.GetProductos().ToList();

        //        var result = root.ToList().Select(x => new Entidades.ListarProductos
        //        {
        //           Nombre = (x.Nombre),
        //           //DesProducto = (x.Element("DesProducto").Value.ToString()),
        //           // Categoria = (x.Element("Categoria").Value.ToString()),
        //           // DesUnidades = (x.Element("DesUnidades").Value.ToString()),
        //           // Inventario_Min = UInt32.Parse(x.Element("Inventario_Min").Value),
        //           // Moneda = (x.Element("Moneda").Value.ToString()),
        //           // precio_in = decimal.Parse(x.Element("precio_in").Value),
        //           // precio_out = decimal.Parse(x.Element("precio_out").Value)
        //        }).ToArray();

        //        return result;

        //    }

        //}

    }
}
