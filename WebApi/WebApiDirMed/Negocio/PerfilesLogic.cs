using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;
namespace Negocio
{
    public class PerfilesLogic
    {
        private PerfilesManager perfilesManager;

        public PerfilesManager PerfilManager {
            get {
                return perfilesManager ?? (perfilesManager=  new PerfilesManager());
            }
        }

        public List<Perfiles> GetPerfilesByUsuario(int UsuarioId) {
            return PerfilManager.GetPerfilesByUsuario(UsuarioId);
        }
        public RespondModel Guardar(Perfiles perfiles) {
            return PerfilManager.Guardar(perfiles);
        }
        public Perfiles GetPerfilByUsuarioTipoPerfil(int v_TipoPerfilId, int v_UsuarioId)
        {
            return PerfilManager.GetPerfilByUsuarioTipoPerfil(v_TipoPerfilId, v_UsuarioId);
        }
    }
}
