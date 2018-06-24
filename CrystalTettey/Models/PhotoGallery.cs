using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CrystalTettey.Models
{
     [Table("tblPhotoGallery")]
    public class PhotoGallery
    {
        [Key]
        public decimal photoId { get; set; }
        public string photoName { get; set; }
        public string photoDescription { get; set; }
        public string photoAltName { get; set; }
        public string photoLink { get; set; }
        //public virtual List<SellerItems> SellerItems { get; set; }
    }
}