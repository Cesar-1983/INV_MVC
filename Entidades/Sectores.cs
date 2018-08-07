using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Sectores
    {
        [Key]
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Estado { get; set; }
    }
}
