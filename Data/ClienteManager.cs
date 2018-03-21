using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity.Validation;
using Entidades;


namespace Data
{
    public class ClienteManager
    {
        public RespondModel Guardar(Cliente cliente)
        {
            var rm = new RespondModel();
            string mensaje = "";

            try
            {
                using (var db = new DataContext())
                {
                    if (cliente.IdCliente > 0)
                    {
                        db.Entry(cliente).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Registro actualizado exitosamente";
                    }
                    else
                    {
                        db.Entry(cliente).State = System.Data.Entity.EntityState.Added;
                        mensaje = "Cliente agregado exitosamente";
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

        public RespondModel Eliminar(int IdCliente)
        {
            var rm = new RespondModel();
            string mensaje = "";
            bool resp = false;
            try
            {
                using (var db = new DataContext())
                {
                    var reg = db.Cliente.Where(x => x.IdCliente == IdCliente).FirstOrDefault();
                    if (reg.IdCliente > 0)
                    {
                        db.Entry(reg).State = System.Data.Entity.EntityState.Deleted;
                        mensaje = "Cliente eliminado exitosamente";
                        resp = true;
                    }
                    else
                    {
                        resp = false;
                        mensaje = "El Cliente no existe.";
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

        public Cliente GetClientePorId(int IdCliente)
        {
            Cliente ListaCliente = new Cliente();
            try
            {
                using (var db = new DataContext())
                {
                    ListaCliente = db.Cliente.Where(x => x.IdCliente == IdCliente).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return ListaCliente;
        }

        public List<Cliente> GetAll()
        {
            List<Cliente> listarclientes = new List<Cliente>();
            using (var db = new DataContext())
            {
                listarclientes = db.Cliente.ToList();
            }
            return listarclientes;
        }
    }
}
