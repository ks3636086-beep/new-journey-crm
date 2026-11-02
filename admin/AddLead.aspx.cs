using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddLead : System.Web.UI.Page
{
    Master ob = new Master();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetAddedBy();
            LoadActiveEmployees();
        }
    }

    private void SetAddedBy()
    {
        string adminName = "Admin";
        if (Session["backend_name"] != null && !string.IsNullOrEmpty(Session["backend_name"].ToString()))
        {
            adminName = Session["backend_name"].ToString();
        }
        else if (Session["backend_email"] != null && !string.IsNullOrEmpty(Session["backend_email"].ToString()))
        {
            adminName = Session["backend_email"].ToString();
        }

        txtAddedBy.Text = adminName + " (Administrator)";
    }

    private void LoadActiveEmployees()
    {
        try
        {
            string query = @"SELECT employee_id, 
                                    (employee_name + ' (' + employee_category + ')') AS emp_display 
                             FROM tbl_employees 
                             WHERE LOWER(employee_status) = 'active' 
                             ORDER BY employee_name ASC";

            using (SqlCommand cmd = new SqlCommand(query, ob.con))
            {
                if (ob.con.State == ConnectionState.Closed)
                {
                    ob.con.Open();
                }

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    ddlAssignedEmployee.Items.Clear();
                    ddlAssignedEmployee.Items.Add(new ListItem("-- Unassigned (Assign Later) --", ""));

                    while (dr.Read())
                    {
                        string id = dr["employee_id"].ToString();
                        string name = dr["emp_display"].ToString();
                        ddlAssignedEmployee.Items.Add(new ListItem(name, id));
                    }
                }
            }
        }
        catch (Exception)
        {
            if (ddlAssignedEmployee.Items.Count == 0)
            {
                ddlAssignedEmployee.Items.Add(new ListItem("-- Unassigned (Assign Later) --", ""));
            }
        }
        finally
        {
            if (ob.con.State == ConnectionState.Open)
            {
                ob.con.Close();
            }
        }
    }
}
