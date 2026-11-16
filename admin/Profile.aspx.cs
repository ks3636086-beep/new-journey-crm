using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Profile : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
    public enum MessageType { Success, Error, Info, Warning };
    string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

    Master ob = new Master();
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        // Session Check
        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            BindAdminProfile();
        }
    }

    private void BindAdminProfile()
    {
        try
        {
            int adminId = Convert.ToInt32(Session["id"]);
            DataTable dt = ob.get_admin_profile(adminId);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                txtAdminId.Text = dr["id"].ToString();
                txtBackendName.Text = dr["backend_name"].ToString();
                txtBackendEmail.Text = dr["backend_email"].ToString();
                txtBackendMobile.Text = dr["backend_mobileno"].ToString();
                txtBackendRole.Text = dr["backend_role"].ToString();
                txtBackendStatus.Text = dr["backend_status"].ToString();
                lblAdminDisplayName.Text = dr["backend_name"].ToString();

                // Name ka first letter avatar me dikhana
                string name = dr["backend_name"].ToString().Trim();
                if (!string.IsNullOrEmpty(name))
                    litAdminAvatar.Text = name.Substring(0, 1).ToUpper();
            }
        }
        catch (Exception ex)
        {
            lblProfileMsg.Text = "<div class='alert alert-danger py-2 px-3 small mb-3'>Error loading profile: " + ex.Message + "</div>";
        }
    }

    protected void btnSaveProfile_Click(object sender, EventArgs e)
    {
        try
        {
            int adminId = Convert.ToInt32(Session["id"]);
            string name = txtBackendName.Text.Trim();
            string email = txtBackendEmail.Text.Trim();
            string mobile = txtBackendMobile.Text.Trim();
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email))
            {
                lblProfileMsg.Text = "<div class='alert alert-warning py-2 px-3 small mb-3'>Name aur Email bharna zaroori hai.</div>";
                return;
            }
            bool isUpdated = ob.update_admin_profile(adminId, name, email, mobile);
            if (isUpdated)
            {
                // Session data update karein
                Session["backend_name"] = name;
                Session["backend_email"] = email;
                lblAdminDisplayName.Text = name;
                lblProfileMsg.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Profile successfully updated!');", true);
            }
            else
            {
                lblProfileMsg.Text = "<div class='alert alert-danger py-2 px-3 small mb-3'>Update nahi ho saka, kripya dobara try karein.</div>";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Update failed, please try again.');", true);
            }
        }
        catch (Exception ex)
        {
            lblProfileMsg.Text = "<div class='alert alert-danger py-2 px-3 small mb-3'>Error: " + ex.Message + "</div>";
        }
    }


    protected void btnUpdatePassword_Click(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        try
        {
            int adminId = Convert.ToInt32(Session["id"]);
            string currentPassword = txtCurrentPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(currentPassword) || string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill all password fields.');", true);
                return;
            }

            if (newPassword.Length < 4)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('New password must be at least 4 characters long.');", true);
                return;
            }

            if (newPassword != confirmPassword)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('New password and confirm password do not match.');", true);
                return;
            }

            if (currentPassword == newPassword)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('New password must be different from current password.');", true);
                return;
            }

            bool isUpdated = ob.update_admin_password(adminId, currentPassword, newPassword);

            if (isUpdated)
            {
                txtCurrentPassword.Text = "";
                txtNewPassword.Text = "";
                txtConfirmPassword.Text = "";
                lblPasswordMsg.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password updated successfully!');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Current password is incorrect.');", true);
            }
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Something went wrong. Please try again.');", true);
        }
    }
}
