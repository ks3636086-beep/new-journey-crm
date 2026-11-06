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

        string query = @"
            SELECT lead_code, client_name, mobile, alternate_mobile,
                   city, destination, travel_date, lead_status,
                   lead_priority, followup_date, remarks,
                   created_by, assigned_employee_id
            FROM dbo.tbl_leads
            WHERE lead_code = @lead_code
            AND created_by = @created_by";

        using (SqlCommand cmd = new SqlCommand(query, ob.con))
        {
            cmd.Parameters.AddWithValue("@lead_code", leadCode);
            cmd.Parameters.AddWithValue(
                "@created_by",
                Convert.ToString(Session["employee_name"])
            );

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
                litDCreatedBy.Text = Value(row, "created_by");

                litDDest.Text = Value(row, "destination");
                litDDate.Text = FormatDate(row, "travel_date");
                litDStatus.Text = Value(row, "lead_status");
                litDPriority.Text = Value(row, "lead_priority");
                litDFollowup.Text = FormatDate(row, "followup_date");
                litDAssignedEmployee.Text =
                    Value(row, "assigned_employee_id");

                litDNotes.Text = Value(row, "remarks");
            }
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


