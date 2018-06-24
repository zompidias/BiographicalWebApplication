using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace CrystalTettey.Models
{
    public class CrystalTetteyEntities : DbContext
    {
        public DbSet<RelatedLinks> RelatedLinkss { get; set; }
        public DbSet<PhotoGallery> PhotoGallerys { get; set; }
        public DbSet<ContactUs> ContactUss { get; set; }

    }
}