using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CIEClass
{
    public class Message
    {
        public int id { get; set;}
        public int UserId { get; set; }
        public string MessageBody { get; set; }

        public Message()
        {

        }

        public Message(DataRow dr)
        {
            this.id = Convert.ToInt32(dr[id]);
            this.UserId = Convert.ToInt32(dr[id]);
            this.MessageBody = Convert.ToString(dr["Message"]);
        }
    }
}