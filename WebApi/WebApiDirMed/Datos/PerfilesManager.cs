using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class PerfilesManager
    {
        public List<Perfiles> GetPerfilesByUsuario(int UsuarioId) {
            List<Perfiles> lista = new List<Perfiles>();
            try
            {
                using (var db = new DataContext())
                {
                    lista = db.Perfiles.Include("TipoPerfil").Include("Usuarios").Where(x=> x.UsuariosId == UsuarioId). ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return lista;
        }

        public RespondModel Guardar(Perfiles perfiles)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    if (perfiles.Id > 0)
                    {
                        db.Entry(perfiles).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Registro actualizado exitosamente";
                    }
                    else
                    {
                        db.Entry(perfiles).State = System.Data.Entity.EntityState.Added;
                        mensaje = "Registro agregado exitosamente";
                    }
                    db.SaveChanges();
                    rm.SetResponse(true, mensaje);
                }


            }
            catch (DbEntityValidationException ex)
            {
                foreach (var eve in ex.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                rm.SetResponse(false, ex.Message);
            }
            catch (Exception ex)
            {
                rm.SetResponse(false, ex.Message);
            }
            return rm;
        }

        public Perfiles GetPerfilByUsuarioTipoPerfil(int v_TipoPerfilId, int v_UsuarioId) {
            Perfiles perfil = new Perfiles();
            try
            {
                using (var db = new DataContext())
                {
                    perfil = db.Perfiles.Where(x => x.UsuariosId == v_UsuarioId && x.TipoPerfilId== v_TipoPerfilId).FirstOrDefault ();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return perfil??new Perfiles();
        }

    }
}
