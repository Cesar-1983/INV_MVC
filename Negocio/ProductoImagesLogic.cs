using Data;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ProductoImagesLogic
    {
        private ProductoImagesManager ProductoImagesManager;

        private ProductoImagesManager ProdImgManager
        {
            get
            {
                return ProductoImagesManager ?? (ProductoImagesManager = new ProductoImagesManager());
            }
        }

        public List<ProductoImages> GetAll()
        {
            return ProdImgManager.GetAll();
        }

        public ProductoImages GetProductoPorId(int id)
        {
            return ProdImgManager.GetProductoImagesPorId(id);
        }
        public RespondModel Guardar(ProductoImages Producto)
        {
            return ProdImgManager.Guardar(Producto);
        }

        public List<ProductoImages> GetProductImageByProductId(int id)
        {
            return ProdImgManager.GetProductImageByProductId(id);
        }


        public RespondModel Eliminar(int id)
        {
            return ProdImgManager.Eliminar(id);
        }
    }
}
