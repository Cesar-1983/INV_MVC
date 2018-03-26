using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Roles
    {
        [Key]
        public int Id { get; set; }
        [Display(Name ="Rol")]
        public string Nombre { get; set; }
        public ICollection<RolesAcciones> RolesAcciones { get; set; }
    }
}
