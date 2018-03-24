using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity.Validation;
namespace Data
{
    public class ProductoManager
    {
        public List<Producto> GetAll()
        {
            List<Producto> lista = new List<Producto>();
            using (var db = new DataContext())
            {
                lista = db.Producto.Include("Categoria").ToList();
            }
            return lista;
        }
        public Producto GetProductoPorId(int id)
        {
            Producto Lista = new Producto();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Producto.Where(x => x.Id == id).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }

        public RespondModel Guardar(Producto Producto)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    if (Producto.Id > 0)
                    {
                        db.Entry(Producto).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Registro actualizado exitosamente";
                    }
                    else
                    {
                        //db.Entry(Producto).State = System.Data.Entity.EntityState.Added;
                        db.Producto.Add(Producto);
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
                    var reg = db.Producto.Where(x => x.Id == id).FirstOrDefault();
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
