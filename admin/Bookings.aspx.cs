using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Bookings : System.Web.UI.Page
{
    Master ob = new Master();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            BindAdminBookings();
            BindBookingCounts();
        }
    }

    private void BindAdminBookings()
    {
        try
        {
            // Sabhi staff ka data fetch karega (Bina employee filter ke)
            DataTable dt = ob.get_all_bookings_data();
            rptAdminBookings.DataSource = dt;
            rptAdminBookings.DataBind();
        }
        catch (Exception ex)
        {
            // Error handling
        }
    }

    private void BindBookingCounts()
    {
        try
        {
            // 1. Total Confirmed Bookings count
            lblTotalConfirmed.Text = ob.get_confirmed_leads().ToString();
            // 2. Returned (Pending Close) count
            lblTotalReturned.Text = ob.get_returned_bookings_count().ToString();
        }
        catch (Exception ex)
        {
            // Error handling
        }
    }
     
}

