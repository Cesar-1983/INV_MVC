using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class PerfilSeguridadManager
    {
        public PerfilSeguridad GetPerfilbyId(int id)
        {
            PerfilSeguridad perfil = new PerfilSeguridad();

            try
            {
                using (var db = new DataContext())
                {
                    perfil = db.PerfilSeguridad.Where(x => x.Id == id).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw;

            }
            return perfil;
        }


    }
}
