using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Data;

namespace Negocio
{
    public class TasaCambiosLogic
    {
        private TasaCambiosManager TasaManager = new TasaCambiosManager();
        private TasaCambiosManager CatTasa
        {
            get
            {
                return TasaManager ?? (TasaManager = new TasaCambiosManager());
            }
        }
        public List<TasaCambios> GetAll()
        {
            return CatTasa.GetAll();
        }

        public TasaCambios GetTasaCambiosPorId(int id)
        {
            return CatTasa.TasaCambioPorId(id);
        }

        public RespondModel Guardar(TasaCambios tasa)
        {
            return CatTasa.Guardar(tasa);
        }

        public RespondModel Eliminar(int id)
        {
            return CatTasa.Eliminar(id);
        }
    }
}
