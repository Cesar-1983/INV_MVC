using Entidades;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class RolesAccionesAccionesManager
    {
        public List<RolesAcciones> GetAll()
        {
            List<RolesAcciones> lista = new List<RolesAcciones>();
            using (var db = new DataContext())
            {
                lista = db.RolesAcciones.ToList();
            }
            return lista;
        }
        public RolesAcciones GetRolesAccionesPorId(int IdRol,int IdAccion)
        {
            RolesAcciones Lista = new RolesAcciones();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.RolesAcciones.Where(x => x.IdRol == IdRol && x.IdAcciones== IdAccion).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }
        public bool GetRolesAccionesExist(int IdRol, int IdAccion)
        {
            bool resp = false;
            try
            {
                using (var db = new DataContext())
                {
                    resp = db.RolesAcciones.Any(x => x.IdRol == IdRol && x.IdAcciones == IdAccion);
                }
            }
            catch (Exception)
            {

                throw;
            }
            return resp;
        }

        public List<RolesAcciones> GetRolesAccionesPorRol(int IdRol)
        {
            List<RolesAcciones> Lista = new List<RolesAcciones>();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.RolesAcciones.Where(x => x.IdRol == IdRol ).ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }


        public RespondModel Guardar(RolesAcciones RolesAcciones)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    RolesAcciones dato = GetRolesAccionesPorId(RolesAcciones.IdRol, RolesAcciones.IdAcciones);
                    if (dato.IdRol == 0)
                    {
                        db.Entry(RolesAcciones).State = System.Data.Entity.EntityState.Added;
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

        public RespondModel Eliminar(int IdRol,int IdAccion)
        {
            var rm = new RespondModel();
            string mensaje = "";
            bool resp = false;
            try
            {
                using (var db = new DataContext())
                {
                    var reg = db.RolesAcciones.Where(x => x.IdRol == IdRol && x.IdAcciones== IdAccion).FirstOrDefault();
                    if (reg.IdRol > 0)
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
