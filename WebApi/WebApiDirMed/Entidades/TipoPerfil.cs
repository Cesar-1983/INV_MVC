using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class TipoPerfil
    {
        [Key]
        public int Id { get; set; }
        public string DescTipoPerfil { get; set; }
        public bool Factura { get; set; }

        public ICollection<Perfiles> Perfiles { get; set; }
    }
}
