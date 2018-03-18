using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
namespace Data
{
    public class DataContext : DbContext
    {
        public const string ConnectionString = "BDINV";
        public DataContext() : base(ConnectionString) {
            this.Configuration.LazyLoadingEnabled = true;
            this.Configuration.ProxyCreationEnabled = false;
        }

        public DbSet<EstadoUsuarios> EstadoUsuarios { get; set; }
        public DbSet<PerfilSeguridad> PerfilSeguridad { get; set; }
        public DbSet<Usuarios> Usuarios { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            base.OnModelCreating(modelBuilder);
        }
    }
}
