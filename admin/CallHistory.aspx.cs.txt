using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CallHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // sakshi
            bind_call_history();
            BindStaffFilter();
        }
    }

    // sakshi
    protected void ddlOutcomeFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind_call_history();
    }

    // sakshi
    protected void ddlStaffFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind_call_history();
    }

    // sakshi
    protected void txtSearchCalls_TextChanged(object sender, EventArgs e)
    {
        bind_call_history();
    }

    // sakshi
    protected void btnResetCallFilters_Click(object sender, EventArgs e)
    {
        txtSearchCalls.Text = "";
        ddlOutcomeFilter.SelectedIndex = 0;
        ddlStaffFilter.SelectedIndex = 0;
        bind_call_history();
    }

    // sakshi
    private void bind_call_history()
    {
        using (SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
        {
            // sakshi - query fetching call history & lead details
            string query = @"
            SELECT
                ch.srno,
                ch.call_id,
                ch.lead_code,
                ISNULL(l.client_name, 'No Client') AS client_name,
                ISNULL(l.mobile, '-') AS mobile,
                l.alternate_mobile,
                l.city,
                l.destination,
                l.travel_date,
                ISNULL(l.lead_status, 'New') AS lead_status,
                ISNULL(l.lead_priority, 'Normal') AS lead_priority,
                l.assigned_employee_id,
                ch.called_by,
                ch.caller_role,
                ch.call_date,
                ch.call_status,
                ch.remarks,
                ch.next_followup_date
            FROM tbl_lead_call_history ch
            LEFT JOIN tbl_leads l
                ON LTRIM(RTRIM(ch.lead_code)) = LTRIM(RTRIM(l.lead_code))
            WHERE 1 = 1";

            // sakshi - Outcome Filter based strictly on Call Outcome (ch.call_status)
            if (!string.IsNullOrEmpty(ddlOutcomeFilter.SelectedValue))
            {
                string sel = ddlOutcomeFilter.SelectedValue;
                if (sel == "Connected")
                {
                    query += " AND (ch.call_status LIKE '%answer%' AND ch.call_status NOT LIKE '%not%')";
                }
                else if (sel == "No Answer")
                {
                    query += " AND (ch.call_status LIKE '%not%' OR ch.call_status LIKE '%no answer%')";
                }
                else if (sel == "Busy")
                {
                    query += " AND ch.call_status LIKE '%busy%'";
                }
                else if (sel == "Interested")
                {
                    query += " AND (ch.call_status LIKE '%interested%' AND ch.call_status NOT LIKE '%not%')";
                }
                else if (sel == "Not Interested")
                {
                    query += " AND ch.call_status LIKE '%not interested%'";
                }
                else if (sel == "Call Back Later")
                {
                    query += " AND ch.call_status LIKE '%back%'";
                }
                else
                {
                    query += " AND ch.call_status = @CallStatus";
                }
            }

            // sakshi - Staff Filter
            if (!string.IsNullOrEmpty(ddlStaffFilter.SelectedValue))
            {
                query += " AND ch.called_by = @StaffName";
            }

            // sakshi - Search Filter
            if (!string.IsNullOrWhiteSpace(txtSearchCalls.Text))
            {
                query += @"
                AND (
                    l.client_name LIKE @Search
                    OR l.mobile LIKE @Search
                    OR ch.remarks LIKE @Search
                )";
            }

            query += " ORDER BY ch.call_date DESC, ch.srno DESC";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                // sakshi - Query Parameters
                if (!string.IsNullOrEmpty(ddlOutcomeFilter.SelectedValue) &&
                    ddlOutcomeFilter.SelectedValue != "Connected" &&
                    ddlOutcomeFilter.SelectedValue != "No Answer" &&
                    ddlOutcomeFilter.SelectedValue != "Busy" &&
                    ddlOutcomeFilter.SelectedValue != "Interested" &&
                    ddlOutcomeFilter.SelectedValue != "Not Interested" &&
                    ddlOutcomeFilter.SelectedValue != "Call Back Later")
                {
                    cmd.Parameters.AddWithValue("@CallStatus", ddlOutcomeFilter.SelectedValue);
                }

                if (!string.IsNullOrEmpty(ddlStaffFilter.SelectedValue))
                {
                    cmd.Parameters.AddWithValue("@StaffName", ddlStaffFilter.SelectedValue);
                }

                if (!string.IsNullOrWhiteSpace(txtSearchCalls.Text))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + txtSearchCalls.Text.Trim() + "%");
                }

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptCallHistory.DataSource = dt;
                    rptCallHistory.DataBind();

                    // sakshi - Show empty state if no records match
                    trNoRecords.Visible = (dt.Rows.Count == 0);
                }
            }
        }
    }

    // sakshi - Bind all employees and callers in dropdown
    private void BindStaffFilter()
    {
        using (SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
        {
            string query = @"
            SELECT DISTINCT employee_name AS called_by
            FROM tbl_employees
            WHERE employee_name IS NOT NULL AND LTRIM(RTRIM(employee_name)) <> ''
            UNION
            SELECT DISTINCT called_by
            FROM tbl_lead_call_history
            WHERE called_by IS NOT NULL AND LTRIM(RTRIM(called_by)) <> ''
            ORDER BY called_by";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    ddlStaffFilter.DataSource = dr;
                    ddlStaffFilter.DataTextField = "called_by";
                    ddlStaffFilter.DataValueField = "called_by";
                    ddlStaffFilter.DataBind();
                }
            }
        }

        // sakshi - All Staff hamesha sabse upar rahega
        ddlStaffFilter.Items.Insert(0, new ListItem("All Staff", ""));
    }
}
