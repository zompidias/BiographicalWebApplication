using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CTBusinessLayer;
using CrystalTettey.Models;

namespace CrystalTettey.Controllers
{
    public class ContactUsController : Controller
    {
        //
        // GET: /ContactUs/
        CrystalTetteyEntities db = new CrystalTetteyEntities();
        CTBusinessLayer.BusinessLayer dbset = new CTBusinessLayer.BusinessLayer();


        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /ContactUs/Details/5

      
        //
        // GET: /ContactUs/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ContactUs/Create

        [HttpPost]
        public ActionResult Create(CTBusinessLayer.ContactUs collection)
        {
            if (ModelState.IsValid)
            {

                dbset.AddEnquiryToDB(collection);

                //Send information to Administrator email
                CTBusinessLayer.SendEmails em = new CTBusinessLayer.SendEmails();
                em.SendEnquiryToEmail(collection);
                return RedirectToAction("Index");

            }
            return View();
            
        }

        //
        
    }
}
