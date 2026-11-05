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

    Master ob = new Master();
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        bind_dashboard_cards();

        bind_recent_leads();
        bind_upcoming_followups();

        if (Session["CallSuccess"] != null)
        {
            string msg = Session["CallSuccess"].ToString();
            Session.Remove("CallSuccess");
            ClientScript.RegisterStartupScript(this.GetType(), "CallSuccess", "alert('" + System.Web.HttpUtility.JavaScriptStringEncode(msg) + "');", true);
        }

    }

    private void bind_recent_leads()
    {
        DataTable dt = ob.get_recent_leads();

        rptRecentLeads.DataSource = dt;
        rptRecentLeads.DataBind();
    }

    private void bind_upcoming_followups()
    {
        DataTable dt = ob.get_upcoming_followups();

        rptUpcomingFollowups.DataSource = dt;
        rptUpcomingFollowups.DataBind();
    }

    private void bind_dashboard_cards()
    {
        lblTotalLeads.Text = ob.get_total_leads().ToString();

        lblConfirmedLeads.Text = ob.get_confirmed_leads().ToString();

        lblPendingLeads.Text = ob.get_pending_leads().ToString();

        lblHotLeads.Text = ob.get_hot_leads().ToString();

        lblTotalEmployees.Text = ob.get_total_employees().ToString();

        lblTodayFollowups.Text = ob.get_today_followups().ToString();

        lblPendingFollowups.Text = ob.get_pending_followups().ToString();

        int total = Convert.ToInt32(lblTotalLeads.Text);
        int confirmed = Convert.ToInt32(lblConfirmedLeads.Text);

        double conversion = total > 0
            ? (confirmed * 100.0) / total
            : 0;

        lblConversion.Text = conversion.ToString("0.0") + "% Conv.";
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

            ob.insert_call_history(leadCode, "Admin", "Admin", callStatus, nextFollowupDate, remarks);

            Session["CallSuccess"] = "Call details saved successfully!";
            Response.Redirect(Request.RawUrl, false);
            Context.ApplicationInstance.CompleteRequest();

            bind_dashboard_cards();
            bind_recent_leads();
            bind_upcoming_followups();
        }
        catch (Exception ex)
        {
            string error = System.Web.HttpUtility.JavaScriptStringEncode(ex.Message);
            ClientScript.RegisterStartupScript(this.GetType(), "CallError", "alert('" + error + "');", true);
        }
    }
}