using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LeadDetails : System.Web.UI.Page
{
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
            BindLeadDetails();
        }
    }

    private void BindLeadDetails()
    {
        string leadCode = Request.QueryString["id"];

        if (string.IsNullOrWhiteSpace(leadCode))
        {
            Response.Write("Invalid Lead ID.");
            return;
        }

        int employeeId = Convert.ToInt32(Session["employee_id"]);
        string employeeName = Convert.ToString(Session["employee_name"]);

        string query = @"
            SELECT lead_code, client_name, mobile, alternate_mobile,
                   city, destination, travel_date, lead_status,
                   lead_priority, followup_date, remarks,
                   created_by, assigned_employee_id
            FROM dbo.tbl_leads
            WHERE lead_code = @lead_code
            AND (created_by = @created_by OR TRY_CONVERT(INT, assigned_employee_id) = @employee_id OR assigned_employee_id = @created_by)";

        using (SqlCommand cmd = new SqlCommand(query, ob.con))
        {
            cmd.Parameters.AddWithValue("@lead_code", leadCode);
            cmd.Parameters.AddWithValue("@created_by", employeeName);
            cmd.Parameters.AddWithValue("@employee_id", employeeId);

            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    Response.Write("Lead not found or access denied.");
                    return;
                }

                DataRow row = dt.Rows[0];

                litDName.Text = Value(row, "client_name");
                lnkDPhone.Text = Value(row, "mobile");

                string mobile = Value(row, "mobile");
                lnkDPhone.NavigateUrl = "tel:" + mobile;

                litDAltPhone.Text = Value(row, "alternate_mobile");
                litDCity.Text = Value(row, "city");
                litLeadCode.Text = Value(row, "lead_code");
                litLeadBreadcrumb.Text = "#" + Value(row, "lead_code") + " Details";
                litDCreatedBy.Text = Value(row, "created_by");

                litDDest.Text = Value(row, "destination");
                litDDate.Text = FormatDate(row, "travel_date");

                // Clean Status display
                string rawStatus = Value(row, "lead_status");
                string displayStatus = rawStatus;
                if (rawStatus.Equals("Not Interested", StringComparison.OrdinalIgnoreCase)) displayStatus = "Cancelled";
                else if (rawStatus.Equals("Pending", StringComparison.OrdinalIgnoreCase) || rawStatus.Equals("Interested", StringComparison.OrdinalIgnoreCase) || rawStatus.Equals("New", StringComparison.OrdinalIgnoreCase)) displayStatus = "In Process";
                litDStatus.Text = displayStatus;

                litDPriority.Text = Value(row, "lead_priority");
                litDFollowup.Text = FormatDate(row, "followup_date");

                // Assigned Staff Name
                string empId = Value(row, "assigned_employee_id");
                if (!string.IsNullOrEmpty(empId) && empId != "-")
                {
                    string empName = ob.get_employee_name(empId);
                    litDAssignedEmployee.Text = string.IsNullOrEmpty(empName) ? empId : empName;
                }
                else
                {
                    litDAssignedEmployee.Text = "Not Assigned";
                }

                litDNotes.Text = Value(row, "remarks");

                // Populate modal labels
                hfLeadCode.Value = leadCode;
                lblModalClientName.Text = Value(row, "client_name");
                lblModalClientPhone.Text = "+91 " + mobile;

                // Bind Call History
                BindCallHistory(leadCode);
            }
        }
    }

    private void BindCallHistory(string leadCode)
    {
        string query = @"
            SELECT call_id, lead_code, called_by, caller_role, call_status, remarks, next_followup_date, call_date
            FROM dbo.tbl_lead_call_history
            WHERE lead_code = @lead_code
            ORDER BY call_date DESC, srno DESC";

        using (SqlCommand cmd = new SqlCommand(query, ob.con))
        {
            cmd.Parameters.AddWithValue("@lead_code", leadCode);

            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptCallHistory.DataSource = dt;
                    rptCallHistory.DataBind();
                    phEmptyCallHistory.Visible = false;
                }
                else
                {
                    rptCallHistory.DataSource = null;
                    rptCallHistory.DataBind();
                    phEmptyCallHistory.Visible = true;
                }
            }
        }
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

    private string Value(DataRow row, string column)
    {
        return row[column] == DBNull.Value
            ? "-"
            : Convert.ToString(row[column]);
    }

    private string FormatDate(DataRow row, string column)
    {
        if (row[column] == DBNull.Value)
            return "-";

        return Convert.ToDateTime(row[column]).ToString("dd MMM yyyy");
    }
}
