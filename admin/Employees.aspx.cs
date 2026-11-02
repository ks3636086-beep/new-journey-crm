using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employees : System.Web.UI.Page
{
    Master ob = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindEmployees();
        }
    }

    protected void btnCreateEmployee_Click(object sender, EventArgs e)
    {
        string name = txtName.Text.Trim();
        string mobile = txtMobile.Text.Trim();
        string email = txtEmail.Text.Trim();
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text;
        string category = ddlCategory.SelectedValue;
        string status = ddlStatus.SelectedValue;

        if (name == "" || mobile == "" || email == "" ||
            username == "" || password == "")
        {
            lblMessage.Text = "<span class='text-danger'>Please fill all required fields.</span>";
            return;
        }

        try
        {
            ob.con.Open();

            // Check duplicate email or username
            string checkQuery = @"SELECT COUNT(*) FROM tbl_employees
                                  WHERE employee_email = @Email
                                  OR employee_username = @Username";

            SqlCommand checkCmd = new SqlCommand(checkQuery, ob.con);

            checkCmd.Parameters.AddWithValue("@Email", email);
            checkCmd.Parameters.AddWithValue("@Username", username);

            int count = Convert.ToInt32(checkCmd.ExecuteScalar());

            if (count > 0)
            {
                lblMessage.Text = "<span class='text-danger'>Email or Username already exists.</span>";
                return;
            }

            string employeeCode = getemployee_id();

            // Hash password
            byte[] salt = new byte[16];

            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt);
            }

            byte[] hash;

            using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 100000))
            {
                hash = pbkdf2.GetBytes(32);
            }

            string hashedPassword =
                Convert.ToBase64String(salt) + ":" +
                Convert.ToBase64String(hash);

            // Insert employee
            string insertQuery = @"INSERT INTO tbl_employees
(employee_code, employee_name, employee_mobile, employee_email,
 employee_username, employee_password, employee_category, employee_status)
VALUES
(@EmployeeCode, @Name, @Mobile, @Email, @Username,
 @Password, @Category, @Status)";

            SqlCommand cmd = new SqlCommand(insertQuery, ob.con);

            cmd.Parameters.AddWithValue("@EmployeeCode", employeeCode);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Mobile", mobile);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", hashedPassword);
            cmd.Parameters.AddWithValue("@Category", category);
            cmd.Parameters.AddWithValue("@Status", status);

            cmd.ExecuteNonQuery();

            ClientScript.RegisterStartupScript(this.GetType(), "alert",
    "alert('Employee added successfully!');", true);

            lblMessage.Text = "<span class='text-success'>Employee created successfully!</span>";

            // Clear form
            txtName.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";

            ddlCategory.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "<span class='text-danger'>Error: " +
                              Server.HtmlEncode(ex.Message) + "</span>";
        }
        finally
        {
            if (ob.con.State == ConnectionState.Open)
            {
                ob.con.Close();
            }
        }

    }

    private void BindEmployees()
    {
        try
        {
            string query = @"SELECT employee_id, employee_code, employee_name,
       employee_mobile, employee_email, employee_username,
       employee_category, employee_status
FROM tbl_employees
ORDER BY employee_id DESC";

            using (SqlCommand cmd = new SqlCommand(query, ob.con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptEmployees.DataSource = dt;
                    rptEmployees.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message);
        }
    }

    private string getemployee_id()
    {
        string empid = string.Empty;



        string query = "SELECT ISNULL(MAX(employee_id), 0) + 1 FROM tbl_employees";

        SqlCommand cmd = new SqlCommand(query, ob.con);

        int num = Convert.ToInt32(cmd.ExecuteScalar());

        empid = "EMP-" + num.ToString("D4");


        return empid;
    }

}

