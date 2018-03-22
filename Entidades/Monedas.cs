using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Monedas
    {
        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        //public Monedas()
        //{
        //    TasaCambios = new HashSet<TasaCambios>();
        //    TasaCambios1 = new HashSet<TasaCambios>();
        //}
        [Key]

        public int Id { get; set; }
        [StringLength(50)]

        public string Nombre { get; set; }
        [StringLength(10)]

        public string Simbolo { get; set; }
        [StringLength(10)]

        public string Codigo { get; set; }
        public int Numero { get; set; }
        public bool IsLocal { get; set; }

        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TasaCambios> TasaCambios { get; set; }

        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TasaCambios> TasaCambios1 { get; set; }
    }
}
