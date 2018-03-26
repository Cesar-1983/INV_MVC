using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class AccionesManager
    {
        public List<Acciones> GetAll()
        {
            List<Acciones> lista = new List<Acciones>();
            using (var db = new DataContext())
            {
                lista = db.Acciones.ToList();
            }
            return lista;
        }

    }
}
