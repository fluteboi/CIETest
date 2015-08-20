using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIEClass;
using System.Text;

namespace CIETest.ItemPage
{
    public partial class ItemList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["ID"];
                Session["id"] = id;

                if (string.IsNullOrEmpty(id))
                {
                    Response.Redirect("~/Default.aspx");
                }

                UserProfile user = Users.GetUser(Convert.ToInt32(id));
                lblWelcome.Text = string.Format("Welcome {0}!", user.name);

                GetData();
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void GVItemList_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRow row = ((DataRowView)e.Row.DataItem).Row;
                int userID = Convert.ToInt32(Session["id"]);
                int rowUserID = row.Field<int>("userId");

                if (userID != rowUserID)
                {
                    e.Row.Cells[2].Enabled = false;
                    e.Row.Cells[3].Enabled = false;
                }
            }
        }

        protected void AddItem(object sender, EventArgs e)
        {
            Message msg = new Message();
            msg.MessageBody = txtMessage.Text;
            msg.UserId = Convert.ToInt32(Session["id"]);
            if (Messages.AddItem(msg))
            {
                AddItemMessage.Text = "Item added successfully!";
                AddItemMessage.Visible = true;
                GetData();
            }
            else
            {
                AddItemMessage.Text = "Item create failed!";
                AddItemMessage.Visible = true;
            }
        }

        protected void GVItemList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteMessage")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int itemID = Convert.ToInt32(GVItemList.DataKeys[index].Values["Id"]);
                if(DeleteItem(itemID))
                {
                    GetData();
                }
            }
            else if (e.CommandName == "EditMessage")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GVItemList.Rows[index];
                int userID = Convert.ToInt32(GVItemList.DataKeys[index].Values["userId"]);
                int itemID = Convert.ToInt32(GVItemList.DataKeys[index].Values["Id"]);

                ViewState["userID"] = userID;
                ViewState["itemID"] = itemID;

                EdittxtMessage.Text = row.Cells[0].Text;

                StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#EditItemModal').modal('show');");
                sb.Append(@"</script>");

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModalScript", sb.ToString(), false);

            }
        }

        protected void UpdateItem(object sender, EventArgs e)
        {
            Message msg = new Message();
            msg.id = Convert.ToInt32(ViewState["itemID"]);
            msg.UserId = Convert.ToInt32(ViewState["userID"]);
            msg.MessageBody = EdittxtMessage.Text;

            if (Messages.UpdateItem(msg))
            {
                GetData();
            }

            StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#EditItemModal').modal('hide');");
            sb.Append("$('.modal-backdrop.fade.in').remove();");
            sb.Append(@"</script>");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModalScript", sb.ToString(), false);
        }

        private bool DeleteItem(int itemID)
        {
            return Messages.DeleteItem(itemID);
        }

        private void GetData()
        {
            DataTable dt = new DataTable();
            dt = Messages.GetItemList();
            GVItemList.DataSource = dt;
            GVItemList.DataBind();
        }
    }
}