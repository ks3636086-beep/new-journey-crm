using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Bookings : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
    public enum MessageType { Success, Error, Info, Warning };
    string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

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
            BindBookings();
        }
    }

    private void BindBookings()
    {
        try
        {
            int employeeId = Convert.ToInt32(Session["employee_id"]);
            string employeeName = Convert.ToString(Session["employee_name"]);
            DataTable dt = ob.get_employee_bookings_data(employeeId, employeeName);
            rptBookings.DataSource = dt;
            rptBookings.DataBind();
        }
        catch (Exception ex)
        {
            // Error handling
        }
    }

    protected void btnConfirmCloseTrip_Click(object sender, EventArgs e)
    {
        string leadCode = hfCloseLeadCode.Value;

        if (string.IsNullOrEmpty(leadCode))
        {
            return;
        }

        // Server-side validation: Trip cannot be closed before travel date
        DataTable dtLead = ob.get_lead_by_code(leadCode);
        if (dtLead.Rows.Count > 0 && dtLead.Rows[0]["travel_date"] != DBNull.Value)
        {
            DateTime travelDate = Convert.ToDateTime(dtLead.Rows[0]["travel_date"]);
            if (travelDate.Date > DateTime.Today)
            {
                ShowMessage("Trip cannot be closed before the travel date (" + travelDate.ToString("dd-MMM-yyyy") + ")!", MessageType.Warning);
                return;
            }
        }

        bool result = ob.close_employee_trip(leadCode);

        if (result)
        {
            ShowMessage("Trip successfully closed!", MessageType.Success);
            BindBookings();
        }
        else
        {
            ShowMessage("Trip already closed or lead not found!", MessageType.Warning);
        }
    }
}
