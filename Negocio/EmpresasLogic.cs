using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Entidades;

namespace Negocio
{
    public class EmpresasLogic
    {
        private EmpresasManager _EmpresasManager = new EmpresasManager();
        private EmpresasManager Manager
        {
            get
            {
                return _EmpresasManager ?? (_EmpresasManager = new EmpresasManager());
            }
        }

        public List<Empresas> GetAllEmpresas()
        {
            return Manager.GetAllEmpresas();
        }
        public Empresas GetEmpresaById(int v_Id)
        {
            return Manager.GetEmpresaById(v_Id);
        }

        public RespondModel Guardar(Empresas model)
        {
            return Manager.Guardar(model);
        }


        public RespondModel Eliminar(int id)
        {
            return Manager.Eliminar(id);
        }

    }
}
