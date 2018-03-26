using Data;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class RolesAccionesLogic
    {
        private RolesAccionesAccionesManager RolesAccionesAccionesManager = new RolesAccionesAccionesManager();

        private RolesAccionesAccionesManager RolActManager
        {
            get
            {
                return RolesAccionesAccionesManager ?? (RolesAccionesAccionesManager = new RolesAccionesAccionesManager());
            }
        }

        public List<RolesAcciones> GetAll()
        {
            return RolActManager.GetAll();
        }
        public RolesAcciones GetRolesAccionesPorId(int IdRol, int IdAccion)
        {
            return RolActManager.GetRolesAccionesPorId(IdRol,IdAccion);
        }
        public bool GetRolesAccionesExist(int IdRol, int IdAccion)
        {
            return RolActManager.GetRolesAccionesExist(IdRol, IdAccion);
        }

        public List<RolesAcciones> GetRolesAccionesPorRol(int IdRol)
        {
            return RolActManager.GetRolesAccionesPorRol(IdRol);
        }


        public RespondModel Guardar(RolesAcciones RolesAcciones)
        {
            return RolActManager.Guardar(RolesAcciones);
        }

        public RespondModel Eliminar(int IdRol, int IdAccion)
        {
            return RolActManager.Eliminar(IdRol, IdAccion);
        }
    }
}
