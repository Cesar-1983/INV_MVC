using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
namespace Data
{
    public class SectoresManager
    {
        public List<Sectores> GetAllSectores()
        {
            List<Sectores> lista = new List<Sectores>();
            using (var db = new DataContext())
            {
                lista = db.Sectores.ToList();
            }
            return lista;
        }
    }
}
