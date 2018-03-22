using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Data;

namespace Negocio
{
    public class ClienteLogic
    {
        private ClienteManager clienteM = new ClienteManager();

        public List<Cliente> GetAll()
        {
            return clienteM.GetAll();
        }

        public RespondModel Guardar(Cliente cliente)
        {
            return clienteM.Guardar(cliente);
        }

        public Cliente GetClientePorId(int id)
        {
            return clienteM.GetClientePorId(id);
        }

        public RespondModel Eliminar(int id)
        {
            return clienteM.Eliminar(id);
        }
    }
}
