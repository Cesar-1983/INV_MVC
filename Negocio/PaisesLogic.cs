using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Data;
namespace Negocio
{
    public class PaisesLogic
    {
        private PaisesManager _PaisesManager = new PaisesManager();
        private PaisesManager Manager
        {
            get
            {
                return _PaisesManager ?? (_PaisesManager = new PaisesManager());
            }
        }

        public List<Paises> GetAllPaises()
        {
            return Manager.GetAllPaises();
        }
    }
}
