using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Xml;
using System.IO;
using System.Text;

namespace WebService
{
    /// <summary>
    /// Descripción breve de ws
    /// </summary>
    [WebService(Namespace = "http://localhost.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class ws : System.Web.Services.WebService
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
      

        [WebMethod]
        public List<ListarProductos> GetProductos()
        {
            DataTable dt = Fn.Leer("usp_ListarProductos");
            List<ListarProductos> tbl = new List<ListarProductos>();

            foreach (DataRow rs in dt.Rows)
            {
                tbl.Add(new ListarProductos
                {
                    Nombre = Convert.ToString(rs[0]),
                    DesProducto = Convert.ToString(rs[1]),
                    Categoria = Convert.ToString(rs[2]),
                    DesUnidades = Convert.ToString(rs[3]),
                    Inventario_Min = Convert.ToInt32(rs[4]),
                    Moneda = Convert.ToString(rs[5]),
                    precio_in = Convert.ToDecimal(rs[6]),
                    precio_out = Convert.ToDecimal(rs[7])
                });
            }

            return tbl;

        }

    }
}
