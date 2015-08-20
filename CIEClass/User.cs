using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace CIEClass
{
    public class UserProfile
    {
        public int id { get; set; }
        public string name { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string GUID { get; set; }

        public UserProfile()
        {

        }
    }
}