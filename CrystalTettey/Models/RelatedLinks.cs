using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CrystalTettey.Models
{
    [Table("tblRelatedLinks")]
    public class RelatedLinks
    {
        [Key]
        public decimal linkId { get; set; }
        public string linkName { get; set; }
        public string linkDescription { get; set; }
        public string linkAddress { get; set; }
    }
}