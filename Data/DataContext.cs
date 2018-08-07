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
		public DbSet<Monedas> Monedas { get; set; }
        public DbSet<Categoria> Categoria { get; set; }
        public DbSet<Unidades> Unidades { get; set; }
        public DbSet<Producto> Producto { get; set; }
        public DbSet<ProductoImages> ProductoImages { get; set; }
        public DbSet<Cliente> Cliente { get; set; }
        public DbSet<TasaCambios> TasaCambios { get; set; }
        public DbSet<Operacion> Operacion { get; set; }
        public DbSet<DetalleOperacion> DetalleOperacion { get; set; }
        public DbSet<Roles> Roles { get; set; }
        public DbSet<Acciones> Acciones { get; set; }
        public DbSet<RolesAcciones> RolesAcciones { get; set; }

        public DbSet<Sectores> Sectores { get; set; }
        public DbSet<Paises> Paises { get; set; }
        public DbSet<Empresas> Empresas { get; set; }
        public DbSet<UsuariosEmpresas> UsuariosEmpresas { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Monedas>()
               .HasMany(e => e.TasaCambios)
               .WithRequired(e => e.Monedas)
               .HasForeignKey(e => e.IdMonedaLocal)
               .WillCascadeOnDelete(false);

            modelBuilder.Entity<Monedas>()
                .HasMany(e => e.TasaCambios1)
                .WithRequired(e => e.Monedas1)
                .HasForeignKey(e => e.IdMonedaExtranjera)
                .WillCascadeOnDelete(false);



            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            base.OnModelCreating(modelBuilder);
        }
    }
}
