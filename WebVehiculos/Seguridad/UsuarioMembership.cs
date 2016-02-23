using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;
using WebVehiculos.Models;
using WebVehiculos.Utilidades;

namespace WebVehiculos.Seguridad
{
  public class UsuarioMembership:MembershipUser
    {
        public int id { get; set; }
        public string login { get; set; }
        public string nombre { get; set; }
        public string apellidos { get; set; }

        public String Rol { get; set; }
         public override String Email { get; set; }
      public UsuarioMembership(Usuario us)
      {
          var clave = ConfigurationManager.AppSettings["ClaveCifrado"];
          id = us.Id;
          nombre = us.Nombre;
          apellidos = us.Apellidos;
          Rol = us.Rol.Nombre;
          Email =SeguridadUtilidades.
                DesCifrar(Convert.FromBase64String(us.Email),clave);
          login = us.Login;
      }

    }
}
