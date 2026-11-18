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

    protected void btnUploadBulk_Click(object sender, EventArgs e)
    {
        try
        {
            if (!fuBulkLeads.HasFile)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "noFile",
                    "alert('Please select an Excel (.xlsx) or CSV (.csv) file to upload.');", true);
                return;
            }

            string ext = System.IO.Path.GetExtension(fuBulkLeads.FileName).ToLowerInvariant();
            if (ext != ".csv" && ext != ".xlsx")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "invalidExt",
                    "alert('Invalid file format. Please upload a .csv or .xlsx file.');", true);
                return;
            }

            if (fuBulkLeads.PostedFile.ContentLength > 5 * 1024 * 1024)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fileSize",
                    "alert('File size exceeds the 5 MB limit.');", true);
                return;
            }

            string createdBy = Session["admin_name"] != null ? Session["admin_name"].ToString() : "Admin";
            string assignedEmpId = null;

            BulkImportResult result;
            using (var stream = fuBulkLeads.PostedFile.InputStream)
            {
                result = ob.ImportBulkLeads(stream, fuBulkLeads.FileName, createdBy, assignedEmpId);
            }

            string summaryMsg = string.Format("Import Summary:\\n- Total rows: {0}\\n- Successfully imported: {1}\\n- Skipped (Duplicates): {2}\\n- Skipped (Invalid data): {3}",
                result.TotalRows, result.SuccessCount, result.DuplicateCount, result.InvalidCount);

            if (result.ErrorMessages.Count > 0)
            {
                var topErrors = result.ErrorMessages.Take(4);
                summaryMsg += "\\n\\nDetails:\\n" + string.Join("\\n", topErrors);
                if (result.ErrorMessages.Count > 4)
                {
                    summaryMsg += string.Format("\\n...and {0} more rows.", result.ErrorMessages.Count - 4);
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "importResult",
                "alert('" + HttpUtility.JavaScriptStringEncode(summaryMsg) + "');", true);
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "uploadError",
                "alert('An unexpected error occurred during import: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
        }
    }
}
