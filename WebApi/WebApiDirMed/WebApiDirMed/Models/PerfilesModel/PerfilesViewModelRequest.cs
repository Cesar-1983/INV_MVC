using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.PerfilesModel
{
    public class PerfilesViewModelRequest
    {
        public int Id { get; set; }

        [Required]
        //[DataType(DataType.EmailAddress, ErrorMessage = "Digite un correo valido")]

        public int TipoPerfilId { get; set; }

        [Required]
        
        public int UsuariosId { get; set; }

        [Required]
        [StringLength(100)]
        public string Nombre { get; set; }
        [Required]
        [StringLength(100)]
        public string Apellido { get; set; }

        [Required]
        [StringLength(500)]
        public string DescPerfil { get; set; }
    }
    
}