using CrudCore.Web.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CrudCore.Web.Controllers
{
    public class EmpleadosController : Controller
    {
        EmpleadosDAL empleadosDAL = new EmpleadosDAL();
        public IActionResult Index()
        {
            List<EmpleadosInfo> lista = new List<EmpleadosInfo>();
            lista = empleadosDAL.GetEmpleados().ToList();
            return View(lista);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(EmpleadosInfo model)
        {
            if (ModelState.IsValid)
            {
                empleadosDAL.AddEmpleados(model);
                return RedirectToAction("Index");
            }
            return View();
        }

        [HttpGet]
        public IActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            EmpleadosInfo emp = empleadosDAL.GetEmpleado(id);
            if (emp == null)
            {
                return NotFound();
            }
            return View(emp);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int? id, EmpleadosInfo model)
        {
            if (id == null)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                empleadosDAL.UpdateEmpleado(model);
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            EmpleadosInfo emp = empleadosDAL.GetEmpleado(id);
            if (emp == null)
            {
                return NotFound();
            }
            return View(emp);
        }

        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            EmpleadosInfo emp = empleadosDAL.GetEmpleado(id);
            if (emp == null)
            {
                return NotFound();
            }
            return View(emp);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteEmp(int? id)
        {
            empleadosDAL.DeleteEmpleado(id);
            return RedirectToAction("Index");
        }
    }
}
