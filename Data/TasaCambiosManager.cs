using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Data
{
    public class TasaCambiosManager
    {
        public List<TasaCambios> GetAll()
        {
            List<TasaCambios> listarTasas = new List<TasaCambios>();
            using (var db = new DataContext())
            {
                listarTasas = db.TasaCambios.Include("Monedas").Include("Monedas1").ToList();
            }
            return listarTasas;
        }

        public TasaCambios TasaCambioPorId(int id)
        {
            TasaCambios Lista = new TasaCambios();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.TasaCambios.Where(x => x.IdTasaCambio == id).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }

        public RespondModel Guardar(TasaCambios TasaCambio)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    if (TasaCambio.IdTasaCambio > 0)
                    {
                        db.Entry(TasaCambio).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Tasa actualizada exitosamente";
                    }
                    else
                    {
                        db.Entry(TasaCambio).State = System.Data.Entity.EntityState.Added;
                        mensaje = "Tasa agregada exitosamente";
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

        public RespondModel Eliminar(int id)
        {
            var rm = new RespondModel();
            string mensaje = "";
            bool resp = false;
            try
            {
                using (var db = new DataContext())
                {
                    var reg = db.TasaCambios.Where(x => x.IdTasaCambio == id).FirstOrDefault();
                    if (reg.IdTasaCambio > 0)
                    {
                        db.Entry(reg).State = System.Data.Entity.EntityState.Deleted;
                        mensaje = "Tasa eliminada exitosamente";
                        resp = true;
                    }
                    else
                    {
                        resp = false;
                        mensaje = "La Tasa no existe.";
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
