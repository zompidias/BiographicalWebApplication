using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;



namespace CTBusinessLayer
{
    public class RelatedLinks
    {
         [Key]
        public decimal linkId { get; set; }
        public string linkName { get; set; }
        public string linkDescription { get; set; }
        public string linkAddress { get; set; }
    }
}
