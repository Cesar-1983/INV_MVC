using Entidades;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class TipoPerfilManager
    {
        public List<TipoPerfil> GetAllTipoPerfil()
        {
            List<TipoPerfil> lista = new List<TipoPerfil>();
            try
            {
                using (var db = new DataContext())
                {
                    lista = db.TipoPerfil.ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return lista;
        }

        public RespondModel Guardar(TipoPerfil tipoPerfil)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    if (tipoPerfil.Id > 0)
                    {
                        db.Entry(tipoPerfil).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Registro actualizado exitosamente";
                    }
                    else
                    {
                        db.Entry(tipoPerfil).State = System.Data.Entity.EntityState.Added;
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
