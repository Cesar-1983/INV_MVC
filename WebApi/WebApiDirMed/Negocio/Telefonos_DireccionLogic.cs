using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Telefonos_DireccionLogic
    {
        private Telefonos_DireccionManager TelefonosDireccionManager = new Telefonos_DireccionManager();

        public Telefonos_DireccionManager Manager
        {
            get
            {
                return TelefonosDireccionManager ?? (TelefonosDireccionManager = new Telefonos_DireccionManager());
            }
        }

        public List<Telefonos_Direccion> GetAllTelefonosByDireccionId(int v_DireccionId)
        {
            return Manager.GetAllTelefonosByDireccionId(v_DireccionId);
        }

        public RespondModel Guardar(Telefonos_Direccion model)
        {
            return Manager.Guardar(model);
        }

        public RespondModel Eliminar(Telefonos_Direccion model)
        {
            return Eliminar(model);
        }

    }
}
