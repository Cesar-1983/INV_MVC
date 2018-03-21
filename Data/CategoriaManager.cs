using Entidades;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class CategoriaManager
    {
        public List<Categoria> GetAll() {
            List<Categoria> lista = new List<Categoria>();
            using (var db = new DataContext())
            {
                lista = db.Categoria.ToList();
            }
            return lista;
        }
        public Categoria GetCategoríaPorId(int id)
        {
            Categoria Lista = new Categoria();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Categoria.Where(x => x.Id == id).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }

        public RespondModel Guardar(Categoria categoria)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    if (categoria.Id > 0)
                    {
                        db.Entry(categoria).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Registro actualizado exitosamente";
                    }
                    else
                    {
                        db.Entry(categoria).State = System.Data.Entity.EntityState.Added;
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

        public RespondModel Eliminar(int id)
        {
            var rm = new RespondModel();
            string mensaje = "";
            bool resp = false;
            try
            {
                using (var db = new DataContext())
                {
                    var reg = db.Categoria.Where(x => x.Id == id).FirstOrDefault();
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
