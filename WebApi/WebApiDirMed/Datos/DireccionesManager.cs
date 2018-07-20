using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
namespace Datos
{
    public class DireccionesManager
    {
        public List<Direcciones> GetAllDirecciones()
        {
            List<Direcciones> Lista = new List<Direcciones>();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Direcciones.ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }

        public List<Direcciones> GetDireccionesByPerfil(int v_PerfilId)
        {
            List<Direcciones> Lista = new List<Direcciones>();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Direcciones.Where(x => x.PefilId == v_PerfilId).ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }

        public RespondModel Guardar(Direcciones direcciones)
        {
            var rm = new RespondModel();
            string mensaje = "";
            SqlParameter Id = new SqlParameter { ParameterName = "Id", SqlDbType = System.Data.SqlDbType.Int, Value = direcciones.Id };
            SqlParameter PefilId = new SqlParameter { ParameterName = "PefilId", SqlDbType = System.Data.SqlDbType.Int, Value = direcciones.PefilId };
            SqlParameter Direccion = new SqlParameter { ParameterName = "Direccion", SqlDbType = System.Data.SqlDbType.NVarChar,Size=500, Value = direcciones.Direccion };
            SqlParameter latitud = new SqlParameter { ParameterName = "latitud", SqlDbType = System.Data.SqlDbType.Float, Value = direcciones.latitud };
            SqlParameter longitud = new SqlParameter { ParameterName = "longitud", SqlDbType = System.Data.SqlDbType.Float, Value = direcciones.longitud };


            try
            {
                using (var db = new DataContext())
                {
                    rm = db.Database.SqlQuery<RespondModel>("EXEC dbo.sp_InsUpdDirecciones @Id,@PefilId,@Direccion,@latitud,@longitud", Id, PefilId, Direccion, latitud, longitud).FirstOrDefault();

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
        public RespondModel Eliminar(Direcciones direcciones)
        {
            var rm = new RespondModel();
            string mensaje = "";
            SqlParameter Id = new SqlParameter { ParameterName = "Id", SqlDbType = System.Data.SqlDbType.Int, Value = direcciones.Id };
            SqlParameter PefilId = new SqlParameter { ParameterName = "PefilId", SqlDbType = System.Data.SqlDbType.Int, Value = direcciones.PefilId };
            //SqlParameter Dirección = new SqlParameter { ParameterName = "Direccion", SqlDbType = System.Data.SqlDbType.NVarChar, Value = direcciones.Direccion };
            //SqlParameter latitud = new SqlParameter { ParameterName = "latitud", SqlDbType = System.Data.SqlDbType.Float, Value = direcciones.latitud };
            //SqlParameter longitud = new SqlParameter { ParameterName = "longitud", SqlDbType = System.Data.SqlDbType.Float, Value = direcciones.longitud };


            try
            {
                using (var db = new DataContext())
                {
                    rm = db.Database.SqlQuery<RespondModel>("EXEC dbo.sp_DelDirecciones @Id,@PefilId", Id, PefilId).FirstOrDefault();

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
