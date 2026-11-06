using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
    public enum MessageType { Success, Error, Info, Warning };
    string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

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
            BindDashboardProfile();
        }
    }

    private void BindDashboardProfile()
    {
        string name = Convert.ToString(Session["employee_name"]);
        string category = Convert.ToString(Session["employee_category"]);

        litDashName.Text = name;
        litDashCategory.Text = category + " Employee";

        string initials = "";

        foreach (string word in name.Trim().Split(' '))
        {
            if (word.Length > 0)
                initials += word.Substring(0, 1);
        }

        litDashAvatar.Text = initials.Length > 2
            ? initials.Substring(0, 2).ToUpper()
            : initials.ToUpper();

        if (category.Equals("Sales", StringComparison.OrdinalIgnoreCase))
        {
            litDashDescription.Text =
                "Field sales desk • Client visits • Sourcing and converting travel inquiries.";
        }
        else
        {
            litDashDescription.Text =
                "Back office calling desk • Client calls • Lead follow-ups and inquiry management.";
        }
    }

}