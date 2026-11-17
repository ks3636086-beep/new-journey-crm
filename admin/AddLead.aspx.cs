using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddLead : System.Web.UI.Page
{
    Master ob = new Master();

    protected void Page_Load(object sender, EventArgs e)
    {
        // Double-click prevent: Disable button and show saving text on click once client validation passes
        btnSaveLead.Attributes.Add("onclick", "if(typeof(Page_ClientValidate) === 'function' && !Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Saving Lead...'; " + ClientScript.GetPostBackEventReference(btnSaveLead, null) + ";");
    }

    // Admin Add Lead
    protected void btnSaveLead_Click(object sender, EventArgs e)
    {
        try
        {
            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }

            ob.con.Open();

            ob.insert_lead(
                txtClientName.Text.Trim(),
                txtMobile.Text.Trim(),
                string.IsNullOrWhiteSpace(txtAltMobile.Text) ? null : txtAltMobile.Text.Trim(),
                txtCity.Text.Trim(),
                txtDestination.Text.Trim(),
                string.IsNullOrWhiteSpace(txtTravelDate.Text) ? (object)DBNull.Value : Convert.ToDateTime(txtTravelDate.Text),
                ddlLeadStatus.SelectedValue,
                ddlLeadPriority.SelectedValue,
                string.IsNullOrWhiteSpace(txtFollowUpDate.Text) ? (object)DBNull.Value : Convert.ToDateTime(txtFollowUpDate.Text),
                string.IsNullOrWhiteSpace(txtRemarks.Text) ? null : txtRemarks.Text.Trim(),
                "Admin",
                null
            );

            // Clear all input fields after successful save
            ClearFields();

            ClientScript.RegisterStartupScript(this.GetType(), "success",
                "alert('Lead added successfully!');", true);
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "error",
                "alert('" + System.Web.HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
        }
        finally
        {
            if (ob.con.State == ConnectionState.Open)
            {
                ob.con.Close();
            }
        }
    }

    private void ClearFields()
    {
        txtClientName.Text = string.Empty;
        txtMobile.Text = string.Empty;
        txtAltMobile.Text = string.Empty;
        txtCity.Text = string.Empty;
        txtDestination.Text = string.Empty;
        txtTravelDate.Text = string.Empty;
        ddlLeadStatus.SelectedIndex = 0;
        ddlLeadPriority.SelectedIndex = 0;
        txtFollowUpDate.Text = string.Empty;
        txtRemarks.Text = string.Empty;
    }
}
