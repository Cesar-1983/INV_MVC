using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class CategoriaTipoPerfilManager
    {
        public List<CategoriaTipoPerfil> GetCategoríaPorTipoPerfilId(int TipoPerfilId)
        {
            List<CategoriaTipoPerfil> Lista = new List<CategoriaTipoPerfil>();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.CategoriaTipoPerfil.Where(x => x.TipoPerfilId == TipoPerfilId).ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }
    }
}
