﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class RespondModel
    {
        public bool response { get; set; }
        public string mensaje { get; set; }
        public string href { get; set; }

        public RespondModel()
        {
            this.response = false;
            this.mensaje = "Ha ocurrido un error, favor contactar al administrador";
        }
        public void SetResponse(bool _respuesta,string _mensaje)
        {
            this.response = _respuesta;
            this.mensaje = _mensaje;

            if(!_respuesta && string.IsNullOrEmpty(_mensaje))
            {
                this.mensaje = "Ha ocurrido un error, favor contactar al administrador";
            }
        }
    }
}
