﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebService
{
    public class Fn
    {
        public static SqlConnection GetConnection()
        {
            try
            {

                string strConnect = "Data Source=.;Initial Catalog=BDINV;User ID=mvc;Password=Curso2018";

                return new SqlConnection(strConnect);
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public static DataTable Leer(string Cmd)
        {
            DataTable dt = new DataTable();
            SqlConnection Cn = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter(Cmd, Cn);
            try
            {
                Cn.Open();
                da.SelectCommand.Connection = Cn;
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                try
                {
                    da = new SqlDataAdapter(("SET DATEFORMAT DMY; EXEC " + Cmd), Cn);
                    da.SelectCommand.Connection = Cn;
                    da.Fill(dt);
                }
                catch (Exception exa)
                {
                    throw new Exception(exa.Message);
                }
            }
            return dt;
        }
        public static DataTable Leer(string Procedimiento, params object[] Parametros)
        {
            SqlConnection cn =Fn.GetConnection();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = Procedimiento;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;
            cn.Open();
            cmd.Connection = cn;
            da.SelectCommand = cmd;
            SqlCommandBuilder.DeriveParameters(cmd);

            try
            {
                if ((Parametros != null))
                {
                    for (int i = 1; i <= Parametros.Length; i++)
                    {
                        cmd.Parameters[i].Value = Parametros[i - 1];
                    }
                }

                da.Fill(dt);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return dt;
        }


        public static bool Guardar(string Procedimiento, params object[] Parametros)
        {
            try
            {
                SqlConnection cn = Fn.GetConnection();
                SqlCommand cmd = new SqlCommand();

                cmd.CommandText = Procedimiento;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cn.Open();
                cmd.Connection = cn;
                SqlCommandBuilder.DeriveParameters(cmd);
                if (Parametros != null)
                {
                    for (int i = 1; i <= Parametros.Length; i++)
                    {
                        cmd.Parameters[i].Value = Parametros[i - 1];
                    }
                }
                cmd.ExecuteNonQuery();
                cmd = null;
                cn.Close();

                return true;
            }
            catch (Exception)
            {
                return false;
                //throw new Exception("SP: " + Procedimiento + "\r\n" + ex.Message);                       
            }
        }
    }
}