using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CTBusinessLayer
{
    public class ContactUs
    {
        
        public decimal ContactUsId { get; set; }

        [Required(ErrorMessage = "Full Name is Required")]
        [DisplayName("Full Name")]
        public string FullName { get; set; }

        [Required]
        [DataType(DataType.MultilineText)]
        public string Comment { get; set; }

        [Required(ErrorMessage = "Email is Required")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}", ErrorMessage = "Email is not Valid")]

        public string Email { get; set; }
    }
}
