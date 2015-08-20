using CIEClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIETest.User
{
    public partial class UserNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
            UserProfile newUser = new UserProfile();
            newUser.name = name.Text;
            newUser.username = inputLogin.Text;
            newUser.password = inputPassword.Text;

            if (Users.AddUser(newUser))
            {
                Response.Redirect("~/Default.aspx?Register=true");
            }

            Response.Redirect("~/Default.aspx?Register=false");
        }

        protected void Cancel(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }
    }
}