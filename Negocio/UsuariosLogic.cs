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

            /*Por ahora el email y el Username seran el mismo*/
            usuarios.UserName = usuarios.Email;
            /*Por ahora el email y el Username seran el mismo*/

            return UserManager.Guardar(usuarios);
            /*Se asocia perfil y estado por default*/
        }
    }
}
