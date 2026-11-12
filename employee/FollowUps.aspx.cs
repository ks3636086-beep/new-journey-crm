using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class FollowUps : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            BindTodayFollowups();

        }
    }

    private void BindTodayFollowups()
    {
        int employeeId = Convert.ToInt32(Session["employee_id"]);
        rptTodayFollowups.DataSource = ob.get_today_followups_data(employeeId);
        rptTodayFollowups.DataBind();
    }

    private void BindUpcomingFollowups()
    {
        int employeeId = Convert.ToInt32(Session["employee_id"]);
        rptTodayFollowups.DataSource = ob.get_upcoming_followups_data(employeeId);
        rptTodayFollowups.DataBind();
    }

    private void BindOverdueFollowups()
    {
        int employeeId = Convert.ToInt32(Session["employee_id"]);
        rptTodayFollowups.DataSource = ob.get_overdue_followups_data(employeeId);
        rptTodayFollowups.DataBind();
    }

    
}

