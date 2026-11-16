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

    public string CurrentTab
    {
        get
        {
            string type = hdnFollowupType.Value;
            return string.IsNullOrEmpty(type) ? "today" : type.ToLower();
        }
    }

    public bool IsTodayTab
    {
        get { return CurrentTab == "today"; }
    }

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
        string employeeName = Session["employee_name"] != null ? Session["employee_name"].ToString() : "";
        DataTable dt = ob.get_today_followups_data(employeeId, employeeName);
        rptTodayFollowups.DataSource = dt;
        rptTodayFollowups.DataBind();

        litFollowupHeading.Text = "Today's Follow-ups";
        litFollowupSubHeading.Text = "High priority client calls scheduled for today";
        litFollowupBadge.Text = dt.Rows.Count + " Pending Calls";
    }

    private void BindUpcomingFollowups()
    {
        int employeeId = Convert.ToInt32(Session["employee_id"]);
        string employeeName = Session["employee_name"] != null ? Session["employee_name"].ToString() : "";
        DataTable dt = ob.get_upcoming_followups_data(employeeId, employeeName);
        rptTodayFollowups.DataSource = dt;
        rptTodayFollowups.DataBind();

        litFollowupHeading.Text = "Upcoming Follow-ups";
        litFollowupSubHeading.Text = "Scheduled client reminders for upcoming dates";
        litFollowupBadge.Text = dt.Rows.Count + " Scheduled Calls";
    }

    private void BindOverdueFollowups()
    {
        int employeeId = Convert.ToInt32(Session["employee_id"]);
        string employeeName = Session["employee_name"] != null ? Session["employee_name"].ToString() : "";

        DataTable dt = ob.get_overdue_followups_data(employeeId, employeeName);
        rptTodayFollowups.DataSource = dt;
        rptTodayFollowups.DataBind();

        litFollowupHeading.Text = "Overdue Follow-ups";
        litFollowupSubHeading.Text = "Past scheduled client reminders that were missed";
        litFollowupBadge.Text = dt.Rows.Count + " Overdue Calls";
    }

    protected void btnLoadFollowups_Click(object sender, EventArgs e)
    {
        string type = hdnFollowupType.Value;

        if (type == "today")
        {
            BindTodayFollowups();
        }
        else if (type == "upcoming")
        {
            BindUpcomingFollowups();
        }
        else if (type == "overdue")
        {
            BindOverdueFollowups();
        }
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

            if (!string.IsNullOrWhiteSpace(ddlTripStatus.SelectedValue))
            {
                string tripStatus = ddlTripStatus.SelectedValue;
                string query = "UPDATE dbo.tbl_leads SET lead_status = @status WHERE lead_code = @code";
                using (SqlCommand cmd = new SqlCommand(query, ob.con))
                {
                    cmd.Parameters.AddWithValue("@status", tripStatus);
                    cmd.Parameters.AddWithValue("@code", leadCode);
                    if (ob.con.State == ConnectionState.Closed) ob.con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "CallSuccess",
                "alert('Call details updated successfully!'); window.location.href='" + Request.RawUrl + "';",
                true
            );
        }
        catch (Exception ex)
        {
            string error = System.Web.HttpUtility.JavaScriptStringEncode(ex.Message);
            ClientScript.RegisterStartupScript(this.GetType(), "CallError", "alert('" + error + "');", true);
        }
    }
}
