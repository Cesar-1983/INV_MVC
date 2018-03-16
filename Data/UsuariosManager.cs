﻿using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class UsuariosManager
    {
        public List<Usuarios> GetAllUsuarios() {
            List<Usuarios> Lista = new List<Usuarios>();
            try
            {
                using (var db = new DataContext()) {
                    Lista = db.Usuarios.ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }
        public Usuarios GetUsuariosPorId( int id)
        {
            Usuarios Lista = new Usuarios();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Usuarios.Where (x=> x.Id == id).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }
        public Usuarios GetUsuariosPorUserName(string username)
        {
            Usuarios Lista = new Usuarios();
            try
            {
                using (var db = new DataContext())
                {
                    Lista = db.Usuarios.Where(x => x.UserName == username || x.Email == username).FirstOrDefault() ;
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Lista;
        }

        public RespondModel Guardar(Usuarios usuarios)
        {
            var rm = new RespondModel();
            string mensaje = "";
            try
            {
                using (var db = new DataContext())
                {
                    if (usuarios.Id > 0)
                    {
                        db.Entry(usuarios).State = System.Data.Entity.EntityState.Modified;
                        mensaje = "Registro actualizado exitosamente";
                    }
                    else
                    {
                        db.Entry(usuarios).State = System.Data.Entity.EntityState.Added;
                        mensaje = "Registro agregado exitosamente";
                    }
                    db.SaveChanges();
                    rm.SetResponse(true, mensaje);
                }


            }
            catch (Exception ex)
            {

                rm.SetResponse(false, ex.Message);
            }
            return rm;
        }

        public RespondModel EmailConfirmacion(int id)
        {
            var usuario = GetUsuariosPorId(id);
            usuario.EmailConfirmed = true;
            return Guardar(usuario);
        }

        public static implicit operator UsuariosManager(EstadoUsuariosManager v)
        {
            throw new NotImplementedException();
        }
    }
}