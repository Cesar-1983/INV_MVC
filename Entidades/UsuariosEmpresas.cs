using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class UsuariosEmpresas
    {
        [Column(Order = 0), Key, ForeignKey("Usuarios")]

        public int UsuarioId { get; set; }
        [Column(Order = 1), Key, ForeignKey("Empresas")]
        public int EmpresaId { get; set; }
        public string Estado { get; set; }

        public virtual Usuarios Usuarios  { get; set; }
        public virtual Empresas Empresas { get; set; }
    }
}
