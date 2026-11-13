using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyProfile : System.Web.UI.Page
{
    // STEP 1: Yahan Master object declare karo
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
            BindEmployeeProfile();
        }
    }

    private void BindEmployeeProfile()
    {
        try
        {
            // 1. Logged-in employee ki ID session se lo
            if (Session["employee_id"] == null)
                return;

            int employeeId = Convert.ToInt32(Session["employee_id"]);

            // 2. Master class ka object banao
            Master ob = new Master();

            // 3. Database se data lao
            DataTable dt = ob.get_employee_profile(employeeId);

            // 4. Sabhi 10 fields me data set karo
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                profileDisplayName.InnerText = row["employee_name"].ToString();
                profileAvatar.InnerText = row["employee_name"].ToString().Trim().Substring(0, 1).ToUpper();
                profileDisplayId.InnerText = "Employee ID: #" + row["employee_code"].ToString();

                // 1. employee_id
                txtEmployeeId.Text = row["employee_id"].ToString();

                // 2. employee_code
                txtProfileEmpId.Text = row["employee_code"].ToString();

                // 3. employee_name
                txtProfileFullName.Text = row["employee_name"].ToString();

                // 4. employee_mobile
                txtProfilePhone.Text = row["employee_mobile"].ToString();

                // 5. employee_email
                txtProfileEmail.Text = row["employee_email"].ToString();

                // 6. employee_username
                txtProfileUsername.Text = row["employee_username"].ToString();

                // 7. employee_password
                txtProfilePassword.Attributes["value"] = row["employee_password"].ToString();

                // 8. employee_category
                txtProfileCategory.Text = row["employee_category"].ToString();

                // 9. employee_status
                txtProfileStatus.Text = row["employee_status"].ToString();

                // 10. created_at (Joining Date)
                if (row["created_at"] != DBNull.Value)
                {
                    txtProfileJoiningDate.Text = Convert.ToDateTime(row["created_at"]).ToString("dd-MMM-yyyy");
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("Profile Error: " + ex.Message);
        }
    }
}

