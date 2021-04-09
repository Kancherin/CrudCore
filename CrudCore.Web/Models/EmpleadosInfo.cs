using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CrudCore.Web.Models
{
    public class EmpleadosInfo
    {
        public int Id { get; set; }
        [Required]
        public String Name { get; set; }
        [Required]
        public String Gender { get; set; }
        [Required]
        public String Company { get; set; }
        [Required]
        public String Department { get; set; }
    }
}
