using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Acciones
    {
        public int Id { get; set; }
        public string Accion { get; set; }
        public string Controlador { get; set; }
        public string Area { get; set; }
        public ICollection<RolesAcciones> RolesAcciones { get; set; }
    }
}
