using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class PerfilSeguridadLogic
    {
        private PerfilSeguridadManager PerfilSeguridadManager;
        private PerfilSeguridadManager PerfilSegManager
        {
            get
            {
                return PerfilSeguridadManager ?? (PerfilSeguridadManager = new PerfilSeguridadManager());
            }
        }

        public PerfilSeguridad GetPerfilbyId(int id)
        {
            return PerfilSegManager.GetPerfilbyId(id);
        }
    }
}
