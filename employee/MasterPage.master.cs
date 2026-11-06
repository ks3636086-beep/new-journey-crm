using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["employee_id"] == null)
        {
            Response.Redirect("Employee_Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            BindEmployeeProfile();
        }
    }

    private void BindEmployeeProfile()
    {
        string name = Convert.ToString(Session["employee_name"]);
        string username = Convert.ToString(Session["employee_username"]);
        string email = Convert.ToString(Session["employee_email"]);
        string category = Convert.ToString(Session["employee_category"]);

        litHeaderName.Text = name;
        litMenuName.Text = name;
        litMenuUsername.Text = username;
        litMenuEmail.Text = email;

        litHeaderCategory.Text = category + " Employee";
        litMenuCategory.Text = "Category: " + category;

        string initials = "";

        foreach (string word in name.Trim().Split(' '))
        {
            if (word.Length > 0)
                initials += word.Substring(0, 1);
        }

        litHeaderAvatar.Text = initials.Length > 2
            ? initials.Substring(0, 2).ToUpper()
            : initials.ToUpper();
    }

}
