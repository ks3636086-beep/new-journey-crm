
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Admin_Login : System.Web.UI.Page
{
    Master ob = new Master();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click1(object sender, EventArgs e)
    {
        string login = txtemail.Text.Trim();
        string password = txtpassword.Text;

        if (login == "" || password == "")
        {
            lblMessage.Text = "Please enter Email and Password.";
            return;
        }

        try
        {
            string query = @"SELECT * FROM ecommerce_backend
                 WHERE backend_email = @login";


            using (SqlCommand cmd = new SqlCommand(query, ob.con))
            {
                cmd.Parameters.Add("@login", SqlDbType.NVarChar).Value = login;

                ob.con.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        string dbPassword = dr["backend_password"].ToString();

                        if (password == dbPassword)
                        {
                            Session["id"] = dr["id"].ToString();
                            Session["backend_name"] = dr["backend_name"].ToString();
                            Session["backend_email"] = dr["backend_email"].ToString();
                            Session["backend_role"] = dr["backend_role"].ToString();

                            Response.Redirect("Dashboard.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();
                            return;
                        }
                    }
                }
            }

            lblMessage.Text = "Invalid Email or Password.";
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
