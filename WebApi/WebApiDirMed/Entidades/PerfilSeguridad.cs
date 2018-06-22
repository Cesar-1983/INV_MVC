﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class PerfilSeguridad
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(100)]

        public string Nombre { get; set; }
        [Required]
        [StringLength(250)]

        public string DesPerfilSeguridad { get; set; }
        public int IntentosPermitidos { get; set; }
        public int DiasExpiraClave { get; set; }
        public int LenMinPass { get; set; }
        public int CantLetrasMin { get; set; }
        public int CantLetrasMayMin { get; set; }
        public int CantNumeroMin { get; set; }
        public int CantCharEspecialMin { get; set; }
        public ICollection<Usuarios> Usuarios { get; set; }
    }
}
