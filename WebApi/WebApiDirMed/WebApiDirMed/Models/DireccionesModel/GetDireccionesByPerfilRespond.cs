using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.DireccionesModel
{
    public class GetDireccionesByPerfil
    {
        public int Id { get; set; }

        public int PerfilId { get; set; }
        public string Direccion { get; set; }
        public double? latitud { get; set; }
        public double? longitud { get; set; }

       
    }
    public class GetDireccionesByPerfilRespond {
        public int PerfilId { get; set; }
        public List<GetDireccionesByPerfil> Direcciones { get; set; }
        public GetDireccionesByPerfilRespond() {

            Direcciones = new List<GetDireccionesByPerfil>();
        }
    }
}