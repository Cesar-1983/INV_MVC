using Data;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class AccionesLogic
    {
        private AccionesManager AccionesManager = new AccionesManager();

        private AccionesManager ActManager
        {
            get
            {
                return AccionesManager ?? (AccionesManager = new AccionesManager());
            }
        }

        public List<Acciones> GetAll()
        {
            return ActManager.GetAll();
        }
    }
}
