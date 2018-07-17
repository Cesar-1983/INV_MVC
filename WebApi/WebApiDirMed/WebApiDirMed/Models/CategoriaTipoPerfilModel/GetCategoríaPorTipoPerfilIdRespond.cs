using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.CategoriaTipoPerfilModel
{
    public class GetCategoríaPorTipoPerfilIdRespond
    {
        public int Id { get; set; }

        public int? CategoriaParentId { get; set; }

        //public int TipoPerfilId { get; set; }

        public string Nombre { get; set; }

        public string DesCategoria { get; set; }
        //public DateTime? FechaCreacion { get; set; }
        //public int UsuarioCrea { get; set; }

        public List<GetCategoríaPorTipoPerfilIdRespond> CategoriaHijos { get; set; }

        public GetCategoríaPorTipoPerfilIdRespond() {
            CategoriaHijos = new List<GetCategoríaPorTipoPerfilIdRespond>();
        }

    }
    public class GetCategoríaPorTipoPerfilIdRespond1 {
        public List<GetCategoríaPorTipoPerfilIdRespond> Categorias { get; set; }
    }
}