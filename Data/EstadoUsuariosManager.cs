using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Data
{
    public class EstadoUsuariosManager
    {
        /// <summary>
        /// Retorna lista EstadoUsuarios
        /// </summary>
        /// <returns></returns>
        public List<EstadoUsuarios> GetAllEstadosUsuarios() {
            List<EstadoUsuarios> lista = new List<EstadoUsuarios>();
            using (var db = new DataContext()) {
                lista = db.EstadoUsuarios.ToList();
            }
            return lista;
        }

        public EstadoUsuarios GetEstadosUsuariosById(int id)
        {
            EstadoUsuarios reg = new EstadoUsuarios();
            using (var db = new DataContext())
            {
                reg = db.EstadoUsuarios.Where(x => x.Id == id).FirstOrDefault();
            }
            return reg;
        }
        public RespondModel Guardar(EstadoUsuarios estadoUsuarios)
        {
            var rm = new RespondModel();
            string mensaje="";
            try
            {
                using (var db = new DataContext())
                {
                    if (estadoUsuarios.Id > 0)
                    {
                        db.Entry(estadoUsuarios).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Registro actualizado exitosamente";
                    }
                    else
                    {
                        db.Entry(estadoUsuarios).State = System.Data.Entity.EntityState.Added;
                        mensaje = "Registro agregado exitosamente";
                    }
                    db.SaveChanges();
                    rm.SetResponse(true, mensaje);
                }

                
            }
            catch (Exception ex)
            {

                rm.SetResponse(false, ex.Message);
            }
            return rm;
        }

        public RespondModel Eliminar(int id) {
            var rm = new RespondModel();
            string mensaje = "";
            bool resp = false;
            try
            {
                using (var db = new DataContext())
                {
                    var reg = db.EstadoUsuarios.Where(x => x.Id == id).FirstOrDefault();
                    if(reg.Id> 0)
                    {
                        db.Entry(reg).State = System.Data.Entity.EntityState.Deleted;
                        mensaje = "Registro eliminado exitosamente";
                        resp = true;
                    }
                    else
                    {
                        resp = false;
                        mensaje = "El registro no existe.";
                    }
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                resp = false;
                mensaje = ex.Message;
                
            }
            rm.SetResponse(resp,mensaje);
            return rm;
        }
    }
}
