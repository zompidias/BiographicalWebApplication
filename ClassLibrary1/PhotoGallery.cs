using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace CTBusinessLayer
{
    public class PhotoGallery
    {
         [Key]
        public decimal photoId { get; set; }
        public string photoName { get; set; }
        public string photoDescription { get; set; }
        public string photoAltName { get; set; }
        public string photoLink { get; set; }
    }
}
