using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Perfiles_CategoriaTipoPerfilManager
    {
        public bool Perfiles_CategoriaTipoPerfilExist(int v_PerfilId, int v_CategoriaTipoPerfiId) {
            bool resp = false;
            try
            {
                using (var db = new DataContext())
                {
                    resp = db.Perfiles_CategoriaTipoPerfil.Any(x => x.PerfilesId == v_PerfilId && x.CategoriaTipoPerfilId == v_CategoriaTipoPerfiId);
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            return resp;
        }

        public List<Perfiles_CategoriaTipoPerfil> GetPerfiles_CategoriaTipoPerfilByPerfilId(int v_PerfilId) {
            List<Perfiles_CategoriaTipoPerfil> lista = new List<Perfiles_CategoriaTipoPerfil>();
            try
            {
                using (var db = new DataContext())
                {
                    lista = db.Perfiles_CategoriaTipoPerfil.Where(x => x.PerfilesId == v_PerfilId).ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return lista;
        }

        public RespondModel Guardar(Perfiles_CategoriaTipoPerfil modelo)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    
                    if (!Perfiles_CategoriaTipoPerfilExist(modelo.PerfilesId, modelo.CategoriaTipoPerfilId))
                    {
                        
                        db.Entry(modelo).State = System.Data.Entity.EntityState.Added;
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
        public RespondModel Eliminar(Perfiles_CategoriaTipoPerfil modelo)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {

                    if (Perfiles_CategoriaTipoPerfilExist(modelo.PerfilesId, modelo.CategoriaTipoPerfilId))
                    {

                        db.Entry(modelo).State = System.Data.Entity.EntityState.Added;
                        mensaje = "Registro eliminado exitosamente";
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

        public RespondModel EliminarAllCategoriaPerfil(int v_PerfilId)
        {
            var rm = new RespondModel();
            
            try
            {
                SqlParameter PerfilId = new SqlParameter { ParameterName = "PerfilId", SqlDbType = System.Data.SqlDbType.Int, Value = v_PerfilId };
                using (var db = new DataContext()) {
                    var respond = db.Database.ExecuteSqlCommand("EXEC dbo.usp_deleteAllPerfiles_CategoriaTipoPerfil_by_PerfilId @PerfilId", PerfilId);
                }

                rm.SetResponse(true, "Registros elimnados correctamente");
            }
            catch (Exception)
            {

                rm.SetResponse(false, "Ha ocurrido un error");
            }
            return rm;
        }

        public RespondModel GuardarCategoriasMasivo(int v_PerfilId, List<int> v_ListaCategorias)
        {
            var rm = new RespondModel();
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("CategoriaTipoPerfilId", typeof(int));

                foreach (var item in v_ListaCategorias)
                {
                    dt.Rows.Add(item);
                }
                //DataTable dt = Utilidades.ToDataTable(v_ListaCategorias.Select(x=> CategoriaTipoPerfilId ));
                SqlParameter PerfilId = new SqlParameter { ParameterName = "PerfilId", SqlDbType = System.Data.SqlDbType.Int, Value = v_PerfilId };
                SqlParameter listofCategoriaTipoPerfilId = new SqlParameter { ParameterName = "listofCategoriaTipoPerfilId", SqlDbType = System.Data.SqlDbType.Structured, TypeName = "dbo.udt_listofCategoriaTipoPerfilId", Value = dt };

                using (var db = new DataContext())
                {
                    var respuesta = db.Database.ExecuteSqlCommand("EXEC usp_ins_Lista_CategoriaPerfil @PerfilId,@listofCategoriaTipoPerfilId", PerfilId, listofCategoriaTipoPerfilId);
                }
                rm.SetResponse(true, "Proceso finalizado correctamente");
            }
            catch (Exception ex)
            {

                rm.SetResponse(false, "Ha ocurrido un error");
            }
            return rm;
        }
    }
}
