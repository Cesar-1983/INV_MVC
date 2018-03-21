using Data;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CategoriaLogic
    {
        private CategoriaManager categoriaManager = new CategoriaManager();

        private CategoriaManager CatManager
        {
            get
            {
                return categoriaManager ?? (categoriaManager = new CategoriaManager());
            }
        }

        public List<Categoria> GetAll()
        {
            return CatManager.GetAll();
        }
        public Categoria GetCategoríaPorId(int id)
        {
            return CatManager.GetCategoríaPorId(id);
        }

        public RespondModel Guardar(Categoria categoria)
        {
            return CatManager.Guardar(categoria);
        }

        public RespondModel Eliminar(int id)
        {
            return CatManager.Eliminar(id);
        }
    }
}
