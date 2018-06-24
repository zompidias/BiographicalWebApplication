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
    public class PhotoGalleryController : Controller
    {
        CrystalTetteyEntities db = new CrystalTetteyEntities();
        CTBusinessLayer.BusinessLayer dbset = new CTBusinessLayer.BusinessLayer();

        public ActionResult Index(int? page)
        {
            var ct = dbset.PhotoGallerys;
            int pageSize = 20;
            int pageNumber = (page ?? 1);

            return View(ct.ToPagedList(pageNumber, pageSize));
        }

        //
        // GET: /PhotGallery/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /PhotGallery/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /PhotGallery/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /PhotGallery/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /PhotGallery/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /PhotGallery/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /PhotGallery/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
