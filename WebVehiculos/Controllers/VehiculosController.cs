using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebVehiculos.Models;

namespace WebVehiculos.Controllers
{
    [Authorize]

    public class VehiculosController : Controller
    {
        VehiculosLuisEntities db=new VehiculosLuisEntities();
        // GET: Vehiculos
        public ActionResult Index(int id)
        {
            ViewBag.idTipo = id;

            var data = db.Vehiculo.Where(o => o.idTipo == id);


            return View(data);
        }

        public ActionResult Buscar(int idTipo,
            int campo, String contenido)
        {
            var data = db.Vehiculo.Where(o => o.idTipo == idTipo);
            if (campo == 1)
            {
                data = data.Where(o => o.matricula.Contains(contenido));
            }
            else
            {
                data = data.Where(o => o.marca.Contains(contenido));
            }

            return PartialView("_Listado", data.ToList());
        }

        [HttpPost]
        public ActionResult Alta(Vehiculo model)
        {
            db.Vehiculo.Add(model);
            db.SaveChanges();
            return Json(model);
        }

    }
}