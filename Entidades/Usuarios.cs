using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuarios
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        public string Email { get; set; }
        [Required]
        [StringLength(100)]
        public string UserName { get; set; }
        public bool EmailConfirmed { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        public bool PhoneNumberConfirmed { get; set; }
        public bool TwoFactorEnabled { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaActualizacion { get; set; }
        public int IntentosFallidos { get; set; }
        public DateTime FechaUltimoIngreso { get; set; }
        public int IdEstadoUsuario { get; set; }
        public int IdPerfilSeguridad { get; set; }
        public string ImageUser { get; set; }

        public EstadoUsuarios EstadoUsuarios { get; set; }
        public PerfilSeguridad PerfilSeguridad { get; set; }

        public static implicit operator Usuarios(List<Usuarios> v)
        {
            throw new NotImplementedException();
        }
    }
}
