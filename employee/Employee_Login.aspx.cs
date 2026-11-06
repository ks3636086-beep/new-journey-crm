using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web.UI;

public partial class Employee_Login : System.Web.UI.Page
{
    Master ob = new Master();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        string login = txtLogin.Text.Trim();
        string password = txtPassword.Text;

        if (login == "" || password == "")
        {
            lblMessage.Text = "Please enter Username/Email and Password.";
            return;
        }

        try
        {
            string query = @"SELECT * FROM tbl_employees
                 WHERE (employee_username = @login
                 OR employee_email = @login)
                 AND employee_status = 'Active'";

            using (SqlCommand cmd = new SqlCommand(query, ob.con))
            {
                cmd.Parameters.Add("@login", SqlDbType.NVarChar).Value = login;

                ob.con.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        string dbPassword = dr["employee_password"].ToString();

                        if (password == dbPassword)
                        {
                            Session["employee_id"] = dr["employee_id"].ToString();
                            Session["employee_name"] = dr["employee_name"].ToString();
                            Session["employee_mobile"] = dr["employee_mobile"].ToString();
                            Session["employee_email"] = dr["employee_email"].ToString();
                            Session["employee_username"] = dr["employee_username"].ToString();
                            Session["employee_category"] = dr["employee_category"].ToString();
                            Session["employee_code"] = dr["employee_code"].ToString();

                            Response.Redirect("Dashboard.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();
                            return;
                        }
                    }
                }
            }

            lblMessage.Text = "Invalid Username/Email or Password.";
        }
        catch (Exception ex)
        {
            lblMessage.Text = Server.HtmlEncode(ex.Message);
        }
        finally
        {
            if (ob.con.State == ConnectionState.Open)
                ob.con.Close();
        }
    }
}

 