using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class RolesAcciones
    {
        
        [Column(Order = 0), Key, ForeignKey("Roles")]
        public int IdRol { get; set; }
        [Column(Order = 1), Key, ForeignKey("Acciones")]
        public int IdAcciones { get; set; }
        public Roles Roles { get; set; }
        public Acciones Acciones { get; set; }
    }
}
