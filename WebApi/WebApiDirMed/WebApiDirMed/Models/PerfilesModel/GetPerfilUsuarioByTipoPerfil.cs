using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.PerfilesModel
{
    public class GetPerfilUsuarioByTipoPerfil
    {
        [Required]
        //[DataType(DataType.EmailAddress, ErrorMessage = "Digite un correo valido")]

        public int TipoPerfilId { get; set; }

        //[Required]

        //public int UsuariosId { get; set; }
    }
}