using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.DireccionesModel
{
    public class GetDireccionBy_Id_PerfilId_Request
    {
        public int Id { get; set; }
        public int PerfilId { get; set; }
    }
}