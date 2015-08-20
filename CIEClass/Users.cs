using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CIEClass
{
    public static class Users
    {
        private static string connectionstring = DBInfo.connectionstring;

        public static bool AddUser(UserProfile u) 
        {
            bool success = false;
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                //try
                //{
                    Guid userGuid = System.Guid.NewGuid();
                    SqlCommand cmd = new SqlCommand("UserAdd", conn);
                    string hashedPW = Security.Hash(u.password + userGuid.ToString());

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Name", u.name));
                    cmd.Parameters.Add(new SqlParameter("@UserName", u.username));
                    cmd.Parameters.Add(new SqlParameter("@Password", hashedPW));
                    cmd.Parameters.Add(new SqlParameter("@GUID", userGuid));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    success = true;
                //}
                /*catch
                {
            
                    success = false;
                }*/
                
            }
            return success;
        }

        public static void EditUser()
        {
            //Edit user info
        }

        public static UserProfile GetUser(int id)
        {
            UserProfile user = new UserProfile();
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("UserGet", conn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@id", id));

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                dr.Read();
                
                user.id = Convert.ToInt32(dr["id"]);
                user.name = Convert.ToString(dr["Name"]);
                user.username = Convert.ToString(dr["UserName"]);
                conn.Close();
            }
            return user;
        }

        public static int GetUserByUserName(string UserName, string Password)
        {
            int userID = 0;
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("UserGetByUserName", conn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@UserName", UserName));

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    int id = Convert.ToInt32(dr["id"]);
                    string dbPassword = Convert.ToString(dr["Password"]);
                    string dbGUID = Convert.ToString(dr["GUID"]);

                    string hashedPW = Security.Hash(Password + dbGUID.ToString());

                    if (dbPassword == hashedPW)
                    {
                        userID = id;
                        break;
                    }
                }
                conn.Close();
            }
            return userID;
        }
    }
}