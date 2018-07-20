using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.CategoriaTipoPerfilModel
{
    public class SaveCategoríaByPerfilIdSelected
    {
        public int CategoriaTipoPerfilId { get; set; }
    }
    public class SaveCategoríaByPerfilIdSelectedrequest {
        public int TipoPerfilId { get; set; }
        public List<SaveCategoríaByPerfilIdSelected> SaveCategoríaByPerfilIdSelected { get; set; }

    }
}