using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Perfiles
    {
        [Key]
        public int Id { get; set; }
        public int TipoPerfilId { get; set; }
        public int UsuariosId { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string DescPerfil { get; set; }

        [ForeignKey("TipoPerfilId")]
        public virtual TipoPerfil TipoPerfil { get; set; }
        [ForeignKey("UsuariosId")]
        public virtual Usuarios Usuarios { get; set; }

        public virtual ICollection<Perfiles_CategoriaTipoPerfil> Perfiles_CategoriaTipoPerfil { get; set; }

    }
}
