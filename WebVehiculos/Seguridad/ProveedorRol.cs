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
   public class ProveedorRol:RoleProvider
    {
       public override bool IsUserInRole(string username, string roleName)
       {

           using (var db=new VehiculosLuisEntities())
           {
               var us = db.UsuarioSet.First(o => o.Login == username);
               try
               {
                   return us.Rol.Nombre == roleName;
               }
               catch (Exception e)
               {
                   return false;
               }
           }

       }

       public override string[] GetRolesForUser(string username)
       {
            var clave = ConfigurationManager.AppSettings["ClaveCifrado"];
            var cif = SeguridadUtilidades.Cifrar(username, clave);
            using (var db = new VehiculosLuisEntities())
            {
                var us = db.UsuarioSet.First(o => o.Login == username);
                try
                {
                    return new []{ us.Rol.Nombre};
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }

       public override void CreateRole(string roleName)
       {
           throw new NotImplementedException();
       }

       public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
       {
           throw new NotImplementedException();
       }

       public override bool RoleExists(string roleName)
       {
           throw new NotImplementedException();
       }

       public override void AddUsersToRoles(string[] usernames, string[] roleNames)
       {
           throw new NotImplementedException();
       }

       public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
       {
           throw new NotImplementedException();
       }

       public override string[] GetUsersInRole(string roleName)
       {
           throw new NotImplementedException();
       }

       public override string[] GetAllRoles()
       {
           throw new NotImplementedException();
       }

       public override string[] FindUsersInRole(string roleName, string usernameToMatch)
       {
           throw new NotImplementedException();
       }

       public override string ApplicationName { get; set; }
    }
}
