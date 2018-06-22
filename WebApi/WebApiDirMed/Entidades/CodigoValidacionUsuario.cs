using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class CodigoValidacionUsuario
    {
        [Key]
        public int Id { get; set; }
        public int UsuariosId { get; set; }
        public string Tipo { get; set; }

        public string Codigo { get; set; }
        public DateTime FechaExpiracion { get; set; }

        [ForeignKey("UsuariosId")]
        public virtual Usuarios Usuarios { get; set; }
    }
}
