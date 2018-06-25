using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
namespace Datos
{
    public class CodigoValidacionUsuarioManager
    {
        public CodigoValidacionUsuario GetCodigoValidacionEmailByUsuario(int id) {
            CodigoValidacionUsuario codigo = new CodigoValidacionUsuario();
            try
            {
                using (var db = new DataContext())
                {
                    codigo = db.CodigoValidacionUsuario.Where(x => x.UsuariosId == id && x.Tipo =="CAE").FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw;

            }
            return codigo?? new CodigoValidacionUsuario();
        }
        public RespondModel Guardar(CodigoValidacionUsuario codigo)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    if (codigo.Id > 0)
                    {
                        db.Entry(codigo).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Registro actualizado exitosamente";
                    }
                    else
                    {
                        db.Entry(codigo).State = System.Data.Entity.EntityState.Added;
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

    }
}
