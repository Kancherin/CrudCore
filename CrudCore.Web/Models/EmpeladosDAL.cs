using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CrudCore.Web.Models
{
    public class EmpeladosDAL
    {
        string _connectionString = "Data Source=david-pc;Initial Catalog=EmpleadosDB;Integrated Security=True";

        public IEnumerable<EmpleadosInfo> GetEmpleados()
        {
            List<EmpleadosInfo> _empleados = new List<EmpleadosInfo>();
            
        }
    }
}
