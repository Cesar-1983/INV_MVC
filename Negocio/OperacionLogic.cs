using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Entidades;
namespace Negocio
{
    public class OperacionLogic
    {
        private OperacionManager OperacionManager = new OperacionManager();

        private OperacionManager OpManager
        {
            get
            {
                return OperacionManager ?? (OperacionManager = new OperacionManager());
            }
        }
        public List<Operacion> GetAll()
        {
            return OpManager.GetAll();
        }
        public Operacion GetOperacionPorId(int id)
        {
            return OpManager.GetOperacionPorId(id);
        }
        public Operacion GetOperacionPorTipoOperacion(int IdTipoOperacion)
        {
            return OpManager.GetOperacionPorTipoOperacion(IdTipoOperacion);
        }
        public ResponseDB Guardar(Operacion operacion)
        {
            return OpManager.Guardar(operacion);
        }

    }
}
