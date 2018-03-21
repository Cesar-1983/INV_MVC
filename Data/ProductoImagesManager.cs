﻿using Entidades;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class ProductoImagesManager
    {
        public List<ProductoImages> GetAll()
        {
            List<ProductoImages> lista = new List<ProductoImages>();
            using (var db = new DataContext())
            {
                lista = db.ProductoImages.ToList();
            }
            return lista;
        }
        public ProductoImages GetProductoImagesPorId(int id)
        {
            ProductoImages Lista = new ProductoImages();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.ProductoImages.Where(x => x.Id == id).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }
        public List<ProductoImages> GetProductImageByProductId(int id) {
            List<ProductoImages> lista = new List<ProductoImages>();
            using (var db = new DataContext())
            {
                lista = db.ProductoImages.Where(x=> x.IdProducto == id).ToList();
            }
            return lista;
        }
        public RespondModel Guardar(ProductoImages ProductoImages)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    if (ProductoImages.Id > 0)
                    {
                        db.Entry(ProductoImages).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Registro actualizado exitosamente";
                    }
                    else
                    {
                        //db.Entry(Producto).State = System.Data.Entity.EntityState.Added;
                        db.Entry(ProductoImages).State = System.Data.Entity.EntityState.Added;
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
                    var reg = db.ProductoImages.Where(x => x.Id == id).FirstOrDefault();
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
