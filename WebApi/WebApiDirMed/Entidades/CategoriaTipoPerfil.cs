using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class CategoriaTipoPerfil
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey("PadreCategoria")]
        [Display(Name = "Categoría Padre")]
        public int? CategoriaParentId { get; set; }

        [ForeignKey("TipoPerfil")]
        [Display(Name = "Tipo Perfil")]
        public int TipoPerfilId { get; set; }

        [StringLength(200)]
        [Display(Name = "Nombre")]
        public string Nombre { get; set; }
        [StringLength(200)]

        [Display(Name = "Descripción")]
        public string DesCategoria { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int UsuarioCrea { get; set; }

        public virtual TipoPerfil TipoPerfil { get; set; }
        public virtual CategoriaTipoPerfil PadreCategoria { get; set; }
        public virtual ICollection<CategoriaTipoPerfil> HijosCategoria { get; set; }

        public virtual ICollection<Perfiles_CategoriaTipoPerfil> Perfiles_CategoriaTipoPerfil { get; set; }
    }
}
