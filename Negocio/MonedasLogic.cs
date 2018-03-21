using Data;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class MonedasLogic
    {
        private MonedaManager monedaManager;

        private MonedaManager MonManager
        {
            get
            {
                return monedaManager ?? (monedaManager = new MonedaManager());
            }
        }

        public List<Monedas> GetAllMonedas()
        {
            return MonManager.GetAllMonedas();
        }

        public Monedas GetMonedasPorId(int id)
        {
            return MonManager.GetMonedasPorId(id);
        }
        public RespondModel Guardar(Monedas Monedas)
        {

            return MonManager.Guardar(Monedas);
        }

        public RespondModel Eliminar(int id)
        {
            return MonManager.Eliminar(id);
        }
    }
}
