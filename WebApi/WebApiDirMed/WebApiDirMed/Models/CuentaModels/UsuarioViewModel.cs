﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiDirMed.Models.CuentaModels
{
    public class UsuarioViewModel
    {
        public int UserId { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
    }
}