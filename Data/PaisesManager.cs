using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
namespace Data
{
    public class PaisesManager
    {
        public List<Paises> GetAllPaises()
        {
            List<Paises> lista = new List<Paises>();
            using (var db = new DataContext())
            {
                lista = db.Paises.ToList();
            }
            return lista;
        }

    }
}
