using Entidades;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;




namespace Datos
{
    public class UsuariosManager
    {
        public List<Usuarios> GetAllUsuarios()
        {
            List<Usuarios> Lista = new List<Usuarios>();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Usuarios.ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }
        public Usuarios GetUsuariosPorId(int id)
        {
            Usuarios Lista = new Usuarios();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Usuarios.Where(x => x.Id == id).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }
        public Usuarios GetUsuariosPorUserName(string username)
        {
            Usuarios Lista = new Usuarios();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Usuarios.Include("PerfilSeguridad").Include("EstadoUsuarios").Where(x => x.UserName == username || x.Email == username).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            return Lista?? new Usuarios();
        }

        public RespondModel Guardar(Usuarios usuarios)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    if (usuarios.Id > 0)
                    {
                        db.Entry(usuarios).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Registro actualizado exitosamente";
                    }
                    else
                    {
                        db.Entry(usuarios).State = System.Data.Entity.EntityState.Added;
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

        public RespondModel EmailConfirmacion(int id)
        {
            var usuario = GetUsuariosPorId(id);
            usuario.EmailConfirmed = true;
            return Guardar(usuario);
        }

        public RespondModel Eliminar(int id)
        {
            var rm = new RespondModel();
            string mensaje = "";
            bool resp = false;
            try
            {
                using (var db = new DataContext())
                {
                    var reg = db.Usuarios.Where(x => x.Id == id).FirstOrDefault();
                    if (reg.Id > 0)
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
            rm.SetResponse(resp, mensaje);
            return rm;
        }

    }
}
