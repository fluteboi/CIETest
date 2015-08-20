using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace CIEClass
{
    public static class DBInfo
    {
        public static string connectionstring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    }
}