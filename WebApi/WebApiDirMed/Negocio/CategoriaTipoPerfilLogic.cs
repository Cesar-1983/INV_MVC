using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
namespace Negocio
{
    public class CategoriaTipoPerfilLogic
    {
        private CategoriaTipoPerfilManager categoriaTipoPerfil = new CategoriaTipoPerfilManager();

        private CategoriaTipoPerfilManager categoriaTipoPerfilManager
        {
            get
            {
                return categoriaTipoPerfil ?? (categoriaTipoPerfil = new CategoriaTipoPerfilManager());
            }
        }

        public List<CategoriaTipoPerfil> GetCategoríaPorTipoPerfilId(int TipoPerfilId)
        {
            return categoriaTipoPerfilManager.GetCategoríaPorTipoPerfilId(TipoPerfilId);
        }
    }
}
