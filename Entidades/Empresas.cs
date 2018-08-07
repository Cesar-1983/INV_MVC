using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Empresas
    {
        [ForeignKey("Paises")]
        public int PaisId { get; set; }
        [Key]
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string NombreCorto { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Fax { get; set; }
        public string RegistroFiscal { get; set; }
        public string Representante1 { get; set; }
        public string Representante2 { get; set; }
        public byte[] Logo { get; set; }

        [ForeignKey("Sectores")]
        public int SectorId { get; set; }


        public virtual Paises Paises { get; set; }
        public virtual Sectores Sectores { get; set; }

    }
}
