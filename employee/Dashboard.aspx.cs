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
            BindTodayFollowups();
            BindRecentLeads();
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

    private void BindTodayFollowups()
    {
        int employeeId = Convert.ToInt32(Session["employee_id"]);

        DataTable dt = ob.get_today_followups(employeeId);

        rptTodayFollowups.DataSource = dt;
        rptTodayFollowups.DataBind();
    }

    private void BindRecentLeads()
    {
        int employeeId = Convert.ToInt32(Session["employee_id"]);

        DataTable dt = ob.get_recent_employee_leads(employeeId);

        rptRecentLeads.DataSource = dt;
        rptRecentLeads.DataBind();
    }

    protected void btnUpdateCall_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        string leadCode = btn.CommandArgument;

        hfLeadCode.Value = leadCode;

        DataTable dt = ob.get_lead_by_code(leadCode);

        if (dt.Rows.Count > 0)
        {
            lblModalClientName.Text = dt.Rows[0]["client_name"].ToString();
            lblModalClientPhone.Text = "+91 " + dt.Rows[0]["mobile"].ToString();
        }
        ClientScript.RegisterStartupScript(
            this.GetType(),
            "OpenCallModal",
            "new bootstrap.Modal(document.getElementById('updateCallModal')).show();",
            true
        );
    }

    protected void btnSaveCallUpdate_Click(object sender, EventArgs e)
    {
        Page.Validate("CallUpdate");
        if (!Page.IsValid) return;

        try
        {
            string leadCode = hfLeadCode.Value;
            string callStatus = ddlCallStatus.SelectedValue;
            object nextFollowupDate = string.IsNullOrWhiteSpace(txtNextFollowUp.Text) ? DBNull.Value : (object)Convert.ToDateTime(txtNextFollowUp.Text);
            string remarks = string.IsNullOrWhiteSpace(txtCallRemarks.Text) ? null : txtCallRemarks.Text.Trim();

            string calledBy = Session["employee_name"] != null ? Session["employee_name"].ToString() : "Employee";
            string callerRole = Session["employee_category"] != null ? Session["employee_category"].ToString() : "Employee";

            ob.insert_call_history(leadCode, calledBy, callerRole, callStatus, nextFollowupDate, remarks);

            Response.Redirect(Request.RawUrl, false);
            Context.ApplicationInstance.CompleteRequest();
        }
        catch (Exception ex)
        {
            string error = System.Web.HttpUtility.JavaScriptStringEncode(ex.Message);
            ClientScript.RegisterStartupScript(this.GetType(), "CallError", "alert('" + error + "');", true);
        }
    }
}