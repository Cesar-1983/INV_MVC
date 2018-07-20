using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
namespace Negocio
{
    public class Perfiles_CategoriaTipoPerfilLogic
    {
        private Perfiles_CategoriaTipoPerfilManager _Perfiles_CategoriaTipoPerfilManager= new Perfiles_CategoriaTipoPerfilManager();

        public Perfiles_CategoriaTipoPerfilManager Manager {
            get
            {
                return _Perfiles_CategoriaTipoPerfilManager ?? (_Perfiles_CategoriaTipoPerfilManager = new Perfiles_CategoriaTipoPerfilManager());
            }
        }

        public bool Perfiles_CategoriaTipoPerfilExist(int v_PerfilId, int v_CategoriaTipoPerfiId)
        {
            return Manager.Perfiles_CategoriaTipoPerfilExist(v_PerfilId, v_CategoriaTipoPerfiId);
        }

        public List<Perfiles_CategoriaTipoPerfil> GetPerfiles_CategoriaTipoPerfilByPerfilId(int v_PerfilId)
        {
            return Manager.GetPerfiles_CategoriaTipoPerfilByPerfilId(v_PerfilId);
        }

        public RespondModel Guardar(Perfiles_CategoriaTipoPerfil modelo)
        {
            return Manager.Guardar(modelo);
        }
        public RespondModel Eliminar(Perfiles_CategoriaTipoPerfil modelo)
        {
            return Manager.Eliminar(modelo);
        }

        public RespondModel EliminarAllCategoriaPerfil(int v_PerfilId) {
            return Manager.EliminarAllCategoriaPerfil(v_PerfilId);
        }
        public RespondModel GuardarCategoriasMasivo(int v_PerfilId, List<int> ListaCategorias) {
            return Manager.GuardarCategoriasMasivo(v_PerfilId, ListaCategorias);
        }
    }
}
