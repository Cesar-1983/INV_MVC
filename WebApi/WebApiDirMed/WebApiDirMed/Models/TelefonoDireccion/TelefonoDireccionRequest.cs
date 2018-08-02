using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.TelefonoDireccion
{
    public class TelefonoDireccionRequest
    {
        public int Id { get; set; }

        public int DireccionId { get; set; }

        public string Telefono { get; set; }

        public string DescTelefono { get; set; }
    }
}