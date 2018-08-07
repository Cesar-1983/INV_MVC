using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Data;
namespace Negocio
{
    public class SectoresLogic
    {
        private SectoresManager _SectoresManager = new SectoresManager();
        private SectoresManager Manager
        {
            get
            {
                return _SectoresManager ?? (_SectoresManager = new SectoresManager());
            }
        }

        public List<Sectores> GetAllSectores()
        {
            return Manager.GetAllSectores();
        }
    }
}
