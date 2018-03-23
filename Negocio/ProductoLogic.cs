using Data;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ProductoLogic
    {
        private ProductoManager ProductoManager;

        private ProductoManager ProdManager
        {
            get
            {
                return ProductoManager ?? (ProductoManager = new ProductoManager());
            }
        }

        public List<Producto> GetAll()
        {
            return ProdManager.GetAll();
        }

        public Producto GetProductoPorId(int id)
        {
            return ProdManager.GetProductoPorId(id);
        }
        public RespondModel Guardar(Producto Producto)
        {
            return ProdManager.Guardar(Producto);
        }

        public RespondModel Eliminar(int id)
        {
            return ProdManager.Eliminar(id);
        }

        public decimal GetPrecioInPorProducto(int id) {
            var producto = ProdManager.GetProductoPorId(id);
            return producto.precio_in;
        }
        public decimal GetPrecioOutPorProducto(int id)
        {
            var producto = ProdManager.GetProductoPorId(id);
            return producto.precio_out;
        }
    }
}
