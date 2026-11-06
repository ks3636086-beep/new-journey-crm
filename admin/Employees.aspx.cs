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

    protected void btnUpdateEmployee_Click(object sender, EventArgs e)
    {
        try
        {
            int id = 0;
            if (!string.IsNullOrEmpty(edit_id.Value))
            {
                int.TryParse(edit_id.Value, out id);
            }
            else if (!string.IsNullOrEmpty(Request.Form["edit_id"]))
            {
                int.TryParse(Request.Form["edit_id"], out id);
            }

            if (id <= 0)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "UpdateError",
                    "alert('Please select an employee to edit.');",
                    true
                );
                return;
            }

            string name = edit_name.Text.Trim();
            string mobile = edit_mobile.Text.Trim();
            string email = edit_email.Text.Trim();
            string username = edit_username.Text.Trim();
            string password = edit_password.Text.Trim();
            string category = edit_category.SelectedValue;
            string status = edit_status.SelectedValue;

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(mobile) ||
                string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(username))
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "UpdateError",
                    "alert('Please fill all required fields.');",
                    true
                );
                return;
            }

            // Hash password if admin entered a new password
            if (!string.IsNullOrWhiteSpace(password))
            {
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

                password = Convert.ToBase64String(salt) + ":" + Convert.ToBase64String(hash);
            }

            if (ob.con.State == ConnectionState.Closed)
                ob.con.Open();

            ob.update_employee(
                id, name, mobile, email,
                username, password, category, status
            );

            ob.con.Close();

            BindEmployees();

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "UpdateSuccess",
                "alert('Employee updated successfully!');",
                true
            );
        }
        catch (Exception ex)
        {
            if (ob.con.State == ConnectionState.Open)
                ob.con.Close();

            string error = System.Web.HttpUtility.JavaScriptStringEncode(ex.Message);

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "UpdateError",
                "alert('" + error + "');",
                true
            );
        }
    }

    protected void btnDeleteEmployee_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;

        int employeeId = Convert.ToInt32(btn.CommandArgument);

        try
        {
            string query = @"DELETE FROM dbo.tbl_employees
                         WHERE employee_id = @employee_id";

            using (SqlCommand cmd = new SqlCommand(query, ob.con))
            {
                cmd.Parameters.AddWithValue("@employee_id", employeeId);

                if (ob.con.State != ConnectionState.Open)
                    ob.con.Open();

                cmd.ExecuteNonQuery();
            }

            BindEmployees();

            ClientScript.RegisterStartupScript(
                this.GetType(), "success",
                "alert('Employee deleted successfully!');", true);
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(), "error",
                "alert('" + System.Web.HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
        }
        finally
        {
            if (ob.con.State == ConnectionState.Open)
                ob.con.Close();
        }
    }
}

