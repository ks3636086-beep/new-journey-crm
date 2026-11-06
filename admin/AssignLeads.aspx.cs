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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindAssignableLeads();
        }
    }

    private void BindAssignableLeads()
    {
        string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
            SELECT
                lead_code,
                client_name,
                mobile,
                city,
                destination,
                created_by,
                assigned_employee_id,
                lead_status,
                lead_priority,
                followup_date
            FROM tbl_leads
            ORDER BY lead_code DESC";

            using (SqlDataAdapter da = new SqlDataAdapter(query, con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptAssignableLeads.DataSource = dt;
                rptAssignableLeads.DataBind();
            }
        }
    }

}

