using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AllLeads : System.Web.UI.Page
{
    Master ob = new Master();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_employees();
            bind_all_leads();
        }
    }

    private void bind_employees()
    {
        DataTable dt = ob.get_active_employees_for_assign();

        filterEmployee.DataSource = dt;
        filterEmployee.DataTextField = "display_name";
        filterEmployee.DataValueField = "employee_id";
        filterEmployee.DataBind();
        filterEmployee.Items.Insert(0, new ListItem("All Staff", ""));
        filterEmployee.Items.Insert(1, new ListItem("Unassigned", "unassigned"));

        ddlEditAssignedEmployee.DataSource = dt;
        ddlEditAssignedEmployee.DataTextField = "display_name";
        ddlEditAssignedEmployee.DataValueField = "employee_id";
        ddlEditAssignedEmployee.DataBind();
        ddlEditAssignedEmployee.Items.Insert(0, new ListItem("-- Unassigned --", ""));
    }

    private void bind_all_leads()
    {
        DataTable dt = ob.get_all_leads();

        rptAllLeads.DataSource = dt;
        rptAllLeads.DataBind();
    }

    protected void btnEditLead_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        string leadCode = btn.CommandArgument;

        DataTable dt = ob.get_lead_by_code(leadCode);
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];

            hfEditLeadCode.Value = Convert.ToString(dr["lead_code"]);
            txtEditClientName.Text = Convert.ToString(dr["client_name"]);
            txtEditMobile.Text = Convert.ToString(dr["mobile"]);
            txtEditAltMobile.Text = dr["alternate_mobile"] == DBNull.Value ? "" : Convert.ToString(dr["alternate_mobile"]);
            txtEditCity.Text = dr["city"] == DBNull.Value ? "" : Convert.ToString(dr["city"]);
            txtEditDestination.Text = dr["destination"] == DBNull.Value ? "" : Convert.ToString(dr["destination"]);

            txtEditTravelDate.Text = dr["travel_date"] == DBNull.Value
                ? ""
                : Convert.ToDateTime(dr["travel_date"]).ToString("yyyy-MM-dd");

            string status = Convert.ToString(dr["lead_status"]);
            if (ddlEditLeadStatus.Items.FindByValue(status) != null)
                ddlEditLeadStatus.SelectedValue = status;

            string priority = Convert.ToString(dr["lead_priority"]);
            if (ddlEditLeadPriority.Items.FindByValue(priority) != null)
                ddlEditLeadPriority.SelectedValue = priority;

            txtEditFollowUp.Text = dr["followup_date"] == DBNull.Value
                ? ""
                : Convert.ToDateTime(dr["followup_date"]).ToString("yyyy-MM-ddTHH:mm");

            string empId = Convert.ToString(dr["assigned_employee_id"]);
            if (!string.IsNullOrEmpty(empId) && ddlEditAssignedEmployee.Items.FindByValue(empId) != null)
                ddlEditAssignedEmployee.SelectedValue = empId;
            else
                ddlEditAssignedEmployee.SelectedValue = "";

            txtEditRemarks.Text = dr["remarks"] == DBNull.Value ? "" : Convert.ToString(dr["remarks"]);

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "OpenEditModal",
                "new bootstrap.Modal(document.getElementById('leadEditModal')).show();",
                true
            );
        }
    }

    protected void btnSaveLeadEdit_Click(object sender, EventArgs e)
    {
        try
        {
            string leadCode = hfEditLeadCode.Value;
            if (string.IsNullOrEmpty(leadCode)) return;

            string query = @"
            UPDATE dbo.tbl_leads
            SET client_name = @client_name,
                mobile = @mobile,
                alternate_mobile = @alternate_mobile,
                city = @city,
                destination = @destination,
                travel_date = @travel_date,
                lead_status = @lead_status,
                lead_priority = @lead_priority,
                followup_date = @followup_date,
                assigned_employee_id = @assigned_employee_id,
                remarks = @remarks
            WHERE lead_code = @lead_code";

            using (SqlCommand cmd = new SqlCommand(query, ob.con))
            {
                cmd.Parameters.AddWithValue("@lead_code", leadCode);
                cmd.Parameters.AddWithValue("@client_name", txtEditClientName.Text.Trim());
                cmd.Parameters.AddWithValue("@mobile", txtEditMobile.Text.Trim());

                cmd.Parameters.AddWithValue("@alternate_mobile",
                    string.IsNullOrWhiteSpace(txtEditAltMobile.Text)
                        ? (object)DBNull.Value : txtEditAltMobile.Text.Trim());

                cmd.Parameters.AddWithValue("@city",
                    string.IsNullOrWhiteSpace(txtEditCity.Text)
                        ? (object)DBNull.Value : txtEditCity.Text.Trim());

                cmd.Parameters.AddWithValue("@destination",
                    string.IsNullOrWhiteSpace(txtEditDestination.Text)
                        ? (object)DBNull.Value : txtEditDestination.Text.Trim());

                cmd.Parameters.AddWithValue("@travel_date",
                    string.IsNullOrWhiteSpace(txtEditTravelDate.Text)
                        ? (object)DBNull.Value
                        : Convert.ToDateTime(txtEditTravelDate.Text));

                cmd.Parameters.AddWithValue("@lead_status", ddlEditLeadStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@lead_priority", ddlEditLeadPriority.SelectedValue);

                cmd.Parameters.AddWithValue("@followup_date",
                    string.IsNullOrWhiteSpace(txtEditFollowUp.Text)
                        ? (object)DBNull.Value
                        : Convert.ToDateTime(txtEditFollowUp.Text));

                cmd.Parameters.AddWithValue("@assigned_employee_id",
                    string.IsNullOrWhiteSpace(ddlEditAssignedEmployee.SelectedValue)
                        ? (object)DBNull.Value : ddlEditAssignedEmployee.SelectedValue);

                cmd.Parameters.AddWithValue("@remarks",
                    string.IsNullOrWhiteSpace(txtEditRemarks.Text)
                        ? (object)DBNull.Value : txtEditRemarks.Text.Trim());

                if (ob.con.State != ConnectionState.Open)
                    ob.con.Open();

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    bind_all_leads();

                    ClientScript.RegisterStartupScript(
                        this.GetType(), "success",
                        "alert('Lead updated successfully!');",
                        true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(
                        this.GetType(), "error",
                        "alert('Lead update failed. Please try again.');",
                        true);
                }
            }
        }
        catch (Exception ex)
        {
            string error = System.Web.HttpUtility.JavaScriptStringEncode(ex.Message);
            ClientScript.RegisterStartupScript(this.GetType(), "error", "alert('Error: " + error + "');", true);
        }
    }
}
