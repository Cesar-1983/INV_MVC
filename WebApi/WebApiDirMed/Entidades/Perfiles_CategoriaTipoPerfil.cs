using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Perfiles_CategoriaTipoPerfil
    {
        [Key]
        [Column(Order = 0)]
        [ForeignKey("CategoriaTipoPerfil")]
        public int CategoriaTipoPerfilId { get; set; }

        [Key]
        [Column(Order = 1)]
        [ForeignKey("Perfiles")]
        public int PerfilesId { get; set; }

        public virtual CategoriaTipoPerfil CategoriaTipoPerfil { get; set; }
        public virtual Perfiles Perfiles { get; set; }
    }
}
