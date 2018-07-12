using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.PerfilesModel
{
    public class GetPerfilesByUsuarioRespond
    {
        public int Id { get; set; }
        public int TipoPerfilId { get; set; }
        public int UsuariosId { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string DescPerfil { get; set; }
        public string DescTipoPerfil { get; set; }
    }
}