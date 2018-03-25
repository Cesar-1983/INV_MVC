using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
namespace Data
{
    public class OperacionManager
    {
        public List<Operacion> GetAll()
        {
            List<Operacion> lista = new List<Operacion>();
            using (var db = new DataContext())
            {
                lista = db.Operacion.Include("TipoOperacion").Include("Usuarios"). ToList();
            }
            return lista;
        }
        public Operacion GetOperacionPorId(int id)
        {
            Operacion Lista = new Operacion();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Operacion.Where(x => x.Id == id).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }
        public Operacion GetOperacionPorTipoOperacion(int IdTipoOperacion)
        {
            Operacion Lista = new Operacion();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Operacion.Where(x => x.IdTipoOperacion == IdTipoOperacion).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }
        public ResponseDB Guardar(Operacion operacion) {
            ResponseDB respuesta = new ResponseDB();

            decimal totaldetalle = 0;

            DataTable dt = new DataTable();
            dt.Columns.Add("IdProducto",typeof(int));
            dt.Columns.Add("Cantidad", typeof(int));
            dt.Columns.Add("Precio", typeof(decimal));

            int cantProductos=0;
            if (operacion.DetalleOperacion != null && operacion.DetalleOperacion.Count > 0) {
                foreach (var item in operacion.DetalleOperacion)
                {
                    totaldetalle = totaldetalle + (item.Precio * item.Cantidad);
                    cantProductos = cantProductos + item.Cantidad;
                    dt.Rows.Add(new object[] { item.IdProducto, item.Cantidad, item.Precio });
                }
            }
            operacion.Total = totaldetalle;
            operacion.CantProductos = cantProductos;

            if (operacion.Total <= 0) {
                respuesta.NoError = 1;
                respuesta.Mensaje = "La total de la operacion es menor o igual a 0";
                return respuesta;
            }
            try
            {
                SqlParameter IdCliente = new SqlParameter { ParameterName = "IdCliente", SqlDbType = System.Data.SqlDbType.Int, Value = (object)operacion.IdCliente ?? DBNull.Value };
                SqlParameter IdTipoOperacion = new SqlParameter { ParameterName = "IdTipoOperacion", SqlDbType = System.Data.SqlDbType.Int, Value = operacion.IdTipoOperacion };
                SqlParameter Total = new SqlParameter { ParameterName = "Total", SqlDbType = System.Data.SqlDbType.Decimal, Value = operacion.Total };
                SqlParameter CantProductos = new SqlParameter { ParameterName = "CantProductos", SqlDbType = System.Data.SqlDbType.Int, Value = operacion.CantProductos };
                SqlParameter Estado = new SqlParameter { ParameterName = "Estado", SqlDbType = System.Data.SqlDbType.Char, Value = operacion.Estado };
                SqlParameter UsuarioCrea = new SqlParameter { ParameterName = "UsuarioCrea", SqlDbType = System.Data.SqlDbType.Int, Value = operacion.UsuarioCrea };
                SqlParameter detalle = new SqlParameter { ParameterName = "detalle", SqlDbType = System.Data.SqlDbType.Structured, TypeName = "dbo.udt_DetalleOperacion", Value = dt };

                using (var db = new DataContext())
                {
                    respuesta = db.Database.SqlQuery<ResponseDB>("EXEC usp_InsertaOperacion @IdCliente ,@IdTipoOperacion ,@Total ,@CantProductos ,@Estado ,@UsuarioCrea ,@detalle", IdCliente, IdTipoOperacion, Total, CantProductos, Estado, UsuarioCrea, detalle).FirstOrDefault();
                }

            }
            catch (Exception ex)
            {

                respuesta.NoError = 1;
                respuesta.Mensaje = ex.Message;
            }
            return respuesta;
        }
    }
}
