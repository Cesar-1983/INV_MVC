using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EstadoUsuariosLogic
    {
        private EstadoUsuariosManager EstadoUsuariosManager;

        private EstadoUsuariosManager EUManager
        {
            get
            {
                return EstadoUsuariosManager ?? (EstadoUsuariosManager = new EstadoUsuariosManager());
            }
        }

        public List<EstadoUsuarios> GetAllEstadosUsuarios()
        {
            return EUManager.GetAllEstadosUsuarios();
        }

        public EstadoUsuarios GetEstadosUsuariosById(int id)
        {
            return EUManager.GetEstadosUsuariosById(id);
        }
        public RespondModel Guardar(EstadoUsuarios estadoUsuarios)
        {
            return EUManager.Guardar(estadoUsuarios);
        }

        public RespondModel Eliminar(int id)
        {
            return EUManager.Eliminar(id);
        }
    }
}
