using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class ResponseDB
    {
        public int NoError { get; set; }
        public string Mensaje { get; set; }

        public ResponseDB() {
            this.NoError = 1;
            this.Mensaje = "Ha ocurrido un error inesperado.";
        }
    }
}
