using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
namespace Negocio
{
    public class DireccionesLogic
    {
        private DireccionesManager direccionesManager   = new DireccionesManager();

        public DireccionesManager Manager
        {
            get
            {
                return direccionesManager ?? (direccionesManager = new DireccionesManager());
            }
        }
        public List<Direcciones> GetAllDirecciones()
        {
            return Manager.GetAllDirecciones();
        }

        public List<Direcciones> GetDireccionesByPerfil(int v_PerfilId)
        {
            return Manager.GetDireccionesByPerfil(v_PerfilId);
        }

        public RespondModel Guardar(Direcciones direcciones)
        {
            return Manager.Guardar(direcciones);
        }
        public RespondModel Eliminar(Direcciones direcciones)
        {
            return Manager.Eliminar(direcciones);
        }


    }
}
