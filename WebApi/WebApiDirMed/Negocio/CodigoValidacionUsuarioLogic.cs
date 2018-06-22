using AESCriptoUtility;
using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CodigoValidacionUsuarioLogic
    {
        private CodigoValidacionUsuarioManager CodigoValidacionUsuarioManager;
        private CodigoValidacionUsuarioManager CodigoValUsuarioManager
        {
            get
            {
                return CodigoValidacionUsuarioManager ?? (CodigoValidacionUsuarioManager = new CodigoValidacionUsuarioManager());
            }
        }

        public CodigoValidacionUsuario GetCodigoValidacionEmailByUsuario(int id)
        {
            return CodigoValUsuarioManager.GetCodigoValidacionEmailByUsuario(id);
        }

        public string GenerarCodigoValidacionEmailUsuario(int UsuarioId, string key, string iv) {
            try
            {
                string codigoString = "";
                int codigo = new Random().Next(1000, 9999);
                codigoString = AESCripto.EncryptStringAES(codigo.ToString(), key, iv);
                var response = CodigoValUsuarioManager.Guardar(new CodigoValidacionUsuario { UsuariosId = UsuarioId, Codigo = codigoString, FechaExpiracion = DateTime.Now.AddHours(12), Tipo = "CAE" });

                if (response.response)
                    return codigoString;
                else
                    return string.Empty;

            }
            catch (Exception)
            {

                throw;
            }
        }

    }
}
