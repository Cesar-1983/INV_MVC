using Data;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class RolesLogic
    {
        private RolesManager RolesManager = new RolesManager();

        private RolesManager RolManager
        {
            get
            {
                return RolesManager ?? (RolesManager = new RolesManager());
            }
        }

        public List<Roles> GetAll()
        {
            return RolManager.GetAll();
        }
        public Roles GetRolesPorId(int id)
        {
            return RolManager.GetRolesPorId(id);
        }

        public RespondModel Guardar(Roles Roles)
        {
            return RolManager.Guardar(Roles);
        }

        public RespondModel Eliminar(int id)
        {
            return RolManager.Eliminar(id);
        }
    }
}
