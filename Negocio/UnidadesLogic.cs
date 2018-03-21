using Data;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UnidadesLogic
    {
        private UnidadesManager UnidadesManager = new UnidadesManager();

        private UnidadesManager UnidManager
        {
            get
            {
                return UnidadesManager ?? (UnidadesManager = new UnidadesManager());
            }
        }

        public List<Unidades> GetAll()
        {
            return UnidManager.GetAll();
        }
        public Unidades GetUnidadesPorId(int id)
        {
            return UnidManager.GetUnidadesPorId(id);
        }

        public RespondModel Guardar(Unidades Unidades)
        {
            return UnidManager.Guardar(Unidades);
        }

        public RespondModel Eliminar(int id)
        {
            return UnidManager.Eliminar(id);
        }
    }
}
