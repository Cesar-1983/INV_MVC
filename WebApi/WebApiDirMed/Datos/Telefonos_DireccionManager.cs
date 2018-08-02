using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;
using System.Data.Entity.Validation;

namespace Datos
{
    public class Telefonos_DireccionManager
    {
        public List<Telefonos_Direccion> GetAllTelefonosByDireccionId(int v_DireccionId) {
            List<Telefonos_Direccion> lista = new List<Telefonos_Direccion>();
            try
            {
                using (var db = new DataContext()) {
                    lista = db.TeleFonos_Direccion.Where(x => x.DireccionId == v_DireccionId).ToList();
                }
            }
            catch (Exception)
            {
                
                throw;
            }
            return lista;
        }

        public RespondModel Guardar(Telefonos_Direccion model) {
            RespondModel rm = new RespondModel();
            SqlParameter Id = new SqlParameter { ParameterName = "Id", SqlDbType = System.Data.SqlDbType.Int, Value = model.Id };
            SqlParameter DireccionId = new SqlParameter { ParameterName = "DireccionId", SqlDbType = System.Data.SqlDbType.Int, Value = model.DireccionId };
            SqlParameter Telefono = new SqlParameter { ParameterName = "Telefono", SqlDbType = System.Data.SqlDbType.NVarChar, Size = 500, Value = model.Telefono};
            try
            {
                using (var db = new DataContext())
                {
                    rm = db.Database.SqlQuery<RespondModel>("EXEC dbo.sp_InsUpdTelefonos_Direccion @Id,@DireccionId,@Telefono", Id, DireccionId,Telefono).FirstOrDefault();

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

        public RespondModel Eliminar(Telefonos_Direccion model)
        {
            RespondModel rm = new RespondModel();
            SqlParameter Id = new SqlParameter { ParameterName = "Id", SqlDbType = System.Data.SqlDbType.Int, Value = model.Id };
            SqlParameter DireccionId = new SqlParameter { ParameterName = "DireccionId", SqlDbType = System.Data.SqlDbType.Int, Value = model.DireccionId };
            try
            {
                using (var db = new DataContext())
                {
                    rm = db.Database.SqlQuery<RespondModel>("EXEC dbo.sp_DelTelefonos_Direccion @Id,@DireccionId", Id, DireccionId).FirstOrDefault();

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
