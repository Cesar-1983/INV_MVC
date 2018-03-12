
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class EstadoUsuarios
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string DesEstadoUsuario { get; set; }
        [Required]
        [StringLength(10)]
        public string Codigo { get; set; }
                                           //       Id INT IDENTITY(1,1),
                                           //DesEstadoUsuario NVARCHAR(100),
                                           //Codigo NVARCHAR(10),
    }
}
