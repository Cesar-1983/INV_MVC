using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.DireccionesModel
{
    public class GetDireccionesByPerfilRespond
    {
        public int Id { get; set; }

        public int PefilId { get; set; }
        public string Direccion { get; set; }
        public float? latitud { get; set; }
        public float? longitud { get; set; }
    }
}