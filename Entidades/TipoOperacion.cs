﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class TipoOperacion
    {
        [Key]

        public int Id { get; set; }
        public string Nombre { get; set; }

        public ICollection<Operacion> Operacion { get; set; }
    }
}
