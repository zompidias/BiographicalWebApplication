using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CTBusinessLayer;
using CrystalTettey.Models;
using PagedList;
using PagedList.Mvc;

namespace CrystalTettey.Controllers
{

    
    public class CrystalManagerRelatedLinksController : Controller
    {
        CrystalTetteyEntities db = new CrystalTetteyEntities();
        CTBusinessLayer.BusinessLayer dbset = new CTBusinessLayer.BusinessLayer();
        //
        // GET: /CrystalManagerRelatedLinks/

        public ActionResult Index(int? page)
        {
            var ct = dbset.RelatedLinked;
            int pageSize = 20;
            int pageNumber = (page ?? 1);

            return View(ct.ToPagedList(pageNumber, pageSize));
        }

        //
        
        //
        // GET: /CrystalManagerRelatedLinks/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /CrystalManagerRelatedLinks/Create

        [HttpPost]
        public ActionResult Create(CTBusinessLayer.RelatedLinks collection)
        {
            if (ModelState.IsValid)
            {
                dbset.AddRelatedLinksDetailsToDB(collection);
                return RedirectToAction("Index");
            }
            return View();
        }

        //
        // GET: /CrystalManagerRelatedLinks/Edit/5

        public ActionResult Edit(int id)
        {
            CTBusinessLayer.RelatedLinks ctitem = dbset.RelatedLinked.Single(emp => emp.linkId == id);
            if (ctitem == null)
            {
                return HttpNotFound();
            }

            return View(ctitem);
        }

        //
        // POST: /CrystalManagerRelatedLinks/Edit/5

        [HttpPost]
        public ActionResult Edit(CTBusinessLayer.RelatedLinks collection)
        {
            if (ModelState.IsValid)
            {
                var num = collection.linkId;
                dbset.SaveChangesRelatedLinksDetailsToDB(collection);
                return RedirectToAction("Index");
            }

            return View(collection);
        }

        //
        // GET: /CrystalManagerRelatedLinks/Delete/5

        [HttpPost]
        public ActionResult Delete(decimal id)
        {
            dbset.DeleteRelatedLinksFromDB(id);
            return RedirectToAction("Index");

            //return View();
        }
    }
}
