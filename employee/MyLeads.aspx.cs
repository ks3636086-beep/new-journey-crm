using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyLeads : System.Web.UI.Page
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
            BindMyLeads();
        }
    }

    private void BindMyLeads()
    {
        try
        {
            string query = @"SELECT lead_code, client_name, mobile, city,
                                destination, created_by, assigned_employee_id,
                                lead_status, lead_priority, followup_date
                         FROM tbl_leads
                         WHERE created_by = @CreatedBy
                         ORDER BY lead_code DESC";

            using (SqlCommand cmd = new SqlCommand(query, ob.con))
            {
                cmd.Parameters.AddWithValue(
                    "@CreatedBy",
                    Convert.ToString(Session["employee_name"])
                );

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptMyLeads.DataSource = dt;
                    rptMyLeads.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            //lblMessage.Text = Server.HtmlEncode(ex.Message);
        }
    }

    protected void btnEditLead_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        string leadCode = btn.CommandArgument;

        string query = @"SELECT * FROM dbo.tbl_leads
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

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];

                    hfEditLeadCode.Value = Convert.ToString(dr["lead_code"]);

                    txtEditClientName.Text = Convert.ToString(dr["client_name"]);
                    txtEditMobile.Text = Convert.ToString(dr["mobile"]);
                    txtEditAltMobile.Text = Convert.ToString(dr["alternate_mobile"]);
                    txtEditCity.Text = Convert.ToString(dr["city"]);
                    txtEditDestination.Text = Convert.ToString(dr["destination"]);

                    txtEditTravelDate.Text = dr["travel_date"] == DBNull.Value
                        ? ""
                        : Convert.ToDateTime(dr["travel_date"]).ToString("yyyy-MM-dd");

                    ddlEditLeadStatus.SelectedValue =
                        Convert.ToString(dr["lead_status"]);

                    ddlEditLeadPriority.SelectedValue =
                        Convert.ToString(dr["lead_priority"]);

                    txtEditFollowUp.Text = dr["followup_date"] == DBNull.Value
                        ? ""
                        : Convert.ToDateTime(dr["followup_date"]).ToString("yyyy-MM-ddTHH:mm");

                    txtEditRemarks.Text = Convert.ToString(dr["remarks"]);

                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "ShowEditModal",
                        "var editModal = new bootstrap.Modal(document.getElementById('leadEditModal')); editModal.show();",
                        true
                    );
                }
            }
        }
    }

    protected void btnSaveLeadEdit_Click(object sender, EventArgs e)
    {
        try
        {
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
                remarks = @remarks
            WHERE lead_code = @lead_code
            AND created_by = @created_by";

            using (SqlCommand cmd = new SqlCommand(query, ob.con))
            {
                cmd.Parameters.AddWithValue("@lead_code", hfEditLeadCode.Value);
                cmd.Parameters.AddWithValue("@created_by",
                    Convert.ToString(Session["employee_name"]));

                cmd.Parameters.AddWithValue("@client_name", txtEditClientName.Text.Trim());
                cmd.Parameters.AddWithValue("@mobile", txtEditMobile.Text.Trim());

                cmd.Parameters.AddWithValue("@alternate_mobile",
                    string.IsNullOrWhiteSpace(txtEditAltMobile.Text)
                    ? (object)DBNull.Value : txtEditAltMobile.Text.Trim());

                cmd.Parameters.AddWithValue("@city", txtEditCity.Text.Trim());
                cmd.Parameters.AddWithValue("@destination", txtEditDestination.Text.Trim());

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

                cmd.Parameters.AddWithValue("@remarks",
                    string.IsNullOrWhiteSpace(txtEditRemarks.Text)
                    ? (object)DBNull.Value : txtEditRemarks.Text.Trim());

                if (ob.con.State != ConnectionState.Open)
                    ob.con.Open();

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    BindMyLeads();

                    ClientScript.RegisterStartupScript(
                        this.GetType(), "success",
                        "alert('Lead updated successfully!');",
                        true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(
                        this.GetType(), "notfound",
                        "alert('Lead not found or you do not have permission to update it.');",
                        true);
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(), "error",
                "alert('" + System.Web.HttpUtility.JavaScriptStringEncode(ex.Message) + "');",
                true);
        }
        finally
        {
            if (ob.con.State == ConnectionState.Open)
                ob.con.Close();
        }
    }
}

