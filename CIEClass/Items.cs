using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CIEClass
{
    public static class Messages
    {
        private static string connectionstring = DBInfo.connectionstring;

        public static bool AddItem(Message msg) 
        {
            bool success = false;
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("ItemAdd", conn);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@userId", msg.UserId));
                    cmd.Parameters.Add(new SqlParameter("@message", msg.MessageBody));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    success = true;
                }
                catch
                {
                    success = false;
                }

            }
            return success;
        }

        public static bool UpdateItem(Message msg)
        {
            bool success = false;
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("ItemUpdate", conn);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@id", msg.id));
                    cmd.Parameters.Add(new SqlParameter("@userID", msg.UserId));
                    cmd.Parameters.Add(new SqlParameter("@message", msg.MessageBody));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    success = true;
                }
                catch
                {
                    success = false;
                }

            }
            return success;
        }

        public static bool DeleteItem(int itemID)
        {
            bool success = false;
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("ItemDelete", conn);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@id", itemID));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    success = true;
                }
                catch
                {
                    success = false;
                }

            }
            return success;
        }

        public static DataTable GetItemList()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("ItemList", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();          
                    dt.Load(dr);
                    conn.Close();
                }
                catch
                {
                }

            }
            return dt;
        }

        public static Message GetSingleItem(int itemID)
        {
            return new Message();
        }
    }
}