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

    Master ob = new Master();
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
            BindSalesMetrics();
        }
    }

    private void BindSalesMetrics()
    {
        try
        {
            int employeeId = Convert.ToInt32(Session["employee_id"]);

            DataTable dt = ob.get_employee_dashboard_metrics(employeeId);

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                lblMyFieldLeads.Text = row["MyFieldLeads"].ToString();
                lblActiveLeads.Text = row["ActiveLeads"].ToString();

                lblTodayCalls.Text = row["TodayCalls"] + " Calls";

                lblMonthlyTarget.Text =
                    row["MonthlyCalls"] + " / " + row["MonthlyTarget"];
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message);
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