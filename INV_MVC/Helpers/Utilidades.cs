using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace INV_MVC.Helpers
{
    public class Utilidades
    {
        public string encriptar(string cad)
        {
            return AESCriptoUtility.AESCripto.EncryptStringAES(cad, GetKey, GetIV);
        }

        public string desencriptar(string cadE)
        {
            return AESCriptoUtility.AESCripto.DecryptStringAES(cadE, GetKey, GetIV);
        }

        //public static bool validarAcceso(string pagina, Dictionary<string, string> accesos)
        //{
        //    return accesos.ContainsValue(pagina);
        //}

        public string GetKey
        {
            get { return WebConfigurationManager.AppSettings["key"].ToString() ?? ""; }
        }
        public string GetIV
        {
            get { return WebConfigurationManager.AppSettings["iv"].ToString() ?? ""; }
        }

        
    }
}