using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebVehiculos.Models;

namespace WebVehiculos.Controllers
{
    [Authorize]

    public class TipoVehiculoController : Controller
    {
       VehiculosLuisEntities db=new VehiculosLuisEntities();
        // GET: TipoVehiculo
        public ActionResult Index()
        {

            return View(db.TipoVehiculo.ToList());
        }

        public ActionResult Alta()
        {
            return View(new TipoVehiculo());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Alta(TipoVehiculo model)
        {
            if (ModelState.IsValid)
            {
                db.TipoVehiculo.Add(model);
                db.SaveChanges();
                return RedirectToAction("Index");

            }

            return View(model);
        }

    }
}