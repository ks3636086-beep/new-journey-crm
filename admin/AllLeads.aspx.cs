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
            bind_all_leads();
        }
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
            DataRow row = dt.Rows[0];

            hfEditLeadCode.Value = row["lead_code"].ToString();
            txtEditClientName.Text = row["client_name"].ToString();
            txtEditMobile.Text = row["mobile"].ToString();
            txtEditAltMobile.Text = row["alternate_mobile"].ToString();
            txtEditCity.Text = row["city"].ToString();
            txtEditDestination.Text = row["destination"].ToString();

            txtEditTravelDate.Text = row["travel_date"] == DBNull.Value
                ? ""
                : Convert.ToDateTime(row["travel_date"]).ToString("yyyy-MM-dd");

            ddlEditLeadStatus.SelectedValue = row["lead_status"].ToString();
            ddlEditLeadPriority.SelectedValue = row["lead_priority"].ToString();

            txtEditFollowUp.Text = row["followup_date"] == DBNull.Value
                ? ""
                : Convert.ToDateTime(row["followup_date"]).ToString("yyyy-MM-ddTHH:mm");

            txtEditRemarks.Text = row["remarks"].ToString();
        }

        ScriptManager.RegisterStartupScript(
            this, this.GetType(), "OpenEditModal",
            "var modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('leadEditModal')); modal.show();",
            true
        );
    }

    protected void btnSaveLeadEdit_Click(object sender, EventArgs e)
    {
        // Backend logic can be implemented by user
    }

    protected void btnSaveLeadEdit_Click1(object sender, EventArgs e)
    {
        try
        {
            string leadCode = hfEditLeadCode.Value;
            string clientName = txtEditClientName.Text.Trim();
            string mobile = txtEditMobile.Text.Trim();
            string alternateMobile = txtEditAltMobile.Text.Trim();
            string city = txtEditCity.Text.Trim();
            string destination = txtEditDestination.Text.Trim();

            object travelDate = string.IsNullOrWhiteSpace(txtEditTravelDate.Text)
                ? DBNull.Value
                : (object)Convert.ToDateTime(txtEditTravelDate.Text);

            string leadStatus = ddlEditLeadStatus.SelectedValue;
            string leadPriority = ddlEditLeadPriority.SelectedValue;

            object followupDate = string.IsNullOrWhiteSpace(txtEditFollowUp.Text)
                ? DBNull.Value
                : (object)Convert.ToDateTime(txtEditFollowUp.Text);

            string remarks = txtEditRemarks.Text.Trim();

            if (string.IsNullOrWhiteSpace(leadCode) ||
                string.IsNullOrWhiteSpace(clientName) ||
                string.IsNullOrWhiteSpace(mobile) ||
                string.IsNullOrWhiteSpace(leadStatus) ||
                string.IsNullOrWhiteSpace(leadPriority))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "Required", "alert('Please fill all required fields.');", true);
                return;
            }

            if (ob.con.State == ConnectionState.Closed)
                ob.con.Open();

            ob.update_lead(
                leadCode, clientName, mobile, alternateMobile,
                city, destination, travelDate, leadStatus,
                leadPriority, followupDate, remarks
            );

            ob.con.Close();

            bind_all_leads();

            ScriptManager.RegisterStartupScript(
                this, this.GetType(), "UpdateSuccess",
                "alert('Lead details updated successfully!');", true
            );
        }
        catch (Exception ex)
        {
            if (ob.con.State == ConnectionState.Open)
                ob.con.Close();

            string error = System.Web.HttpUtility.JavaScriptStringEncode(ex.Message);

            ScriptManager.RegisterStartupScript(
                this, this.GetType(), "UpdateError",
                "alert('" + error + "');", true
            );
        }
    }

    protected void btnDeleteLead_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        string leadCode = btn.CommandArgument;

        try
        {
            ob.delete_lead(leadCode);

            bind_all_leads();

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "DeleteSuccess",
                "alert('Lead deleted successfully!');",
                true
            );
        }
        catch (Exception ex)
        {
            string error = System.Web.HttpUtility.JavaScriptStringEncode(ex.Message);

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "DeleteError",
                "alert('" + error + "');",
                true
            );
        }
    }
}
