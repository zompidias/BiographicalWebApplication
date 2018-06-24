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
    
    public class CrystalManagerPhotosController : Controller
    {
        CrystalTetteyEntities db = new CrystalTetteyEntities();
        CTBusinessLayer.BusinessLayer dbset = new CTBusinessLayer.BusinessLayer();

        // GET: /CrystalManagerPhotos/

        public ActionResult Index(int? page)
        {
            var ct = dbset.PhotoGallerys;
            int pageSize = 20;
            int pageNumber = (page ?? 1);

            return View(ct.ToPagedList(pageNumber, pageSize));
           // return View(ct.ToList());
        }

        
        //
        // GET: /CrystalManagerPhotos/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /CrystalManagerPhotos/Create

        [HttpPost]
        public ActionResult Create(CTBusinessLayer.PhotoGallery collection)
        {
            if (ModelState.IsValid)
            {
                dbset.AddPhotoDetailsToDB(collection);
                return RedirectToAction("Index");
            }
            return View();
        }

        //
        // GET: /CrystalManagerPhotos/Edit/5

        public ActionResult Edit(int id)
        {
            CTBusinessLayer.PhotoGallery ctitem = dbset.PhotoGallerys.Single(emp => emp.photoId == id);
            if (ctitem == null)
            {
                return HttpNotFound();
            }

            return View(ctitem);
        }

        //
        // POST: /CrystalManagerPhotos/Edit/5

        [HttpPost]
        public ActionResult Edit(CTBusinessLayer.PhotoGallery collection)
        {
            if (ModelState.IsValid)
            {
                var num = collection.photoId;
                dbset.SaveChangesPhotoDetailsToDB(collection);
                return RedirectToAction("Index");
            }

            return View(collection);
        }

        //
        // GET: /CrystalManagerPhotos/Delete/5
                [HttpPost]

        public ActionResult Delete(int id)
        {
            dbset.DeletePhotosFromDB(id);
            return RedirectToAction("Index");
        }

        //
        // POST: /CrystalManagerPhotos/Delete/5

        
    }
}
