using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Entidades;
using AESCriptoUtility;
namespace Negocio
{
    public class UsuariosLogic
    {
        private UsuariosManager UsuariosManager;
        private UsuariosManager UserManager
        {
            get
            {
                return UsuariosManager ?? (UsuariosManager = new UsuariosManager());
            }
        }

        public List<Usuarios> GetAllUsuarios()
        {
            return UserManager.GetAllUsuarios();
        }
        public Usuarios GetUsuariosPorId(int id)
        {
            return UserManager.GetUsuariosPorId(id);
        }
        public Usuarios GetUsuariosPorUserName(string username)
        {
            return UserManager.GetUsuariosPorUserName(username);
        }

        public RespondModel Guardar(Usuarios usuarios)
        {
            return UserManager.Guardar(usuarios);
        }

        public RespondModel EmailConfirmacion(int id)
        {
            return UserManager.EmailConfirmacion(id);
        }

        public RespondModel LogIng(string username, string password,string key,string iv) {
            
            RespondModel rm = new RespondModel();
            var usuario = UserManager.GetUsuariosPorUserName(username);
            if (usuario.Id == 0) {
                rm.SetResponse(false, "Usuario Invalido.");
                return rm;
            }
            if (usuario.IntentosFallidos == usuario.PerfilSeguridad.IntentosPermitidos){
                usuario.IdEstadoUsuario = 4;
                UserManager.Guardar(usuario);
                rm.SetResponse(false, "Ha sobrepasado la cantidad de intentos permitidos.\nSu cuenta será bloqueada");
                return rm;
            }
            var pass = AESCripto.DecryptStringAES(usuario.Password, key, iv);

            if (password != pass)
            {
                usuario.IntentosFallidos = usuario.IntentosFallidos + 1;
                UserManager.Guardar(usuario);
                rm.SetResponse(false, "La contraseña no coinciden.\nLe quedan " + (usuario.PerfilSeguridad.IntentosPermitidos - usuario.IntentosFallidos).ToString() + " intentos.");
                return rm;
            }
            rm.SetResponse(true, "Verificación Exitosa");
            

            return rm;
        }
        public RespondModel RegistrarUsuario(Usuarios usuarios) {
            /*Se asocia perfil y estado por default*/
            usuarios.IdEstadoUsuario = 1;
            usuarios.IdPerfilSeguridad = 1;
            /*Se asocia perfil y estado por default*/

            /*Validación de contraseña segun perfil de seguridad*/
            //PerfilSeguridadManager = new PerfilSeguridadManager();
            //var perfil = PerfilSeguridadManager.GetPerfilbyId(usuarios.IdPerfilSeguridad);
            //var response = this.CheckPassword(usuarios.Password, perfil.LenMinPass, perfil.CantLetrasMin, perfil.CantLetrasMayMin, perfil.CantNumeroMin, perfil.CantCharEspecialMin);

            //if (!response.response)
            //    return response;

            /*Validación de contraseña segun perfil de seguridad*/


            /*Por ahora el email y el Username seran el mismo*/
            usuarios.UserName = usuarios.Email;
            /*Por ahora el email y el Username seran el mismo*/

            usuarios.FechaCreacion = DateTime.Today;
            return UserManager.Guardar(usuarios);
            /*Se asocia perfil y estado por default*/
        }

        public RespondModel CheckPassword(string pass, int LenMinPass, int CantLetrasMin, int CantLetrasMayMin, int CantNumeroMin, int CantCharEspecialMin) {
            RespondModel respondModel = new RespondModel();
            respondModel.SetResponse(true, "Contraseña OK.");
            int contCantLetrasMin = 0;
            int contCantLetrasMayMin = 0;
            int contCantNumeroMin = 0;
            int contCantCharEspecialMin = 0;
            if (pass.Length < LenMinPass)
            { 
                respondModel.SetResponse(false, string.Format("La contraseña debe tener un minimo de {0} caracteres", CantLetrasMin));
                return respondModel;
                //respond = false;
            }
            /*Validación cantidad de letras*/
            foreach (char c in pass)
            {
                if (char.IsLetter(c))
                    contCantLetrasMin++;

            }
            if (contCantLetrasMin < CantLetrasMin)
            {
                respondModel.SetResponse(false, string.Format("La contraseña debe tener un minimo de {0} letras", contCantLetrasMin));
                return respondModel;
                //respond = false;
            }
            /*Validación cantidad de letras*/

            /*Validación cantidad de letras Mayusculas*/
            foreach (char c in pass)
            {
                if (char.IsUpper(c))
                    contCantLetrasMayMin++;

            }
            if (contCantLetrasMayMin < CantLetrasMayMin)
            {
                respondModel.SetResponse(false, string.Format("La contraseña debe tener un minimo de {0} mayusculas", contCantLetrasMayMin));
                return respondModel;
                //respond = false;
            }
            /*Validación cantidad de letras Mayusculas*/

            /*Validación cantidad de numeros*/
            foreach (char c in pass)
            {
                if (char.IsNumber(c))
                    contCantNumeroMin++;

            }

            if (contCantNumeroMin < CantNumeroMin)
            {
                respondModel.SetResponse(false, string.Format("La contraseña debe tener un minimo de {0} digitos", contCantNumeroMin));
                return respondModel;
                //respond = false;
            }
            /*Validación cantidad de numeros*/

            /*Validación cantidad de Caracteres especiales*/

            foreach (char c in pass)
            {
                if (!char.IsLetterOrDigit(c))
                    contCantCharEspecialMin++;

            }
            if (contCantCharEspecialMin < CantCharEspecialMin)
            {
                respondModel.SetResponse(false, string.Format("La contraseña debe tener un minimo de {0} caracteres especiales", contCantCharEspecialMin));
                return respondModel;
                //respond = false;
            }
            /*Validación cantidad de Caracteres especiales*/

            return respondModel;
        }
    }
}
