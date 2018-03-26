using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INV_MVC.Models.Seguridad
{
    public class SelectedRolesAccionesEditorViewModel
    {
        public int IdAccion { get; set; }
        public string Accion { get; set; }
        public string Controlador { get; set; }
        public bool Selected { get; set; }
    }
    public class RolAddPermisoViewModel: Entidades.Roles
    {
        public List<SelectedRolesAccionesEditorViewModel> Acciones { get; set; }

        public RolAddPermisoViewModel() {
            this.Acciones = new List<SelectedRolesAccionesEditorViewModel>();
        }
    }
}