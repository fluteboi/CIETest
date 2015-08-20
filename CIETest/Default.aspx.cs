using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIEClass;
using System.Web.Security;

namespace CIETest
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string registerStatus = string.Empty;
                if (Request.UrlReferrer != null)
                {
                    if (Request.UrlReferrer.AbsolutePath.ToString() == "/User/UserNew.aspx")
                    {
                        registerStatus = Request.QueryString["Register"];
                    }
                }

                if (registerStatus == "true")
                {
                    Message.Visible = true;
                    Message.Text = "Registered Successfully, please login below!";
                }
                else if (registerStatus == "false")
                {
                    Message.Visible = true;
                    Message.Text = "Registration failed, please try again!";
                }
            }
        }

        protected void Login(object sender, EventArgs e)
        {
            string username = inputLogin.Text;
            string password = inputPassword.Text;
            int userID = Users.GetUserByUserName(username, password);

            if (userID > 0)
            {
                FormsAuthentication.SetAuthCookie(userID.ToString(), Persist.Checked);
                Response.Redirect(string.Format("~/ItemPage/ItemList.aspx?ID={0}", userID));
            }

            Message.Visible = true;
            Message.Text = "Login failed! Please try again!";       
        }

        protected void Register(object sender, EventArgs e)
        {
            Response.Redirect("~/User/UserNew.aspx");
        }
    }
}