using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AssignLeads : System.Web.UI.Page
{
    Master ob = new Master();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindAssignableLeads();
            bind_target_employees();
        }
    }

    private void BindAssignableLeads()
    {
        string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
        SELECT * FROM dbo.tbl_leads
        WHERE
        (@status = '' OR
        (@status = 'unassigned' AND ISNULL(assigned_employee_id,'') = '') OR
        (@status = 'assigned' AND ISNULL(assigned_employee_id,'') <> ''))
        AND (@priority = '' OR lead_priority = @priority)
        AND (@search = '' OR client_name LIKE '%'+@search+'%'
        OR mobile LIKE '%'+@search+'%' OR destination LIKE '%'+@search+'%')
        ORDER BY lead_code DESC";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@status", ddlAssignStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@priority", ddlAssignPriority.SelectedValue);
                cmd.Parameters.AddWithValue("@search", txtAssignSearch.Text.Trim());

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dt.Columns.Add("assigned_employee_name", typeof(string));

                    ob.con.Open();

                    foreach (DataRow row in dt.Rows)
                    {
                        string id = Convert.ToString(row["assigned_employee_id"]);

                        row["assigned_employee_name"] =
                            string.IsNullOrEmpty(id) ? "Unassigned" : ob.get_employee_name(id);
                    }

                    ob.con.Close();

                    rptAssignableLeads.DataSource = dt;
                    rptAssignableLeads.DataBind();
                }
            }
        }
    }


    protected void txtAssignSearch_TextChanged(object sender, EventArgs e)
    {
        BindAssignableLeads();
    }

    protected void ddlAssignStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindAssignableLeads();
    }

    protected void ddlAssignPriority_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindAssignableLeads();
    }
    private void bind_target_employees()
    {
        DataTable dt = ob.get_active_employees_for_assign();

        ddlTargetEmployee.DataSource = dt;
        ddlTargetEmployee.DataTextField = "display_name";
        ddlTargetEmployee.DataValueField = "employee_id";
        ddlTargetEmployee.DataBind();

        ddlTargetEmployee.Items.Insert(0,
            new ListItem("-- Choose Staff Member --", ""));
    }

    protected void btnAssignLeads_Click(object sender, EventArgs e)
    {
        try
        {
            string leadCodes = hfSelectedLeadCodes.Value;
            int employeeId = Convert.ToInt32(ddlTargetEmployee.SelectedValue);

            ob.con.Open();

            ob.assign_leads(leadCodes, employeeId);

            ob.con.Close();

            ClientScript.RegisterStartupScript(
                this.GetType(), "Success",
                "alert('Leads assigned successfully!');", true
            );
        }
        catch (Exception ex)
        {
            if (ob.con.State == ConnectionState.Open)
                ob.con.Close();

            hfSelectedLeadCodes.Value = "";
            ddlTargetEmployee.SelectedIndex = 0;

            ClientScript.RegisterStartupScript(
                this.GetType(), "Error",
                "alert('" + System.Web.HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true
            );
        }
    }

    protected void UnassignLead(string leadCode)
    {
        ob.unassign_lead(leadCode);
        BindAssignableLeads();

    }
}

