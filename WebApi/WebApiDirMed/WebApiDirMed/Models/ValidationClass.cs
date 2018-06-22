using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models
{
    public class ValidationClass
    {
        public bool IsValid { get; set; }
        public List<string> Mensajes { get; set; }

        public ValidationClass()
        {
            Mensajes = new List<string>();
        }
    }
}